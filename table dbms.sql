CREATE DATABASE cinema;
CREATE TABLE Movie (
    movieid INT PRIMARY KEY,
    title VARCHAR(100),
    language VARCHAR(50),
    releaseYear YEAR,
    budget DECIMAL(15,2),
    category VARCHAR(50)
);

CREATE TABLE Actor (
    actorid INT PRIMARY KEY,
    name VARCHAR(100),
    nationality VARCHAR(50),
    dateOfBirth DATE,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Acted (
    movieid INT,
    actorid INT,
    roles VARCHAR(100),
    PRIMARY KEY (movieid, actorid),
    FOREIGN KEY (movieid) REFERENCES Movie(movieid),
    FOREIGN KEY (actorid) REFERENCES Actor(actorid)
);

CREATE TABLE Director (
    did INT PRIMARY KEY,
    name VARCHAR(100),
    nationality VARCHAR(50),
    dateOfBirth DATE,
    gender ENUM('Male', 'Female', 'Other')
);

CREATE TABLE Directed (
    movieid INT,
    did INT,
    PRIMARY KEY (movieid, did),
    FOREIGN KEY (movieid) REFERENCES Movie(movieid),
    FOREIGN KEY (did) REFERENCES Director(did)
);

CREATE TABLE Staff (
    staffid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender ENUM('Male', 'Female') NOT NULL,
    address VARCHAR(100) DEFAULT 'BUTWAL',
    salary DECIMAL(10,2) CHECK (salary BETWEEN 12000 AND 100000),
    father VARCHAR(100),
    mother VARCHAR(100),
    sibling VARCHAR(100),
    email VARCHAR(100) UNIQUE
);