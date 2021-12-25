-- Inner Join / Join for default

SELECT sName, GPA FROM Student JOIN Apply ON Student.sID = Apply.sID WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';