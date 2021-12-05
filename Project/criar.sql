-- Eliminar as tabelas, se existirem

DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Gerente;
DROP TABLE IF EXISTS NaoGerente;

-- Criar as novas tabelas, com restrições

CREATE TABLE Funcionario (
    idPessoa INTEGER CONSTRAINT idPessoaPK PRIMARY KEY REFERENCES Pessoa(idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    salario INTEGER CONSTRAINT salarioNotNegative CHECK (salario >= 0),
    numId INTEGER CONSTRAINT numIdNotNull NOT NULL
);

CREATE TABLE Cliente (
    idPessoa INTEGER CONSTRAINT idPessoaPK PRIMARY KEY REFERENCES Pessoa(idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    maioridade CONSTRAINT maioridadeNotNull NOT NULL
);

CREATE TABLE Produto (
    idProduto CONSTRAINT idProdutoPK PRIMARY KEY ON DELETE SET NULL ON UPDATE CASCADE,
    preco CONSTRAINT precoNotNegative CHECK (preco >= 0)
);

CREATE TABLE Gerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico CONSTRAINT anosServicoSupQuatro CHECK (anosServico > 4)
);

CREATE TABLE NaoGerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE
);