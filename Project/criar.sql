PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Cartao;

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY CONSTRAINT IdCartao NOT NULL,
    dataAdesao DATE CONSTRAINT DataAdesaoCartao NOT NULL,
    saldo INTEGER CONSTRAINT SaldoCartao CHECK (saldo >= 0),
    numero INTEGER CONSTRAINT NumeroCartao CHECK (numero > 0)
);

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdCliente NOT NULL,
    nome CHAR(30) CONSTRAINT NomeCliente NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoCliente NOT NULL,
    morada TEXT,
    telefone CHAR(9),
    idade INTEGER CONSTRAINT IdadeCliente CHECK (idade >= 0),
    nif CHAR(9),
    maioridade BOOL CONSTRAINT MaioridadeCliente NOT NULL,
    idCartao UNIQUE INTEGER CONSTRAINT IdCartaoCliente REFERENCES Cartao (idCartao)
);

DROP TABLE IF EXISTS NaoGerente;

CREATE TABLE NaoGerente (
    idFuncionario INTEGER CONSTRAINT ErroNaoGerenteIdFuncionario PRIMARY KEY NOT NULL REFERENCES Pessoa (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    funcao TEXT
);

DROP TABLE IF EXISTS Gerente;

CREATE TABLE Gerente (
    idFuncionario INTEGER CONSTRAINT ErroGerenteIdFuncionario PRIMARY KEY NOT NULL REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico INTEGER CONSTRAINT ErroGerenteIdAnosServico CHECK (anosServico > 4)
);

DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY NOT NULL,
    preco INTEGER CONSTRAINT ErroProdutoPreco CHECK (preco >= 0)
);

DROP TABLE IF EXISTS Vinho;

CREATE TABLE Vinho (
    idProduto INTEGER CONSTRAINT ErroVinhoIdProduto PRIMARY KEY NOT NULL REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    tipo TEXT CONSTRAINT ErroVinhoTipo NOT NULL,
    regiao TEXT CONSTRAINT ErroVinhoRegiao NOT NULL,
    anoProducao INTEGER CONSTRAINT ErroVinhoAnoProducao NOT NULL,
    teorAlcool FLOAT CONSTRAINT ErroVinhoTeorAlcool NOT NULL,
    capacidadeGarrafa FLOAT CONSTRAINT ErroVinhoCapacidadeGarrafa NOT NULL, 
    UNIQUE (tipo, regiao, anoProducao, teorAlcool, capacidadeGarrafa)
);

DROP TABLE IF EXISTS Utensilio;

CREATE TABLE Utensilio (
    idProduto INTEGER CONSTRAINT ErroUtensilioIdProduto PRIMARY KEY NOT NULL REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    nome CHAR(30) CONSTRAINT ErroUtensilioNome NOT NULL 
);

DROP TABLE IF EXISTS Horario;

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY NOT NULL,
    horaInicio TIME CONSTRAINT ErroHorarioInicio NOT NULL,
    horaFinal TIME CONSTRAINT ErroHorarioFinal NOT NULL,
    diaSemana TEXT CONSTRAINT ErroHorarioDia CHECK ( (  diaSemana = "SABADO" OR
                                                        diaSemana = "DOMINGO" OR
                                                        diaSemana = "SEGUNDA-FEIRA" OR 
                                                        diaSemana = "TERCA-FEIRA" OR 
                                                        diaSemana = "QUARTA-FEIRA" OR 
                                                        diaSemana = "QUINTA-FEIRA" OR 
                                                        diaSemana = "SEXTA-FEIRA"   ) ),
    UNIQUE (diaSemana, horaInicio, horaFinal)
);

DROP TABLE IF EXISTS Armazem;

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY NOT NULL,
    telefone INTEGER CONSTRAINT ErroArmazemTelefone NOT NULL,
    local TEXT CONSTRAINT ErroArmazemLocal NOT NULL,
    UNIQUE (telefone, local)
);

DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT ErroStockIdArmazem NOT NULL REFERENCES Armazem (idArmazem) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER CONSTRAINT ErroStockIdProduto NOT NULL REFERENCES Produto (idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
    quantidade INTEGER CONSTRAINT ErroStockQuantidade CHECK (quantidade > 0),
    PRIMARY KEY (idArmazem, idProduto)
);

DROP TABLE IF EXISTS HorarioFuncionario;

CREATE TABLE HorarioFuncionario (
    idFuncionario INTEGER CONSTRAINT ErroHorarioFuncionarioIdFuncionario NOT NULL REFERENCES Funcionario (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idHorario INTEGER CONSTRAINT ErroHorarioFuncionarioIdHorario NOT NULL REFERENCES Horario (idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idFuncionario, idHorario)
);

DROP TABLE IF EXISTS Prova;

CREATE TABLE Prova (
    idCliente INTEGER CONSTRAINT ErroProvaIdCliente NOT NULL REFERENCES Cliente (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idVinho INTEGER CONSTRAINT ErroProvaIdVinho NOT NULL REFERENCES Vinho (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    acompanhamento TEXT DEFAULT NULL,
    quantidade INTEGER CONSTRAINT ErroProvaQuantidade CHECK (quantidade <= 5),
    PRIMARY KEY (idCliente, idVinho)
);

DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra (
    idCliente INTEGER CONSTRAINT ErroCompraIdCliente NOT NULL REFERENCES Cliente (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idProduto INTEGER CONSTRAINT ErroCompraIdProduto NOT NULL REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    data DATE CONSTRAINT ErroCompraData NOT NULL,
    quantidade INTEGER CONSTRAINT ErroComparaQuantidade CHECK (quantidade > 0),
    desconto INTEGER,
    preco INTEGER CONSTRAINT ErroCompraPreco CHECK (preco > 0),
    PRIMARY KEY (idCliente, idProduto)
);

COMMIT TRANSACTION;