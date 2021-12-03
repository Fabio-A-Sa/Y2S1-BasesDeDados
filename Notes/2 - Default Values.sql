-- Create a table with default values

DROP TABLE IF EXISTS Person;

CREATE TABLE Person (
    id INTEGER,                                  
    name CHAR(10) DEFAULT 'UNKNOWN',                 -- for default, Unknown 
    address CHAR(255) DEFAULT 'Oporto',              -- for default, Oporto
    gender CHAR(1) DEFAULT 'X',                      -- for default, X
    birthday DATE DEFAULT '2021-11-30',              -- for default, date.now
);

ALTER TABLE Person ADD phone CHAR(14) DEFAULT "+351999999999";  -- for default

-- Note:
-- The default default value of SQLite is NULL