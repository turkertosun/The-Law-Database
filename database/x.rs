mod json_forms;
use json_forms::*;

use rocket::{
    serde::json::{Json, Value, json},
    http::{Header, Method, Status},
    launch, post, routes, catch, catchers, get,
    fairing::{Fairing, Info, Kind},
    Request, Response,
};

#[launch]
fn rocket() -> _ {
    rocket::build()
        .mount("/", routes![signup, signin, search, add, update, delete])
        .register("/", catchers![default_catcher])
        .attach(Cors)
}

#[post("/signup", data = "<_request>")]
fn signup(_request: Json<SignupRequest>) -> Json<SignupResponse> {
    Json(SignupResponse {
        status: "SUCCESS".to_string(),
        jwt: Some("token".to_string()),
    })
}

#[post("/signin", data = "<_request>")]
fn signin(_request: Json<SigninRequest>) -> Json<SigninResponse> {
    Json(SigninResponse {
        status: "SUCCESS".to_string(),
        jwt: Some("token".to_string()),
    })
}

#[get("/search")]
fn search() -> Json<SearchResponse> {
    let cases = vec![
        SearchResponseCase {
            case_id: 3,
            case_name: "Murder of Bob".to_string(),
            case_description: "Bob was murdered".to_string(),
            court: "Royal High Court of Bobtown".to_string(),
            case_type: "CRIMINAL".to_string(),
            availability: "ONGOING".to_string(),
            judge_name: "Frank".to_string(),
            court_region: "Houston".to_string(),
            state: "TX".to_string(),
            legal_area: "CRIMINAL".to_string(),
        },
        SearchResponseCase {
            case_id: 4,
            case_name: "Bill's disappearance".to_string(),
            case_description: "Bill went missing last night".to_string(),
            court: "Royal High Court of Bobtown".to_string(),
            case_type: "CRIMINAL".to_string(),
            availability: "FINISHED".to_string(),
            judge_name: "Fred".to_string(),
            court_region: "Houston".to_string(),
            state: "TX".to_string(),
            legal_area: "CRIMINAL".to_string(),
        },
    ];

    Json(SearchResponse { cases })
}

#[post("/add", data = "<_request>")]
fn add(_request: Json<AddRequest>) -> Json<AddResponse> {
    Json(AddResponse {
        status: String::from("SUCCESS"),
        case_id: Some(99),
    })
}

#[post("/update", data = "<_request>")]
fn update(_request: Json<UpdateRequest>) -> Json<UpdateResponse> {
    Json(UpdateResponse {
        status: String::from("SUCCESS"),
    })
}

#[post("/delete", data = "<_request>")]
fn delete(_request: Json<DeleteRequest>) -> Json<DeleteResponse> {
    Json(DeleteResponse {
        status: String::from("SUCCESS"),
    })
}

/// CORS Fairing to handle preflight requests and set CORS headers
pub struct Cors;

#[rocket::async_trait]
impl Fairing for Cors {
    fn info(&self) -> Info {
        Info {
            name: "CORS Fairing",
            kind: Kind::Response,
        }
    }

    async fn on_response<'r>(&self, _request: &'r Request<'_>, response: &mut Response<'r>) {
        response.set_header(Header::new("Access-Control-Allow-Origin", "*"));
        response.set_header(Header::new("Access-Control-Allow-Methods", "POST, GET, OPTIONS"));
        response.set_header(Header::new("Access-Control-Allow-Headers", "Content-Type, Authorization"));
        response.set_header(Header::new("Access-Control-Allow-Credentials", "true"));
        response.set_header(Header::new("Access-Control-Expose-Headers", "Content-Type, Authorization"));
        if _request.method() == Method::Options {
            response.set_status(Status::NoContent);
        }
    }
}

// Updated the default catcher to return an empty JSON response
#[catch(default)]
fn default_catcher(status: Status, _request: &Request) -> Json<Value> {
    Json(json!({
        "status": status.code,
        "message": "An error occurred"
    }))
}