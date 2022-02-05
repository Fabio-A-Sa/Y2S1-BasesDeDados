.mode columns
.headers on
.nullvalue NULL

CREATE VIEW Produto AS
SELECT *
FROM (
    SELECT idProduto, preco FROM Vinho
    UNION
    SELECT idProduto, preco FROM Utensilio
);

CREATE VIEW SubTotais AS
SELECT nome, idCartao, (quantidade * Produto.preco) AS subTotal, desconto 
FROM (
    Cliente INNER JOIN Compra INNER JOIN Produto
    ON Compra.idCliente = Cliente.idPessoa AND Compra.idProduto = Produto.idProduto
);

SELECT Nome, sum(subTotal) as Total
FROM (
    SELECT nome as Nome, subTotal
    FROM SubTotais
    WHERE idCartao IS NULL
    UNION
    SELECT nome, round(((1 - desconto) * subTotal ), 2) AS subTotal
    FROM SubTotais
    WHERE idCartao IS NOT NULL
)
GROUP BY nome
ORDER BY Total DESC;

DROP VIEW Produto;
DROP VIEW SubTotais;