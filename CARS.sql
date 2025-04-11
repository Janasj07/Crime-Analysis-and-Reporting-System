CREATE DATABASE CARS;

USE CARS;

CREATE TABLE Incidents (
    IncidentID INT PRIMARY KEY,
    IncidentType VARCHAR(100),
    IncidentDate DATE,
    Location varchar(100), 
    Descriptions varchar(100),
    Statuss VARCHAR(100),
    VictimID INT,
    SuspectID INT,
    FOREIGN KEY (VictimID) REFERENCES Victims(VictimID),
    FOREIGN KEY (SuspectID) REFERENCES Suspects(SuspectID)
);


CREATE TABLE Victims (
    VictimID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(100),
    ContactInformation VARCHAR(100)
);


CREATE TABLE Suspects (
    SuspectID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    DateOfBirth DATE,
    Gender VARCHAR(100),
    ContactInformation VARCHAR(100)
);


CREATE TABLE LawEnforcementAgencies (
    AgencyID INT PRIMARY KEY,
    AgencyName VARCHAR(100),
    Jurisdiction VARCHAR(100),
    ContactInformation VARCHAR(100)
);


CREATE TABLE Officers (
    OfficerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    BadgeNumber VARCHAR(100),
    Ranks VARCHAR(100),
    ContactInformation VARCHAR(100),
    AgencyID INT,
    IncidentID INT,
    FOREIGN KEY (AgencyID) REFERENCES LawEnforcementAgencies(AgencyID),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);



CREATE TABLE Evidence (
    EvidenceID INT PRIMARY KEY,
    Descriptions TEXT,
    LocationFound VARCHAR(100),
    IncidentID INT,
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID)
);


CREATE TABLE Reports (
    ReportID INT PRIMARY KEY,
    IncidentID INT,
    ReportingOfficer INT,
    ReportDate DATE,
    ReportDetails TEXT,
    Statuss VARCHAR(100),
    FOREIGN KEY (IncidentID) REFERENCES Incidents(IncidentID),
    FOREIGN KEY (ReportingOfficer) REFERENCES Officers(OfficerID)
);


CREATE TABLE cases (
    caseID INT PRIMARY KEY,
    caseDescription VARCHAR(100),
    incidentID INT,
    FOREIGN KEY (incidentID) REFERENCES incidents(incidentID)
);


INSERT INTO Victims (VictimID, FirstName, LastName, DateOfBirth, Gender, ContactInformation)
VALUES
  (1, 'John', 'Doe', '1990-05-15', 'Male', '123 Main St, City, Country, 12345'),
  (2, 'Jane', 'Smith', '1985-08-22', 'Female', '456 Oak St, Town, Country, 67890'),
  (3, 'Michael', 'Johnson', '1993-02-10', 'Male', '789 Pine St, Village, Country, 34567'),
  (4, 'Emily', 'Davis', '1988-11-30', 'Female', '987 Elm St, Hamlet, Country, 87654'),
  (5, 'Daniel', 'Martinez', '1995-07-18', 'Male', '654 Birch St, Borough, Country, 23456'),
  (6, 'Sophia', 'Wang', '1982-04-25', 'Female', '321 Cedar St, City, Country, 65432'),
  (7, 'Mason', 'Nguyen', '1998-09-12', 'Male', '876 Maple St, Town, Country, 56789');
  
  
INSERT INTO Suspects (SuspectID, FirstName, LastName, DateOfBirth, Gender, ContactInformation)
VALUES
  (1, 'Mark', 'Johnson', '1987-06-25', 'Male', '543 Oak St, City, Country, 54321'),
  (2, 'Linda', 'Brown', '1992-03-12', 'Female', '876 Pine St, Town, Country, 23456'),
  (3, 'Christopher', 'White', '1989-09-05', 'Male', '234 Birch St, Village, Country, 87654'),
  (4, 'Jessica', 'Lee', '1991-12-18', 'Female', '765 Elm St, Hamlet, Country, 34567'),
  (5, 'Brian', 'Garcia', '1984-07-30', 'Male', '321 Cedar St, Borough, Country, 65432'),
  (6, 'Kimberly', 'Wu', '1997-02-14', 'Female', '654 Maple St, City, Country, 76543'),
  (7, 'Jordan', 'Nguyen', '1994-11-08', 'Male', '987 Pine St, Town, Country, 87654');


INSERT INTO Incidents (IncidentID, IncidentType, IncidentDate, Location, Descriptions, Statuss, VictimID, SuspectID)
VALUES
  (1, 'Robbery', '2023-01-15', 'Latitude: 123.456, Longitude: 789.012', 'Armed robbery at a convenience store', 'Open', 1, 1),
  (2, 'Homicide', '2023-02-20', 'Latitude: 456.789, Longitude: 012.345', 'Murder investigation in downtown', 'Closed', 2, 2),
  (3, 'Theft', '2023-03-10', 'Latitude: 789.012, Longitude: 345.678', 'Shoplifting incident at a mall', 'Open', 3, 3),
  (4, 'Assault', '2023-04-05', 'Latitude: 012.345, Longitude: 678.901', 'Physical assault reported on the street', 'Under Investigation', 4, 4),
  (5, 'Burglary', '2023-05-22', 'Latitude: 234.567, Longitude: 890.123', 'Break-in at a residential property', 'Open', 5, 5),
  (6, 'Fraud', '2023-06-15', 'Latitude: 567.890, Longitude: 123.456', 'Financial fraud case under review', 'Draft', 6, 6),
  (7, 'Kidnapping', '2023-07-08', 'Latitude: 890.123, Longitude: 234.567', 'Reported kidnapping incident', 'Open', 7, 7);


INSERT INTO cases (caseID, caseDescription, incidentID)
VALUES
  (1, 'Robbery Investigation', 1),
  (2, 'Homicide Investigation', 2),
  (3, 'Theft Investigation', 3),
  (4, 'Assault Investigation', 4),
  (5, 'Burglary Investigation', 5),
  (6, 'Fraud Investigation', 6),
  (7, 'Kidnapping Investigation', 7);
  
  INSERT INTO LawEnforcementAgencies (AgencyID, AgencyName, Jurisdiction, ContactInformation)
VALUES
  (1, 'City Police Department', 'Urban Area', '111 Main St, City, 12345'),
  (2, 'County Sheriff Office', 'County Area', '222 Sheriff Rd, County, 23456');

INSERT INTO Officers (OfficerID, FirstName, LastName, BadgeNumber, Ranks, ContactInformation, AgencyID, IncidentID)
VALUES
  (1, 'Alice', 'Williams', 'PD123', 'Sergeant', 'alice.williams@police.gov', 1, 1),
  (2, 'Robert', 'Taylor', 'PD124', 'Detective', 'robert.taylor@police.gov', 1, 2),
  (3, 'Emily', 'Clark', 'PD125', 'Captain', 'emily.clark@police.gov', 1, 3),
  (4, 'David', 'Walker', 'PD126', 'Detective', 'david.walker@police.gov', 2, 4),
  (5, 'Sophia', 'Hall', 'PD127', 'Sergeant', 'sophia.hall@police.gov', 2, 5),
  (6, 'James', 'Adams', 'PD128', 'Officer', 'james.adams@police.gov', 1, 6),
  (7, 'Linda', 'Perez', 'PD129', 'Lieutenant', 'linda.perez@police.gov', 2, 7);

  
  INSERT INTO Reports (ReportID, IncidentID, ReportingOfficer, ReportDate, ReportDetails, Statuss)
VALUES
  (1, 1, 1, '2023-01-16', 'Initial robbery report filed by Officer Williams.', 'Submitted'),
  (2, 2, 2, '2023-02-21', 'Homicide case opened by Detective Taylor.', 'Reviewed'),
  (3, 3, 3, '2023-03-11', 'Shoplifting case report submitted.', 'Submitted'),
  (4, 4, 4, '2023-04-06', 'Assault report taken by Officer Walker.', 'In Progress'),
  (5, 5, 5, '2023-05-23', 'Burglary evidence gathered and report created.', 'Submitted'),
  (6, 6, 6, '2023-06-16', 'Financial fraud investigation preliminary report.', 'Draft'),
  (7, 7, 7, '2023-07-09', 'Kidnapping case reported by Lieutenant Perez.', 'Open');
  
  INSERT INTO Evidence (EvidenceID, Descriptions, LocationFound, IncidentID)
VALUES
  (1, 'Security camera footage showing the robbery suspect', 'Convenience store - camera DVR', 1),
  (2, 'Murder weapon (kitchen knife) recovered from crime scene', 'Downtown apartment - kitchen', 2),
  (3, 'Stolen watch retrieved from suspect\'s possession', 'Suspect\'s backpack', 3),
  (4, 'Victim\'s blood-stained clothing', 'Alleyway near assault location', 4),
  (5, 'Broken window glass fragments', 'Living room of burgled home', 5),
  (6, 'Forged bank documents', 'Office drawer of the accused', 6),
  (7, 'Child\'s torn backpack found near abduction site', 'Park bench near school', 7);
  



