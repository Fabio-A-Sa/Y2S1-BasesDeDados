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
)