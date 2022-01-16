-- Created on January, 2022
-- @author: Fábio Araújo de Sá

-- Create tables

CREATE TABLE Student (
    sID INTEGER PRIMARY KEY,
    sName CHAR(10),
    grade FLOAT,
    college CHAR(30)
);

CREATE TABLE College (
    cName CHAR(10) PRIMARY KEY,
    city CHAR(10)
);

CREATE TABLE Apply (
    sID INTEGER REFERENCES Student(sID) ON UPDATE CASCADE ON DELETE SET NULL,            -- Student's primary key
    cName CHAR(10) REFERENCES College(cName) ON UPDATE CASCADE ON DELETE SET NULL,       -- College's primary key
    PRIMARY KEY (sID, cName)                                                             -- Apply is a primary key too
)

-- Note
-- if Student has (sID, sName) for Primary Key, Apply will have
-- FOREING KEY (sID, sName) REFERENCES Student (sID, sName);

-- Note
-- if Apply's sID is updated, Student will be updated too
-- if Apply's cName is deleted, College will be set to NULL
-- for default, SQL will throw an error