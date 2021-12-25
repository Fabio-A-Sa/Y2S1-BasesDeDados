-- Inner Join / Join for default

SELECT sName, GPA 
FROM Student JOIN Apply ON Student.sID = Apply.sID 
WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';

SELECT DISTINCT nName, major
FROM Student JOIN Apply USING (sID)           -- Desde que se selecione um atributo em comum nas duas tabelas

-- Natural Join

SELECT DISTINCT sName, major                  -- Desde que tenham um atributo em comum, para fazer a devida junção
FROM Student NATURAL JOIN Apply;

-- Left outer join

SELECT sName, sID, cName, major                     -- Todos os estudantes são ligados aos applies, e se não houver 
FROM Student LEFT OUTER JOIN Apply using (sID)      -- ligação, cName e major ficam NULL