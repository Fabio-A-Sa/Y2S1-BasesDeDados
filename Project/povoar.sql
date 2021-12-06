PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table Pessoa



-- Table Cartao



-- Table Cliente

INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (3847, 1);
INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (2356, 9, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (6578, 1);
INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (7657, 3, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (8566, 1);
INSERT INTO Cliente (idPessoa, idCartao, maiorIdade) VALUES (2354, 7, 1);
INSERT INTO Cliente (idPessoa, maiorIdade) VALUES (5477, 1);

-- Table Funcionario

INSERT INTO Funcionario (idFuncionario, salario) VALUES (9812, 872);
INSERT INTO Funcionario (idFuncionario, salario) VALUES (7823, 689);
INSERT INTO Funcionario (idFuncionario, salario) VALUES (8594, 1129);

-- Table NaoGerente



-- Table Gerente



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



-- Table Horario



-- Table Armazem



-- Table Stock



-- Table HorarioFuncionario



-- Table Prova



-- Table Compra



COMMIT TRANSACTION;