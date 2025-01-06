use serde::{Serialize, Deserialize};

#[derive(Deserialize)]
pub struct DeleteRequest {
    #[serde(alias = "caseId")]
    pub case_id: usize,
    pub jwt: String,
}

#[derive(Serialize)]
pub struct DeleteResponse {
    pub status: String,
}