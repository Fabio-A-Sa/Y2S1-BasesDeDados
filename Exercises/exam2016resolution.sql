-- 5.1

SELECT Estudante.nome, Curso.nome
FROM Estudante, Curso
WHERE Estudante.curso = Curso.ID AND Estudante.anoCurricular = 3;

-- 5.2

SELECT Estudante.nome, Estudante.anoCurricular
FROM Estudante
WHERE Estudante.ID IN (
	SELECT Estudante.ID FROM ( SELECT Estudante.ID, max(qtd) 
	FROM (
	SELECT Estudante.ID, count(Amizade.ID2) as qtd
	FROM Estudante, Amizade
	WHERE Estudante.ID = Amizade.ID1
	GROUP BY Estudante.ID
	))
);

SELECT Estudante.ID, max(qtd) 
FROM (
	SELECT Estudante.ID, count(Amizade.ID2) as qtd
	FROM Estudante, Amizade
	WHERE Estudante.ID = Amizade.ID1
	GROUP BY Estudante.ID
)