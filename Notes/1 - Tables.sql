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

-- To view all tables in current dataBase

.tables

-- To view schema of certain table

.shema Person