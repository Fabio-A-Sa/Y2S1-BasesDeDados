-- Create a table with default values, if insertion NULL

CREATE TABLE Person (
    id INTEGER DEFAULT -1,                  -- -1, error  
    name CHAR(30) DEFAULT "UNKNOWN",        -- for default, Unknown 
    adress VARCHAR(255) DEFAULT "Oporto",   -- for default, Oporto
    gender CHAR(1) DEFAULT 'X',             -- for default, X
    birthday DATE DEFAULT now,              -- for default, date.now
);
