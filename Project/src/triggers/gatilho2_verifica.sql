.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE VIEW Produto AS
SELECT *
FROM (
    SELECT idProduto, preco, tipo AS nome FROM Vinho
    UNION
    SELECT idProduto, preco, nome FROM Utensilio
);

.print ' '
.print 'Stock inicial de alguns produtos da Loja'
.print ' '

SELECT Produto.nome, Stock.idProduto AS id, Stock.quantidade 
FROM Stock, Produto 
WHERE (Stock.idProduto = 34 OR Stock.idProduto = 62 OR Stock.idProduto = 75)
       AND Stock.idProduto = Produto.idProduto;

.print ' '
.print 'Compra de 5 unidades do utensílio "Saca-rolhas":'
.print ' '

INSERT INTO Compra VALUES (
                            1765,
                            75,
                            '2022-01-21',
                            5,
                            5.5,
                            0.4
);

SELECT Produto.nome, Stock.idProduto AS id, Stock.quantidade 
FROM Stock, Produto 
WHERE (Stock.idProduto = 34 OR Stock.idProduto = 62 OR Stock.idProduto = 75)
       AND Stock.idProduto = Produto.idProduto;

.print ' '
.print 'Compra de 1 unidade do vinho "Verde Branco":'
.print ' '

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            6578,
                            34,
                            '2022-01-21',
                            1,
                            11.3,
                            0.56
                    );

SELECT Produto.nome, Stock.idProduto AS id, Stock.quantidade 
FROM Stock, Produto 
WHERE (Stock.idProduto = 34 OR Stock.idProduto = 62 OR Stock.idProduto = 75)
       AND Stock.idProduto = Produto.idProduto;

.print ' '
.print 'Compra de 2 unidades do vinho "Maduro Tinto":'
.print ' '

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            1234,
                            62,
                            '2022-01-23',
                            2,
                            14.6,
                            0.32
);

SELECT Produto.nome, Stock.idProduto AS id, Stock.quantidade 
FROM Stock, Produto 
WHERE (Stock.idProduto = 34 OR Stock.idProduto = 62 OR Stock.idProduto = 75)
       AND Stock.idProduto = Produto.idProduto;

.print ' '
DROP VIEW Produto;