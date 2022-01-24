-- Created on January, 2022
-- @author: Fábio Araújo de Sá

SELECT min(GPA)
FROM Student
WHERE Student.sID = Apply.sID AND major = 'CS';

SELECT max(abs(maximum - minimum)) as difference
FROM (
    SELECT cName, major, min(GPA) as minimum, max(GPA) as maximum
    FROM Student, Apply
    WHERE Student.id = Apply.id
    GROUP BY cName, major
);

SELECT cName
FROM Apply
GROUP BY cName
HAVING count(DISTINCT sID) < 5; -- excluem valores nulos