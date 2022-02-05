.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

CREATE TRIGGER IF NOT EXISTS debitaSaldo
AFTER INSERT ON Compra
FOR EACH ROW
BEGIN
    UPDATE Cartao
    SET saldo = round(saldo - (1 - New.desconto) * NEW.preco, 2)
    WHERE Cartao.idCartao IN (
        SELECT idCartao
        FROM Cliente
        WHERE NEW.idCliente = Cliente.idPessoa
    );
END;