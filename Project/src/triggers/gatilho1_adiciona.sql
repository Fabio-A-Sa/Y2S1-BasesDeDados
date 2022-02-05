.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS CompraValida
BEFORE INSERT ON Compra
WHEN (
    NEW.idCliente NOT IN (
        SELECT idPessoa AS idCliente
        FROM Cliente
        WHERE Cliente.maioridade = 1
    )
    AND
    NEW.idProduto IN (
        SELECT idProduto
        FROM Vinho
    )
)
BEGIN
    SELECT RAISE(ABORT, "O cliente não é maior de idade!");
END;