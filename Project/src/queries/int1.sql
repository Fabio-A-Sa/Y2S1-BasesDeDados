.mode columns
.headers on
.nullvalue NULL

SELECT nome 
FROM Cliente 
WHERE idCartao IS NULL
ORDER BY nome ASC;