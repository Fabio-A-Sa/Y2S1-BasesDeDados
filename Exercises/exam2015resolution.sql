-- 8.1

SELECT caption
FROM Photo, User
WHERE 	Photo.user = User.id AND 
	User.name LIKE 'Daniel Ramos' AND
	abs(julianday(Photo.uploadDate) - julianday(Photo.creationDate)) = 2;

-- 8.2

