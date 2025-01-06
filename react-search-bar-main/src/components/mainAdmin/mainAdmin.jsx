import React, { useState, useEffect } from "react";
import { SearchBar } from "../search/SearchBar";
import { SearchResultsList } from "../search/SearchResultsList";

function Main() {
    const [results, setResults] = useState([]);
    const [filters, setFilters] = useState({
        courtType: "ALL",
        caseType: "ALL",
        availability: "ALL",
    });
    const [cases, setCases] = useState([]);

    // Fetch cases from the backend when the component mounts or filters change
    useEffect(() => {
        const fetchCases = async () => {
            try {
                // Build the query parameters
                const queryParams = new URLSearchParams({
                    query: "", // Assuming empty query for initial load
                    filters: JSON.stringify({
                        courtType: filters.courtType,
                        caseType: filters.caseType,
                        availability: filters.availability,
                    }),
                });

                const response = await fetch(`/search?${queryParams.toString()}`, {
                    method: 'GET',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                });

                const data = await response.json();

                // Update cases state with the fetched data
                setCases(data.cases || []);
            } catch (error) {
                console.error('Error fetching cases:', error);
            }
        };

        fetchCases();
    }, [filters]); // Re-fetch when filters change

    const handleFilterChange = (e) => {
        const { name, value } = e.target;
        setFilters((prevFilters) => ({
            ...prevFilters,
            [name]: value,
        }));
    };

    const handleDelete = async (caseId) => {
        try {
            const response = await fetch('/delete', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ caseId }),
            });

            const data = await response.json();

            if (data.status === 'SUCCESS') {
                // Remove the deleted case from the state
                setCases((prevCases) => prevCases.filter((c) => c.caseId !== caseId));
                alert('Case successfully deleted.');
            } else {
                alert('Failed to delete case.');
            }
        } catch (error) {
            console.error('Error deleting case:', error);
            alert('An error occurred.');
        }
    };

    return (
        <>
            <div className="container">
                <div className="search-bar-container">
                    <SearchBar setResults={setResults} />
                    {results && results.length > 0 && (
                        <SearchResultsList results={results} />
                    )}
                </div>

                <div className="container-fluid down-box">
                    <div className="row">
                        <div className="card-body mb-4">
                            <div
                                style={{
                                    backgroundColor: "rgba(255, 255, 255, 0.6)",
                                    fontSize: "20px",
                                    padding: "10px",
                                    borderRadius: "10px",
                                }}
                                className="filters mt-3 p-3"
                            >
                                <button className="btn btn-success float-end p-1">
                                    Add Cases
                                </button>
                                <label>
                                    <strong>Which Court:</strong>
                                    <select
                                        name="courtType"
                                        value={filters.courtType}
                                        onChange={handleFilterChange}
                                    >
                                        <option value="ALL">All</option>
                                        <option value="STATE">State</option>
                                        <option value="FEDERAL">Federal</option>
                                    </select>
                                </label>

                                <label className="ms-3">
                                    <strong>Case Type:</strong>
                                    <select
                                        name="caseType"
                                        value={filters.caseType}
                                        onChange={handleFilterChange}
                                    >
                                        <option value="ALL">All</option>
                                        <option value="CRIMINAL">Criminal Case</option>
                                        <option value="MENTAL">Mental Health Case</option>
                                        <option value="FINANCIAL">Financial Case</option>
                                    </select>
                                </label>

                                <label className="ms-3">
                                    <strong>Is Available:</strong>
                                    <select
                                        name="availability"
                                        value={filters.availability}
                                        onChange={handleFilterChange}
                                    >
                                        <option value="ALL">All</option>
                                        <option value="ONGOING">Ongoing</option>
                                        <option value="FINISHED">Finished</option>
                                    </select>
                                </label>
                            </div>
                        </div>

                        <br />
                        <div className="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-3">
                            {cases.map((c) => (
                                <div
                                    className="col-12 col-md-6 col-lg-3"
                                    key={c.caseId}
                                >
                                    <div
                                        className="card h-100"
                                        style={{
                                            backgroundColor:
                                                "rgba(255, 255, 255, 0.6)",
                                        }}
                                    >
                                        <div className="card-body">
                                            <h5 className="card-title">
                                                Case ID {c.caseId}
                                            </h5>
                                            <p className="card-text">
                                                <small>{c.caseDescription}</small>
                                            </p>
                                            <p className="card-text">
                                                <strong>Case Name:</strong> {c.caseName}
                                            </p>
                                            <p className="card-text">
                                                <strong>Which Court:</strong> {c.court}
                                            </p>
                                            <p className="card-text">
                                                <strong>Case Type:</strong> {c.type}
                                            </p>
                                            <p className="card-text">
                                                <strong>Is Available:</strong>{" "}
                                                {c.availability}
                                            </p>
                                            <p className="card-text">
                                                <strong>Judge Name:</strong> {c.judgeName}
                                            </p>
                                            <p className="card-text">
                                                <strong>Court Region:</strong>{" "}
                                                {c.courtRegion}
                                            </p>
                                            <p className="card-text">
                                                <strong>State:</strong> {c.state}
                                            </p>
                                            <p className="card-text">
                                                <strong>Legal Area:</strong> {c.legalArea}
                                            </p>
                                            {/* Assuming there's a date field */}
                                            {c.date && (
                                                <p className="card-text text-end fw-bold mb-5">
                                                    <strong>{c.date}</strong>
                                                </p>
                                            )}
                                        </div>
                                        <div className="buttons-container text-start mt-5">
                                            <button className="btn btn-success me-2">
                                                Update
                                            </button>
                                            <button
                                                className="btn btn-danger"
                                                onClick={() => handleDelete(c.caseId)}
                                            >
                                                Delete
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            ))}
                            {cases.length === 0 && (
                                <p className="text-center btn btn-danger">
                                    No cases match the selected filters.
                                </p>
                            )}
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
}

export default Main;
