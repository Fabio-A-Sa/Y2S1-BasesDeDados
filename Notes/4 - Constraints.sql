-- Create a table with constraints

CREATE TABLE Person (
    id INTEGER NOT NULL,                    -- In the insertion, if id == NULL, gives an error    
    name CHAR(30) DEFAULT "Unknown",        -- In the insertion, if name == NULL, name == "Unknown"
    adress VARCHAR(255),
    gender CHAR(1),  
    birthday DATE,
);
