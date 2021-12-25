-- A simple subquerie

SELECT name FROM Student WHERE id IN            -- Returns student's name that are now enrolled in BD
                        (SELECT id from Apply WHERE major = 'BD')

-- Exists operator

SELECT name FROM Students WHERE id EXISTS IN    -- Returns student's name that has degree more than 16.0
                         (SELECT id from Student WHERE degree > 16.0)

                        