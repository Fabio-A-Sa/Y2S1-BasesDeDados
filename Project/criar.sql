-- Eliminar as tabelas, se existirem

DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Gerente;
DROP TABLE IF EXISTS NaoGerente;

-- Criar as novas tabelas, com restrições

CREATE TABLE Funcionario (
    idPessoa CONSTRAINT idPessoaPK PRIMARY KEY REFERENCES Pessoa(idPessoa),
    salario INTEGER CONSTRAINT salarioNotNegative CHECK (salario >= 0)
    numId INTEGER CONSTRAINT numIdNotNull NOT NULL
);

