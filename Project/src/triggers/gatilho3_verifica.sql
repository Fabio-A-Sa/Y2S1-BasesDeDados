.mode columns
.headers on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ' '
.print 'Estado inicial dos Cartões'
.print ' '

SELECT * FROM Cartao;

.print ' '
.print 'O cliente de cartão com id = 2 irá efetuar uma compra de valor 22,5 euros'
.print 'e desconto de 56%. Ao saldo atual retira-se exatamente 9.9 euros'
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
                            4578,
                            71,
                            '2022-01-26',
                            2,
                            22.5,
                            0.56
);

SELECT * FROM Cartao;

.print ' '
.print 'O cliente anterior volta a fazer uma nova compra, desta vez de 85.3 euros'
.print 'e desconto de 12%. Ao saldo atual retira-se exatamente 75,06 euros'
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
                            4578,
                            72,
                            '2022-01-23',
                            10,
                            85.3,
                            0.12
);

SELECT * FROM Cartao;

.print ' '
.print 'Desta vez, o cliente de ID = 1765 que não possui cartão vai efetuar uma compra'
.print 'Como tal, não há qualquer alteração no saldo dos cartões'
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
                            1765,
                            20,
                            '2022-01-24',
                            5,
                            34.8,
                            0.41
);

SELECT * FROM Cartao;