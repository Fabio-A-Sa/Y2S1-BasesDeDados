-- Create a table with default values

DROP TABLE IF EXISTS Person;

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