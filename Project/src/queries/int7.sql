.mode columns
.headers on
.nullvalue NULL

SELECT Stock.idProduto, Utensilio.nome, sum(quantidade) AS Quantidade
FROM Stock, Utensilio
WHERE Stock.idProduto = Utensilio.idProduto AND EXISTS (
    SELECT idProduto
    FROM Utensilio
    WHERE Utensilio.idProduto = Stock.idProduto
)
GROUP BY Stock.idProduto;