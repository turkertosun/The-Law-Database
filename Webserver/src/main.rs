use tera::Tera;
use rocket::{
    form::{
        Form,
        Strict,
    },
    http::{
        Status,
        ContentType,
        CookieJar,
        Cookie,
    },
    response::{
        content::RawHtml,
        Redirect
    },
    get, launch, post, routes, FromForm, State
};
use hmac::{Hmac, Mac};
use jwt::{SignWithKey, VerifyWithKey};
use sha2::Sha256;
use std::collections::BTreeMap;

static SECRET: &'static str = "SECRET";

struct Templates {
    tera: Tera
}

#[derive(FromForm)]
struct LoginForm<'a> {
    username: &'a str,
    password: &'a str,
}

struct Account {
    account_id: String
}

fn verify_jwt(cookies: &CookieJar<'_>) -> Option<Account> {
    match cookies.get("token") {
        Some(cookie) => {
            let token = cookie.value();
            let key: Hmac<Sha256> = Hmac::new_from_slice(SECRET.as_bytes()).unwrap();
            let claims: BTreeMap<String, String> = match token.verify_with_key(&key) {
                Ok(c) => c,
                Err(_) => {
                    // This token is invalid!
                    return None;
                },
            };

            // The token is valid and the claims are verified
            return Some(Account { account_id: claims.get("account_id").unwrap().to_string()})
        },
        None => {
            // Cookie is missing! This user is unauthenticated.
            return None;
        }
    }
}

#[get("/")]
fn index(templates: &State<Templates>, cookies: &CookieJar<'_>) -> Result<RawHtml<String>, Redirect> {
    // Verify the JWT
    let account = match verify_jwt(cookies) {
        Some(a) => a,
        None => {
            // The JWT is missing or invalid. Redirect to login page.
            return Err(Redirect::to("/login"));
        }
    };

    // Render the home page with the account information
    let mut context = tera::Context::new();
    context.insert("account_id", &account.account_id);
    Ok(RawHtml(templates.tera.render("index", &context).unwrap()))
}

#[get("/login")]
fn login_get(templates: &State<Templates>) -> RawHtml<String> {
    // TODO: Use Post->Redirect->Get to prevent form resubmission

    let mut context = tera::Context::new();
    context.insert("login_failed", &false);
    RawHtml(templates.tera.render("login", &context).unwrap())
}

#[post("/login", data = "<info>")]
fn login_post(templates: &State<Templates>, cookies: &CookieJar<'_>, info: Form<Strict<LoginForm<'_>>>) -> Result<Redirect, RawHtml<String>> {
    if info.username == "admin" && info.password == "password" {
        // The user is valid. Generate a JWT and add to cookies (TEMPORARY UNTIL AUTH SERVER IS IMPLEMENTED)
        let key: Hmac<Sha256> = Hmac::new_from_slice(SECRET.as_bytes()).unwrap();
        let mut claims = BTreeMap::new();
        claims.insert("account_id", "0123456789");
        let token_str = claims.sign_with_key(&key).unwrap();

        cookies.add(("token", token_str));

        Ok(Redirect::to("/"))
    } else {
        // Re-send the login page with the failure message
        let mut context = tera::Context::new();
        context.insert("login_failed", &true);
        Err(RawHtml(templates.tera.render("login", &context).unwrap()))
    }
}

#[get("/logout")]
fn logout_get(cookies: &CookieJar<'_>) -> Redirect {
    // This endpoint clears
    cookies.remove("token");
    Redirect::to("/login")
}

#[launch]
fn rocket() -> _ {
    // Load site html
    use std::fs;
    const SITE_PATH: &'static str = "../Website/dist";
    let mut tera = Tera::default();
    for file in fs::read_dir(SITE_PATH).unwrap() {
        let file = file.unwrap();
        let file_name = String::from(file.file_name().to_string_lossy());
        if file_name.ends_with(".html") {
            let name = file_name.strip_suffix(".html").unwrap();
            tera.add_raw_template(name, fs::read_to_string(file.path()).unwrap().as_str()).unwrap();
            println!("Added template for {}", name);
        }
    }

    // Start the web server
    rocket::build()
        .manage(Templates { tera })
        .mount("/", routes![index, login_get, login_post, logout_get])
}