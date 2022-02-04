-- 5.1

SELECT Estudante.nome, Curso.nome
FROM Estudante, Curso
WHERE Estudante.curso = Curso.ID AND Estudante.anoCurricular = 3;

-- 5.2

SELECT Estudante.nome, Estudante.anoCurricular
FROM Estudante
WHERE Estudante.ID IN (
    SELECT ID 
    FROM (
        SELECT ID, max(qtd) 
        FROM (
            SELECT Estudante.ID, count(Amizade.ID2) as qtd
            FROM Estudante, Amizade
            WHERE Estudante.ID = Amizade.ID1
            GROUP BY Estudante.ID
        )
    )
);

-- 5.3

CREATE TRIGGER Trigger1
AFTER INSERT ON Estudante
FOR EACH ROW
BEGIN
	INSERT INTO Amizade VALUES (id1, id2)
	SELECT e1.ID as id1, e2.ID as id2
	FROM Estudante AS e1, Estudate AS e2
	WHERE 	(e1.ID = NEW.ID OR e2.ID = NEW.ID) AND
		e1.curso = e2.curso AND
		e1.ID != e2.ID;
END

