-- A simple subquerie

SELECT name FROM Student WHERE id IN (
    SELECT id from Apply WHERE major = 'BD'          -- Returns student's name that are now enrolled in BD
);

-- Exists operator

SELECT name FROM Student WHERE id EXISTS IN (
    SELECT id from Student WHERE GPA > 16.0       -- Returns student's name that has GPA more than 16.0
);

-- Maximum value

SELECT name FROM Student S1 WHERE not exists (
    SELECT * FROM Student S2 WHERE S2.GPA > S1.GPA   -- Returns all students that have the same maximum GPA
);