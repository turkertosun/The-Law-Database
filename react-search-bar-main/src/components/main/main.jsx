import React, { useState } from "react";
import { SearchBar } from "../search/SearchBar";
import { SearchResultsList } from "../search/SearchResultsList";
import "./main.scss";

function Main() {
    const [results, setResults] = useState([]); // Initialize state
    const [filters, setFilters] = useState({
        court: "All",
        type: "All",
        status: "All",
    });

    const cases = [
        { id: 1, name: "name 1", state: "CA", legalArea: "Criminal", date: "11/11/2001", courtRegion: "Huntsville", judgeName: "turker", court: "State", type: "Criminal Case", status: "Ongoing", description: "Filter Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem ipsum minus excepturi blanditiis architecto aliquam necessitatibus perspiciatis labore, atque ex?" },
        { id: 2, name: "name 2", state: "TX", legalArea: "Criminal", date: "11/11/2001", courtRegion: "Houston", judgeName: "berkan", court: "Federal", type: "Mental Health Case", status: "Finished", description: "Filter Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem ipsum minus excepturi blanditiis architecto aliquam necessitatibus perspiciatis labore, atque ex?" },
        { id: 3, name: "name 3", state: "NY", legalArea: "Criminal", date: "11/11/2001", courtRegion: "Dallas", judgeName: "onur", court: "State", type: "Financial Case", status: "Ongoing", description: "Filter Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem ipsum minus excepturi blanditiis architecto aliquam necessitatibus perspiciatis labore, atque ex?" },
        { id: 4, name: "name 4", state: "AZ", legalArea: "Criminal", date: "11/11/2001", courtRegion: "Austin", judgeName: "baba pro", court: "Federal", type: "Criminal Case", status: "Finished", description: "Filter Lorem ipsum dolor sit amet consectetur adipisicing elit. Rem ipsum minus excepturi blanditiis architecto aliquam necessitatibus perspiciatis labore, atque ex?" },

    ];



    const handleFilterChange = (e) => {
        const { name, value } = e.target;
        setFilters((prevFilters) => ({
            ...prevFilters,
            [name]: value,
        }));
    };

    const filteredCases = cases.filter((c) => {
        const courtMatch = filters.court === "All" || c.court === filters.court;
        const typeMatch = filters.type === "All" || c.type === filters.type;
        const statusMatch = filters.status === "All" || c.status === filters.status;
        return courtMatch && typeMatch && statusMatch;
    });

    return (
        <>
            <div className="container">
                <div className="search-bar-container">
                    <SearchBar setResults={setResults} />
                    {results && results.length > 0 && <SearchResultsList results={results} />}
                </div>

                <div className="container-fluid down-box">
                    <div className="row">
                        <div className="card-body mb-4">

                            <div style={{ backgroundColor: "rgba(255, 255, 255, 0.6)", fontSize: "20px", padding: "10px", borderRadius: "10px" }} className="filters mt-3">
                                <label>
                                    <strong>Which Court:</strong>
                                    <select name="court" value={filters.court} onChange={handleFilterChange}>
                                        <option value="All">All</option>
                                        <option value="State">State</option>
                                        <option value="Federal">Federal</option>
                                    </select>
                                </label>

                                <label className="ms-3">
                                    <strong>Case Type:</strong>
                                    <select name="type" value={filters.type} onChange={handleFilterChange}>
                                        <option value="All">All</option>
                                        <option value="Criminal Case">Criminal Case</option>
                                        <option value="Mental Health Case">Mental Health Case</option>
                                        <option value="Financial Case">Financial Case</option>
                                    </select>
                                </label>

                                <label className="ms-3">
                                    <strong>Is Available:</strong>
                                    <select name="status" value={filters.status} onChange={handleFilterChange}>
                                        <option value="All">All</option>
                                        <option value="Ongoing">Ongoing</option>
                                        <option value="Finished">Finished</option>
                                    </select>
                                </label>
                            </div>
                        </div>

                        <div className="card-body">
                            <small style={{ backgroundColor: "rgba(255, 255, 255, 0.6)", fontSize: "30px", padding: "10px", borderRadius: "10px" }}>Cases</small>
                        </div>
                        <br />
                        <div className="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-3">
                            {filteredCases.map((c) => (
                                <div className="col-12 col-md-6 col-lg-3" key={c.id}>
                                    <div className="card h-100" style={{ backgroundColor: "rgba(255, 255, 255, 0.6)" }}>
                                        <div className="card-body">
                                            <h5 className="card-title">Case ID {c.id}</h5>
                                            <p className="card-text"><small>{c.description}</small></p>
                                            <p className="card-text"><strong>Case Name:</strong> {c.name}</p>
                                            <p className="card-text"><strong>Which Court:</strong> {c.court}</p>
                                            <p className="card-text"><strong>Case Type:</strong> {c.type}</p>
                                            <p className="card-text"><strong>Is Available:</strong> {c.status}</p>
                                            <p className="card-text"><strong>Judge Name:</strong> {c.judgeName}</p>
                                            <p className="card-text"><strong>Court Region: </strong> {c.courtRegion}</p>
                                            <p className="card-text"><strong>State :</strong>{c.state}</p>
                                            <p className="card-text"><strong>Legal Area :</strong>{c.legalArea}</p>
                                            <p className="card-text text-end fw-bold mb-1"><strong>{c.date}</strong></p>
                                        </div>
                                    </div>
                                </div>
                            ))}
                            {filteredCases.length === 0 && <p className="text-center btn btn-danger">No cases match the selected filters.</p>}
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Main;
