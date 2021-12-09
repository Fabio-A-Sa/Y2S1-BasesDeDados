-- To view all tables in current dataBase

.tables

-- To view all schema of certain table

.schema Person

-- To view all atributes of a table (continuation in topic 7)

SELECT * FROM Person;                                    -- Show all atributes and tuples from current table Person
SELECT name, date('2021-11-30')-birthday as age from Person;    -- Show name | age in current table Person