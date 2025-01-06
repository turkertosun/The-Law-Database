use serde::{Serialize, Deserialize};

#[derive(Deserialize)]
pub struct AddRequest {
    pub query: String,
    pub filters: AddRequestCase,
    pub jwt: String,
}

#[derive(Deserialize)]
pub struct AddRequestCase {
    #[serde(alias = "caseName")]
    pub case_name: String,
    #[serde(alias = "caseDescription")]
    pub case_description: String,
    pub court: String,
    #[serde(alias = "caseType")]
    pub case_type: String,
    pub availability: String,
    #[serde(alias = "judgeName")]
    pub judge_name: String,
    #[serde(alias = "courtRegion")]
    pub court_region: String,
    pub state: String,
    #[serde(alias = "legalArea")]
    pub legal_area: String,
}

#[derive(Serialize)]
pub struct AddResponse {
    pub status: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    #[serde(alias = "caseId")]
    pub case_id: Option<usize>,
}