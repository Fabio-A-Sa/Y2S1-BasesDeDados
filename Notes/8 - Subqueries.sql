-- A simple subquerie

SELECT name FROM student WHERE id IN 
                                  (SELECT id from Apply WHERE major = 'BD')

