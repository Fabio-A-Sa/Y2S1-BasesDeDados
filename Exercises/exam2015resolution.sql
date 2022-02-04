-- 8.1

SELECT caption
FROM Photo, User
WHERE 	Photo.user = User.id AND 
	User.name LIKE 'Daniel Ramos' AND
	abs(julianday(Photo.uploadDate) - julianday(Photo.creationDate)) = 2;

-- 8.2

SELECT name
FROM User
WHERE User.id NOT IN (
	SELECT User.id
	FROM User, Photo
	WHERE User.id = Photo.user
);

-- 8.3

SELECT  avg(qtd) AS Média 
FROM (
    SELECT count(AppearsIn.photo) AS qtd
    FROM AppearsIn JOIN (
    SELECT Photo.id AS id
    FROM Photo, Likes
    WHERE Photo.id = Likes.photo
    GROUP BY Photo.id
    HAVING count(Likes.photo) > 3
    ) P
    WHERE AppearsIn.photo = P.id
    GROUP BY P.id
);

-- 8.4

SELECT Photo.caption
FROM User, AppearsIn, Photo
WHERE 	AppearsIn.photo = Photo.id AND 
	    AppearsIn.user = User.id AND
	    User.name LIKE 'Daniel Ramos';

-- 8.5

DELETE FROM Photo
WHERE Photo.id NOT IN (
	SELECT Photo.id
	FROM Photo, AppearsIn
	WHERE 	Photo.id = AppearsIn.photo
	GROUP BY Photo.id
	HAVING count(AppearsIn.photo) >= 2	
) AND julianday('2010-01-01') < julianday(Photo.creationDate);

-- 8.6

CREATE TRIGGER Trigger1
AFTER INSERT ON AppearsIn
BEGIN
	INSERT INTO Likes VALUES (NEW.user, NEW.photo);
END