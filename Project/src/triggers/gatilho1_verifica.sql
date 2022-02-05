.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ' '
.print 'Criação de um novo cliente'
.print ' '

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade
                        ) 
                        VALUES (
                            1, 
                            'João Pedro',
                            '2005-02-25',
                            'Porto, Rua Santa Catarina 19',
                            914523697,
                            16,
                            250252748,
                            0
                    );

SELECT * FROM Cliente WHERE idPessoa = 1;

.print ' '
.print 'O cliente pode comprar um utensílio pois é menor de idade'
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
                            1,
                            20,
                            '2022-01-05',
                            1,
                            5.5,
                            0.4
                    );  

SELECT * FROM Compra WHERE idCliente = 1;

.print ' '
.print 'O cliente não pode comprar um vinho pois é menor de idade'
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
                            1,
                            55,
                            '2022-01-05',
                            1,
                            5.5,
                            0.4
                    );  

.print ' '
SELECT * FROM Compra WHERE idCliente = 1;