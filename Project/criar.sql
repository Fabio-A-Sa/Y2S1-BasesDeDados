-- Eliminar as tabelas, se existirem

DROP TABLE IF EXISTS Pessoa;
DROP TABLE IF EXISTS Armazem;
DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS HorarioFuncionario;
DROP TABLE IF EXISTS Funcionario;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Produto;
DROP TABLE IF EXISTS Gerente;
DROP TABLE IF EXISTS NaoGerente;
DROP TABLE IF EXISTS Cartao;
DROP TABLE IF EXISTS Prova;
DROP TABLE IF EXISTS Utensilios;
DROP TABLE IF EXISTS Vinho;
DROP TABLE IF EXISTS Compra;

-- Criar as novas tabelas, com restrições

CREATE TABLE Pessoa (
    idPessoa INTEGER PRIMARY KEY,
    nome CHAR(30) NOT NULL,
    dataNascimento DATE NOT NULL,
    telefone INTEGER NOT NULL,
    idade INTEGER NOT NULL,
    nif INTEGER NOT NULL  
);

CREATE TABLE Armazem (
    idArmazem PRIMARY KEY,
    telefone INTEGER,
    local TEXT,
    UNIQUE(telefone, local)
);

CREATE TABLE Stock (
    idArmazem INTEGER REFERENCES Armazem (idArmazem) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER REFERENCES Produto (idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
    quantidade INTEGER CHECK (quantidade > 0),
    PRIMARY KEY (idArmazem, idProduto)
);

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY,
    horaInicio TIME NOT NULL,
    horaFinal TIME NOT NULL,
    diaSemana TEXT CHECK ( (diaSemana = "SEGUNDA-FEIRA" OR 
                            diaSemana = "TERCA-FEIRA" OR 
                            diaSemana = "QUARTA-FEIRA" OR 
                            diaSemana = "QUINTA-FEIRA" OR 
                            diaSemana = "SEXTA-FEIRA" OR 
                            diaSemana = "SABADO" OR 
                            diaSemana = "DOMINGO" ) ),
    UNIQUE (diaSemana, horaInicio, horaFinal)
);

CREATE TABLE HorarioFuncionario (
    idFuncionario REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE,
    idHorario REFERENCES Horario (idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idFuncionario, idHorario)
);

CREATE TABLE Funcionario (
    idPessoa PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    salario CHECK (salario >= 0)
);

CREATE TABLE Cliente (
    idPessoa INTEGER CONSTRAINT idPessoaPK PRIMARY KEY REFERENCES Pessoa(idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    maioridade CONSTRAINT maioridadeNotNull NOT NULL
);

CREATE TABLE Produto (
    idProduto PRIMARY KEY,
    preco CONSTRAINT precoNotNegative CHECK (preco >= 0)
);

CREATE TABLE Gerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico CONSTRAINT anosServicoSupQuatro CHECK (anosServico > 4)
);

CREATE TABLE NaoGerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE
);