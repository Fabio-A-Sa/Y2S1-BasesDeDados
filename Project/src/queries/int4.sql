.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT nome as Nome, count(*) AS NumeroCompras
FROM (
    Cliente NATURAL JOIN ( SELECT idCliente AS idPessoa FROM Compra)
)
GROUP BY nome;