-- Create a table with primaryKey

CREATE TABLE Person (
    id INTEGER PRIMARY KEY,                     -- Primary Key, NOT NULL and UNIQUE for default            
    name CHAR(30) DEFAULT "Unknown",
    adress VARCHAR(255),
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
);

-- Create a table with composed primaryKey

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,                   -- Auto increment, based on last table tuple
    name CHAR(30),
    city CHAR(10),
    PRIMARY KEY (id, city)                      -- (id+city) is a composed primary key
);

INSERT INTO Faculty VALUES ("FEUP", "Porto");   -- id = 0
INSERT INTO Faculty VALUES ("FCUP", "Porto");   -- id = 1