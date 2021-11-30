-- Create a table with primaryKey

CREATE TABLE Person (
    id INTEGER NOT NULL,                  
    name CHAR(30) DEFAULT "Unknown",
    adress VARCHAR(255),
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
);