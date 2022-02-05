.mode columns
.headers on
.nullvalue NULL

SELECT * 
From Vinho 
GROUP BY tipo
HAVING preco >= avg(preco)
ORDER BY tipo ASC;