use serde::{Serialize, Deserialize};

#[derive(Deserialize)]
pub struct UpdateRequest {
    #[serde(alias = "caseId")]
    pub case_id: usize,
    pub fields: UpdateRequestFields,
    pub jwt: String,
}

#[derive(Deserialize)]
pub struct UpdateRequestFields {
    #[serde(alias = "caseName")]
    pub case_name: Option<String>,
    #[serde(alias = "caseDescription")]
    pub case_description: Option<String>,
    pub court: Option<String>,
    #[serde(alias = "caseType")]
    pub case_type: Option<String>,
    pub availability: Option<String>,
    #[serde(alias = "judgeName")]
    pub judge_name: Option<String>,
    #[serde(alias = "courtRegion")]
    pub court_region: Option<String>,
    pub state: Option<String>,
    #[serde(alias = "legalArea")]
    pub legal_area: Option<String>,
}

#[derive(Serialize)]
pub struct UpdateResponse {
    pub status: String,
}