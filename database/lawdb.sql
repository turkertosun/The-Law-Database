CREATE DATABASE IF NOT EXISTS lawdbfinal
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE AuthServerDb;

CREATE TABLE IF NOT EXISTS Users (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(100) NOT NULL,
    Role VARCHAR(50) NOT NULL DEFAULT 'User'
) ENGINE=InnoDB;


CREATE TABLE IF NOT EXISTS Cases (
    CaseId VARCHAR(50) PRIMARY KEY,
    CaseName VARCHAR(200) NOT NULL,
    CaseDescription TEXT NOT NULL,
    Court VARCHAR(100) NOT NULL,
    CaseType VARCHAR(100) NOT NULL,
    Availability VARCHAR(50) NOT NULL,
    JudgeName VARCHAR(100) NOT NULL,
    CourtRegion VARCHAR(100) NOT NULL,
    State VARCHAR(100) NOT NULL,
    LegalArea VARCHAR(100) NOT NULL,
    Date DATETIME NOT NULL,
    IsBackendCase BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB;



-- Users
INSERT INTO Users (Name, Email, Password, Role) VALUES
('Admin User', 'admin@gmail.com', 'admin', 'Admin');

-- Cases
INSERT INTO Cases (CaseId, CaseName, CaseDescription, Court, CaseType, Availability, JudgeName, CourtRegion, State, LegalArea, Date, IsBackendCase) VALUES
('1', 'Property Line Dispute', 'Two neighbors are in conflict over a fence encroachment...', 'FEDERAL', 'Property', 'ONGOING', 'Judge John G. Roberts, Jr.', 'Central', 'Illinois', 'CIWIL', '2021-05-15 00:00:00', TRUE),
('2', 'Breach of Lease Agreement', 'Michael sublet his apartment without landlord approval...', 'STATE', 'Contract', 'ONGOING', 'Judge Clarence Thomas', 'South', 'Florida', 'CIWIL', '2020-11-22 00:00:00', TRUE);
