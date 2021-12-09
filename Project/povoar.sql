PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table Pessoa



-- Table Cartao

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            9,
                            24,
                            20,
                            '2015-10-25'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            3,
                            52,
                            15,
                            '2018-05-28'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            7,
                            71,
                            8,
                            '2020-08-05'
                    );

-- Table Cliente

INSERT INTO Cliente (
                        idPessoa, 
                        maiorIdade
                        ) VALUES (
                            3847, 
                            1
                    );

INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (2356, 9, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (6578, 1);
INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (7657, 3, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (8566, 1);
INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (2354, 7, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (5477, 1);

-- Table Funcionario

INSERT INTO Funcionario (idPessoa, salario) VALUES (9812, 872);
INSERT INTO Funcionario (idPessoa, salario) VALUES (7823, 689);
INSERT INTO Funcionario (idPessoa, salario) VALUES (8594, 1129);

-- Table NaoGerente

INSERT INTO NaoGerente (idFuncionario, funcao) VALUES (9812, "limpeza");
INSERT INTO NaoGerente (idFuncionario, funcao) VALUES (7823, "armazem");

-- Table Gerente

INSERT INTO Gerente (idFuncionario, anosServico) VALUES (8594, 6);

-- Table Produto

INSERT INTO Produto (idProduto, preco) VALUES (34, 12);
INSERT INTO Produto (idProduto, preco) VALUES (62, 9);
INSERT INTO Produto (idProduto, preco) VALUES (72, 34);
INSERT INTO Produto (idProduto, preco) VALUES (53, 5);
INSERT INTO Produto (idProduto, preco) VALUES (71, 2);
INSERT INTO Produto (idProduto, preco) VALUES (77, 31);
INSERT INTO Produto (idProduto, preco) VALUES (94, 53);
INSERT INTO Produto (idProduto, preco) VALUES (32, 42);
INSERT INTO Produto (idProduto, preco) VALUES (75, 20);
INSERT INTO Produto (idProduto, preco) VALUES (78, 7);

-- Table Vinho



-- Table Utensilio

INSERT INTO Utensilio (
                        idProduto,
                        nome
                        )
                        VALUES (
                            32,
                            'Decantador'
                        );

INSERT INTO Utensilio (
                        idProduto,
                        nome
                        )
                        VALUES (
                            75,
                            'Saca-rolhas'
                        );

INSERT INTO Utensilio (
                        idProduto,
                        nome
                        )
                        VALUES (
                            78,
                            'Bomba de vácuo'
                        );

-- Table Horario



-- Table Armazem



-- Table Stock



-- Table HorarioFuncionario



-- Table Prova

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            77,
                            'queijo',
                            2
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            94,
                            'presunto',
                            1
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            53,
                            'presunto',
                            1
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            2354,
                            62,
                            'presunto',
                            4
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            2354,
                            34,
                            'queijo',
                            1
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            62,
                            'presunto',
                            2
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            72,
                            'queijo',
                            1
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            53,
                            'queijo',
                            1
                            );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            71,
                            'presunto',
                            1
                            );

-- Table Compra



COMMIT TRANSACTION;