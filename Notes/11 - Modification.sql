-- Created on January, 2022
-- @author: Fábio Araújo de Sá

-- Inserir, atualizar e eliminar

INSERT INTO Student (name, college) VALUES ('Fabio', 'FEUP');

INSERT INTO Apply
SELECT sID, 'FEUP', 'Eng. Informática', NULL
FROM Student
WHERE sID NOT IN (
    SELECT sID
    FROM Apply
);

DELETE FROM Student
WHERE Student.id IN (
    SELECT sID 
    FROM Apply
    GROUP BY sID
    HAVING count(DISTINCT major) > 2
);

UPDATE Apply
SET desision = 'Y', major = 'Eng. Informática'
WHERE cName = 'FEUP' AND sID in (
    SELECT sID
    FROM Student
    WHERE GPA < 3.6
);

UPDATE Student
SET GPA = (SELECT max(GPA) FROM Student), 
    sizeHS = (SELECT min(sizeHS) FROM Student);