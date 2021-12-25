-- A simple query

SELECT * FROM Person;                               -- Show all data in Person's table
SELECT name, birthDate-now as age FROM Person;      -- Show name | age in all tuples
SELECT Person1.name, Person2.name FROM Person Person1, Person Person2 WHERE Person1.name > Person2.name;

-- With conditions

SELECT name FROM Person WHERE gender = 'M';                 -- Select all male persons
SELECT name, address FROM Person WHERE birthDate-now < 20;  -- Select all persons which age < 20

-- Sorting

SELECT name FROM Person ORDER BY name;                      -- Show all persons, sorting by names (ascending)
SELECT name FROM Person ORDER BY name ASC, gender DESC;     -- Sorting by name and gender, if exists colision 

-- Like operator

SELECT * FROM PERSON WHERE name LIKE "%bi%";        -- Ex: Fabio
SELECT * FROM PERSON WHERE name LIKE "%na";         -- Ex: Joana, Catarina
SELECT * FROM PERSON WHERE name LIKE "Na%";         -- Ex: Nadia

-- Union operator

SELECT Student.name FROM Student
Union                                       -- Union without repetition (for SQL default)
SELECT Professor.name from Professor
ORDER BY age DESC;

SELECT Student.name FROM Student
Union all                                   -- Union with repetition
SELECT Professor.name from Professor
ORDER BY gender ASC;

-- Intersection

SELECT student.ID from Student WHERE major = 'AED';
INTERSECT                                               -- Select all students that are enrolled in AED and BD
SELECT student.ID from Student WHERE major = 'BD';

-- Except

SELECT student.ID from Student WHERE major = 'AED';
EXCEPT                                                  -- Select all students that are enrolled in AED and not in BD
SELECT student.ID from Studnt WHERE major = 'BD';