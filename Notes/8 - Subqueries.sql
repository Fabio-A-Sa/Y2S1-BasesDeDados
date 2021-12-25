-- A simple subquerie

SELECT name FROM Student WHERE id IN            -- Returns student's name that are now enrolled in BD
                        (SELECT id from Apply WHERE major = 'BD')

-- Exists operator

SELECT name FROM Students WHERE id EXISTS IN 
                         (SELECT id from Student WHERE )