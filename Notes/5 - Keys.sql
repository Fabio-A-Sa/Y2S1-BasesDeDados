-- Create a table with primaryKey

CREATE TABLE Person (
    id INTEGER PRIMARY KEY,            -- Primary Key, not Null              
    name CHAR(30) DEFAULT "Unknown",
    adress VARCHAR(255),
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
);

CREATE TABLE Faculty (
    id INTEGER,               
    name CHAR(30),
    city CHAR(10),
    PRIMARY KEY (id, city)              -- (id+city) is a composed primary key
);