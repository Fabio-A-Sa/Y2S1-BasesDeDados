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

