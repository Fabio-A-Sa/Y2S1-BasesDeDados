-- Created on January, 2022
-- @author: Fábio Araújo de Sá

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

INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 1
INSERT INTO Faculty (name, city) VALUES ("UM", "Braga");                        -- id = 2
INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 3
INSERT INTO Faculty (id, name, city) VALUES (2, "IPCA", "Braga")                -- Gives an error, UNIQUE violation

-- Note
-- If exists an integer ID, ID is an alias of ROWID (implicit primary key)