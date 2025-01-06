use serde::{Serialize, Deserialize};

#[derive(Deserialize)]
pub struct SearchRequest {
    pub query: String,
    pub filters: SearchRequestFilters,
    pub jwt: String,
}

#[derive(Deserialize)]
pub struct SearchRequestFilters {
    #[serde(alias = "courtType")]
    pub court_type: String,
    #[serde(alias = "caseType")]
    pub case_type: String,
    pub availability: String,
}

#[derive(Serialize)]
pub struct SearchResponse {
    pub cases: Vec<SearchResponseCase>,
}

#[derive(Serialize)]
pub struct SearchResponseCase {
    #[serde(alias = "caseId")]
    pub case_id: usize,
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