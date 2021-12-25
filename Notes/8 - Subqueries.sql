-- A simple subquerie

SELECT name FROM Student WHERE id IN            -- Returns student's name that are now enrolled in BD
                        (SELECT id from Apply WHERE major = 'BD');

-- Exists operator

SELECT name FROM Student WHERE id EXISTS IN    -- Returns student's name that has degree more than 16.0
                         (SELECT id from Student WHERE degree > 16.0)

-- Maximum value

SELECT name FROM Student S1 WHERE not exists (
    SELECT * FROM Student S2 WHERE S2.GPA > S1.GPA
);

     -- Returns student's name that are now enrolled in BD
      -- Returns student's name that has degree more than 16.0