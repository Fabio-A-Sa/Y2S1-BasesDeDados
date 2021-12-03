-- Create a table

DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    id INTEGER,             -- Integer type
    name CHAR(30),          -- Immutable char array
    address CHAR(255),      -- Muttable char array
    gender CHAR(1),         -- Char value
    birthday DATE           -- String text, in format "YYYY-MM-DD"
);

-- Remove a table

DROP TABLE IF EXISTS myTable;    -- Remove if it's in current directory

-- Add and remove columns/atributes

ALTER TABLE Person ADD country VARCHAR(255);  -- Add atribute/collumn country
ALTER TABLE Person DROP country;              -- Remove atribute/collumn country

-- Insert data tuples

INSERT INTO Person (id, name, address, gender, birthday) VALUES (123, "Fabio", "Oporto", 'M', "2002-07-10");
INSERT INTO Person (id, name, address, gender, birthday) VALUES (4375, "Catarina", "Lisbon", 'F', "2002-11-07");
INSERT INTO Person (id, name, address, gender, birthday) VALUES (123, "Joana", "Aveiro", 'F', "2002-07-09");

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