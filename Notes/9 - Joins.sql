-- Inner Join / Join for default

SELECT sName, GPA 
FROM Student JOIN Apply ON Student.sID = Apply.sID 
WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';

-- Natural Join

SELECT DISTINCT sName, major                  -- Desde que tenham um atributo em comum, para fazer a devida junção
FROM Student NATURAL JOIN Apply;

SELECT DISTINCT nName, major
FROM Student NATURAL JOIN Apply USING (sID)   -- Desde que se selecione um atributo em comum