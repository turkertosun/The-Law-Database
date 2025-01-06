// main.rs
#[macro_use] extern crate rocket;

use rocket::serde::{Serialize, Deserialize, json::Json, json::Value, json};
use rocket::{get, post, routes, catch, catchers, Request, Response, http::{Header, Method, Status}, fairing::{Fairing, Info, Kind}};

// CORS Fairing tanımı
pub struct Cors;

#[rocket::async_trait]
impl Fairing for Cors {
    fn info(&self) -> Info {
        Info {
            name: "CORS Fairing",
            kind: Kind::Response,
        }
    }

    async fn on_response<'r>(&self, request: &'r Request<'_>, response: &mut Response<'r>) {
        response.set_header(Header::new("Access-Control-Allow-Origin", "*"));
        response.set_header(Header::new("Access-Control-Allow-Methods", "POST, GET, OPTIONS"));
        response.set_header(Header::new("Access-Control-Allow-Headers", "Content-Type, Authorization"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
        response.set_header(Header::new("Access-Control-Expose-Headers", "Content-Type, Authorization"));

        if request.method() == Method::Options {
            response.set_status(Status::NoContent);
        }
    }
}

// JSON veri yapıları
#[derive(Debug, Deserialize)]
struct SignupRequest {
    username: String,
    password: String,
    email: String,
}

#[derive(Debug, Serialize)]
struct SignupResponse {
    status: String,
    jwt: Option<String>,
    reason: Option<String>,
}

#[derive(Debug, Deserialize)]
struct SigninRequest {
    email: String,
    password: String,
}

#[derive(Debug, Serialize)]
struct SigninResponse {
    status: String,
    jwt: Option<String>,
    reason: Option<String>,
}

#[derive(Debug, Deserialize)]
struct AddRequest {
    // Add isteği için gerekli alanlar
}

#[derive(Debug, Serialize)]
struct AddResponse {
    status: String,
    case_id: Option<u32>,
}

#[derive(Debug, Deserialize)]
struct UpdateRequest {
    // Update isteği için gerekli alanlar
}

#[derive(Debug, Serialize)]
struct UpdateResponse {
    status: String,
}

#[derive(Debug, Deserialize)]
struct DeleteRequest {
    // Delete isteği için gerekli alanlar
}

#[derive(Debug, Serialize)]
struct DeleteResponse {
    status: String,
}

#[derive(Debug, Deserialize)]
struct SearchRequest {
    // Arama isteği için gerekli alanlar
}

#[derive(Debug, Serialize)]
struct SearchResponse {
    cases: Vec<SearchResponseCase>,
}

#[derive(Debug, Serialize)]
struct SearchResponseCase {
    case_id: u32,
    case_name: String,
    case_description: String,
    court: String,
    case_type: String,
    availability: String,
    judge_name: String,
    court_region: String,
    state: String,
    legal_area: String,
}

// Rota tanımları
#[post("/signup", data = "<_request>")]
async fn signup(_request: Json<SignupRequest>) -> Json<SignupResponse> {
    Json(SignupResponse {
        status: "SUCCESS".to_string(),
        jwt: Some("token".to_string()),
        reason: None,
    })
}

#[post("/signin", data = "<_request>")]
async fn signin(_request: Json<SigninRequest>) -> Json<SigninResponse> {
    Json(SigninResponse {
        status: "SUCCESS".to_string(),
        jwt: Some("token".to_string()),
        reason: None,
    })
}

#[get("/search")]
async fn search() -> Json<SearchResponse> {
    let cases = vec![
        SearchResponseCase {
            case_id: 1,
            case_name: "Örnek Dava".to_string(),
            case_description: "Bu bir örnek davadır.".to_string(),
            court: "İstanbul Mahkemesi".to_string(),
            case_type: "CEZA".to_string(),
            availability: "AÇIK".to_string(),
            judge_name: "Hakim Bey".to_string(),
            court_region: "İstanbul".to_string(),
            state: "TR".to_string(),
            legal_area: "Ceza Hukuku".to_string(),
        },
        // Daha fazla örnek ekleyebilirsiniz
    ];
    Json(SearchResponse { cases })
}

#[post("/add", data = "<_request>")]
async fn add(_request: Json<AddRequest>) -> Json<AddResponse> {
    Json(AddResponse {
        status: "SUCCESS".to_string(),
        case_id: Some(99),
    })
}

#[post("/update", data = "<_request>")]
async fn update(_request: Json<UpdateRequest>) -> Json<UpdateResponse> {
    Json(UpdateResponse {
        status: "SUCCESS".to_string(),
    })
}

#[post("/delete", data = "<_request>")]
async fn delete(_request: Json<DeleteRequest>) -> Json<DeleteResponse> {
    println!("{:?}", _request);
    Json(DeleteResponse {
        status: "SUCCESS".to_string(),
    })
}

// Default catcher
#[catch(default)]
fn default_catcher(status: Status, _request: &Request) -> Json<Value> {
    Json(json!({
        "status": status.code,
        "message": "An error occurred"
    }))
}

// Rocket uygulamasını başlatma
#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![signup, signin, search, add, update, delete])
        .register("/", catchers![default_catcher])
        .attach(Cors)
}
