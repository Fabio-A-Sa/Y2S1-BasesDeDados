-- A simple query

SELECT * FROM Person;                               -- Show all data in Person's table
SELECT name, birthDate-now as age FROM Person;      -- Show name | age in all tuples

-- With conditions

SELECT name FROM Person WHERE gender = 'M';                 -- Select all male persons
SELECT name, address FROM Person WHERE birthDate-now < 20;  -- Select all persons which age < 20

-- Sorting

SELECT name FROM Person ORDER BY name;      -- Show all persons, sorting by names (ascending)
SELECT name FROM Person ORDER BY name ASC, gender DES;      -- Sorting by name and gender, if exists colision 

-- Like operator

SELECT * FROM PERSON WHERE name LIKE "%bi%";        -- Ex: Fabio
SELECT * FROM PERSON WHERE name LIKE "%na";         -- Ex: Joana, Catarina
SELECT * FROM PERSON WHERE name LIKE "Na%";         -- Ex: Nadia

