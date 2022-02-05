.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS verificarStock
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Stock
    SET quantidade = quantidade - NEW.quantidade
    WHERE idProduto = New.idProduto;
END;