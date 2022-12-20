CREATE TABLE Accelerators (
	Id SERIAL PRIMARY KEY,
	Name varchar(10) NOT NULL UNIQUE
);


CREATE TABLE Projects (
	Id SERIAL PRIMARY KEY,
	Project varchar(30) NOT NULL UNIQUE
);

CREATE TABLE AcceleratorProject(
	AcelleratorId INT REFERENCES Accelerators(Id),
	ProjectId INT REFERENCES Projects(Id)
);

CREATE TABLE Countries (
	Id SERIAL PRIMARY KEY,
	Country varchar(20) NOT NULL UNIQUE,
	Population int NOT NULL,
	GDP int NOT NULL
);

CREATE TABLE Hotels (
	Id SERIAL PRIMARY KEY,
	Hotel varchar(30) NOT NULL UNIQUE,
	Capacity int NOT NULL
);

CREATE TABLE Fields (
	Id SERIAL PRIMARY KEY,
	Field varchar(25) NOT NULL CHECK(Field IN ('Programer', 'Fizičar', 'Inžinjer', 'Znanstvenik materijala'))
);

CREATE TABLE Scientists (
	Id SERIAL PRIMARY KEY,
	DateOfBirth TIMESTAMP NOT NULL,
	Gender varchar(1) NOT NULL CHECK(Gender IN ('M', 'Ž')),
	CountryId INT REFERENCES Countries(Id),
	FieldId INT REFERENCES Fields(Id),
	HotelId INT REFERENCES Hotels(Id)
);

--Tablica za znanstvene radove
CREATE TABLE Researches (
	Id SERIAL PRIMARY KEY,
	Name varchar(30) NOT NULL UNIQUE,
	AmountOfCitations int NOT NULL,
	DateOfPublishment TIMESTAMP NOT NULL,
	ProjectId INT REFERENCES Projects(Id)
);

CREATE TABLE Signature(
	ScientistId INT REFERENCES Scientists(Id),
	ResearchId INT REFERENCES Researches(Id)
);