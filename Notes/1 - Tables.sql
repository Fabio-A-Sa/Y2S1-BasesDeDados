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

-- To view collumn' name 

.header on
