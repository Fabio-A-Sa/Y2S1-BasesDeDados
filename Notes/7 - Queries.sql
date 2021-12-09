-- A simple query

SELECT * FROM Person;                               -- Show all data in Person's table
SELECT name, birthDate-now as age FROM Person;      -- Show name | age in all tuples

-- With conditions

SELECT name FROM Person WHERE gender = 'M';                 -- Select all male persons
SELECT name, address FROM Person WHERE birthDate-now < 20;  -- Select all persons which age < 20

-- Sorting

SELECT name FROM Person ORDER BY name;      -- Show all persons, sorting by names
SELECT 