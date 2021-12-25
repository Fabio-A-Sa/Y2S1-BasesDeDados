-- A simple subquerie

SELECT name FROM Student WHERE id IN (
    SELECT id from Apply WHERE major = 'BD'          -- Returns student's name that are now enrolled in BD
);

-- Exists operator

SELECT name FROM Student WHERE id EXISTS IN (
    SELECT id from Student WHERE GPA > 16.0          -- Returns student's name that has GPA more than 16.0
);

-- Maximum value

SELECT name FROM Student S1 WHERE not exists (
    SELECT * FROM Student S2 WHERE S2.GPA > S1.GPA   -- Returns all students that have the same maximum GPA
);

-- All operator

SELECT name FROM Student S1 WHERE S1.GPA >= ALL (
    SELECT GPA FROM Student S2                       -- Same of above
);

-- Any operator

SELECT name FROM Student S1 WHERE S1.GPA < ANY (
    SELECT GPA FROM Student S2                       -- Same of above
);

-- Existencial quantifier

SELECT DISTINCT name FROM Apply, Student WHERE Apply.SID = Student.SID AND GPA >= 3.8; 

ß