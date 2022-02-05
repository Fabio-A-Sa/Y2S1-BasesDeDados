.mode columns
.headers on
.nullvalue NULL

SELECT strftime('%Y-%m', data) as Mês, sum(preco) as Lucro
FROM Compra
WHERE (strftime('%Y', 'NOW') - strftime('%Y', data)) = 1
GROUP BY Mês
ORDER BY Mês ASC;