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
    nome CHAR(30) CONSTRAINT ErroPessoaNome NOT NULL,
    dataNascimento DATE CONSTRAINT ErroPessoaData NOT NULL,
    telefone INTEGER CONSTRAINT ErroPessoaTelefone NULL,
    idade INTEGER CONSTRAINT ErroPessoaIdade NOT NULL,
    nif INTEGER CONSTRAINT ErroPessoaNif NULL  
);

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY,
    telefone INTEGER CONSTRAINT ErroArmazemTelefone NOT NULL,
    local TEXT CONSTRAINT ErroArmazemLocal NOT NULL,
    UNIQUE(telefone, local)
);

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT ErroStockIdArmazem REFERENCES Armazem (idArmazem) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER CONSTRAINT ErroStockIdProduto REFERENCES Produto (idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
    quantidade INTEGER CONSTRAINT ErroStockQuantidade CHECK (quantidade > 0),
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
    idFuncionario INTEGER REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE,
    idHorario INTEGER REFERENCES Horario (idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idFuncionario, idHorario)
);

CREATE TABLE Funcionario (
    idPessoa INTEGER PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    salario INTEGER CHECK (salario >= 0)
);

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    maioridade BOOL NOT NULL
);

CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY,
    preco INTEGER CONSTRAINT precoNotNegative CHECK (preco >= 0)
);

CREATE TABLE Gerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico CONSTRAINT anosServicoSupQuatro CHECK (anosServico > 4)
);

CREATE TABLE NaoGerente (
    idFuncionario CONSTRAINT idFuncionarioPK PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE
);