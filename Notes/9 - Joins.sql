-- Created on January, 2022
-- @author: Fábio Araújo de Sá

-- Inner Join / Join for default

SELECT sName, GPA 
FROM Student JOIN Apply ON Student.sID = Apply.sID 
WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';

SELECT DISTINCT nName, major
FROM Student JOIN Apply USING (sID)           -- Desde que se selecione um atributo em comum nas duas tabelas

-- Natural Join

SELECT DISTINCT sName, major                  -- Desde que tenham um atributo em comum, para fazer a devida junção
FROM Student NATURAL JOIN Apply;

-- Left outer join / left join

SELECT sName, sID, cName, major                      -- Todos os estudantes são ligados aos applies, e se não houver 
FROM Student LEFT OUTER JOIN Apply using (sID)       -- ligação, cName e major ficam NULL

-- Right outer join / right join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes, e se não houver 
FROM Student RIGHT OUTER JOIN Apply using (sID)      -- ligação, sName e sID ficam NULL

-- Full outer join / full join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes e todos os estudantes, e se não houver 
FROM Student FULL OUTER JOIN Apply using (sID)       -- ligados aos applies, se não houver ligação ligação, ficam a NULL