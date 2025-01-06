use serde::{Serialize, Deserialize};

#[derive(Deserialize)]
pub struct SignupRequest {
    pub username: String,
    pub password: String,
    pub email: String,
}

#[derive(Serialize)]
pub struct SignupResponse {
    pub status: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub jwt: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub reason: Option<String>,
}