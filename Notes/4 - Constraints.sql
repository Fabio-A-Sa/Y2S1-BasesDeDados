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
    UNIQUE (adress, phone)                  -- Allows unique values in tuples, and allows NULL values
);