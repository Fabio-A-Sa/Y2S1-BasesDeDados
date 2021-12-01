-- My Drafts

-- Create a table

CREATE TABLE Person (
    id INTEGER,            -- Integer type
    name CHAR(30),         -- Immutable char array
    adress VARCHAR(255),   -- Muttable char array
    gender CHAR(1),        -- Char value
    birthday DATE,         -- String text, in format "YYYY-MM-DD"
);

-- Remove a table

DROP TABLE Person;              -- Remove
DROP TABLE IF EXISTS Person;    -- Remove if it's in current directory

-- Add and remove columns/atributes

ALTER TABLE Person ADD country VARCHAR(255); -- Add atribute/collumn country
ALTER TABLE Person REMOVE country;           -- Remove atribute/collumn country

-- Insert data tuples

INSERT INTO Person VALUES (123, "Fabio", "Oporto", 'M', "2002-07-10");
INSERT INTO Person VALUES (4375, "Catarina", "Lisbon", 'F', "2002-11-07");
INSERT INTO Person VALUES (123, "Joana", "Aveiro", 'F', "2002-07-09");

-- To view all tables in current dataBase

.tables

-- To view schema of certain table

.schema Person

-- To view all collumns name in header's table

.header on

-- To view formated data

.mode column

-- To enable Foreing Keys

PRAGMA foreign_keys = ON;

-- Create a table with default values, if insertion NULL

CREATE TABLE Person (
    id INTEGER DEFAULT -1,                                      -- -1, error  
    name CHAR(30) DEFAULT "UNKNOWN",                            -- for default, Unknown 
    adress VARCHAR(255) DEFAULT "Oporto",                       -- for default, Oporto
    gender CHAR(1) DEFAULT 'X',                                 -- for default, X
    birthday DATE DEFAULT now,                                  -- for default, date.now
);

ALTER TABLE Person ADD phone CHAR(14) DEFAULT "+351999999999";  -- for default

-- Note:
-- The default default value of SQLite is NULL

-- To run a query

SELECT * FROM Person;                                           -- Show all atributes and tuples from current table Person
SELECT names, date('2021-11-30')-dateNascimento from Person;    -- Show name | age in current table Person

-- Create a table with constraints

CREATE TABLE Person (
    id INTEGER NOT NULL,                    -- In the insertion, if id == NULL, gives an error    
    name CHAR(30) DEFAULT "Unknown",        -- In the insertion, if name == NULL, name == "Unknown"
    adress VARCHAR(255) UNIQUE,             -- Allows unique values in tuples, and allows NULL values
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
    phone VARCHAR(14) UNIQUE
);

-- or

CREATE TABLE Person (
    id INTEGER NOT NULL,                    -- In the insertion, if id == NULL, gives an error    
    name CHAR(30) DEFAULT "Unknown",        -- In the insertion, if name == NULL, name == "Unknown"
    adress VARCHAR(255),           
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
    phone VARCHAR(14),
    UNIQUE (adress, phone)                  -- Allows unique subTuples and NULL
    UNIQUE (name, birthdate)                -- Allows unique subTuples and NULL
);

-- Check constraints

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,
    name VARCHAR(10),
    city CHAR(100),
    CHECK (name <> 'ISEP' AND city == 'COIMBRA')
)

INSERT INTO Faculty values ('ISEP', 'PORTO')            -- Gives an error, check violation
INSERT INTO Faculty values ('FEUP', 'COIMBRA')          -- Correct

-- Include constraints name -> Good practise

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,
    name VARCHAR(10) CONSTRAINT NameNotNull NOT NULL,   -- If gives an error, show NameNotNull message
    city CHAR(100) CONSTRAINT CityNotNull NOT NULL,     -- If gives an error, show CityNotNull message
    CHECK (name <> 'ISEP' AND city == 'COIMBRA')
    CONSTRAINT FacultyPKError PRIMARY KEY (id)          -- If gives an error, show FacultyPKError message
);

-- Create a table with primaryKey

CREATE TABLE Person (
    id INTEGER PRIMARY KEY,                     -- Primary Key, NOT NULL and UNIQUE for default            
    name CHAR(30) DEFAULT "Unknown",
    birthDate DATE,
);

-- Create a table with composed primaryKey

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,                   -- Auto increment, based on last table tuple
    name CHAR(30),
    city CHAR(10),
    PRIMARY KEY (id, city)                      -- (id+city) is a composed primary key
);

-- Insert some values and errors

INSERT INTO Person (id, name, birthDate) VALUES (325, "Fabio", '2002-07-10');
INSERT INTO Person (id, name, birthDate) VALUES (23, "Gabriela", '2002-11-10');
INSERT INTO Person (id, name, birthDate) VALUES (325, "Luis", '1987-05-23');        -- Gives an error, UNIQUE key violation

INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 0
INSERT INTO Faculty (name, city) VALUES ("UM", "Braga");                        -- id = 1
INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 2
INSERT INTO Faculty (id, name, city) VALUES (1, "IPCA", "Braga")                -- Gives an error, UNIQUE violation

-- Note
-- If exists an integer ID, ID is an alias of ROWID (implicit primary key)

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
    PRIMARY KEY (sID, cName)                        -- Aplly is a primary key too
)

-- Note
-- if Student has (sID, sName) for Primary Key, Apply will have
-- FOREING KEY (sID, sName) REFERENCES Student(sID, sName);

-- Note
-- if Apply's sID is updated, Student will be updated too
-- if Apply's cName is deleted, College will be set to NULL