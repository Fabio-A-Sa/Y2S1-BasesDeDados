PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS HorarioFuncionario;
DROP TABLE IF EXISTS Prova;
DROP TABLE IF EXISTS Compra;
DROP TABLE IF EXISTS Cliente;
DROP TABLE IF EXISTS Cartao;
DROP TABLE IF EXISTS NaoGerente;
DROP TABLE IF EXISTS Gerente;
DROP TABLE IF EXISTS Vinho;
DROP TABLE IF EXISTS Utensilio;
DROP TABLE IF EXISTS Horario;
DROP TABLE IF EXISTS Armazem;

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY CONSTRAINT IdCartaoNaoNulo NOT NULL,
    numero INTEGER CONSTRAINT NumeroCartaoNaoNegativo CHECK (numero > 0),
    saldo FLOAT CONSTRAINT SaldoCartaoNaoNegativo CHECK (saldo >= 0),
    dataAdesao DATE CONSTRAINT DataAdesaoCartaoNaoNula NOT NULL
);

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdClienteNaoNulo NOT NULL,
    nome CHAR(30) CONSTRAINT NomeClienteNaoNulo NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoClienteNaoNulo NOT NULL,
    morada VARCHAR(30),
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeClienteNaoNegativo CHECK (idade >= 0),
    nif CHAR(9),
    maioridade BOOL CONSTRAINT MaioridadeClienteNaoNula NOT NULL,
    idCartao INTEGER CONSTRAINT IdCartaoCliente REFERENCES Cartao (idCartao) ON DELETE SET NULL ON UPDATE CASCADE DEFAULT NULL
);

CREATE TABLE NaoGerente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdNaoGerenteNaoNulo NOT NULL,
    nome CHAR(30) CONSTRAINT NomeNaoGerenteNaoNulo NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoNaoGerenteNaoNulo NOT NULL,
    morada VARCHAR(30),
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeNaoGerenteNaoNegativa CHECK (idade >= 0),
    nif CHAR(9),
    salario INTEGER CONSTRAINT SalarioNaoGerenteNaoNegativo CHECK (salario >= 0),
    funcao VARCHAR(30)
);

CREATE TABLE Gerente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdGerenteNaoNulo NOT NULL,
    nome CHAR(30) CONSTRAINT NomeGerenteNaoNulo NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoGerenteNaoNula NOT NULL,
    morada VARCHAR(30),
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeGerenteNaoNegativa CHECK (idade >= 0),
    nif CHAR(9),
    salario INTEGER CONSTRAINT SalarioGerenteNaoNegativo CHECK (salario >= 0),
    anosServico INTEGER CONSTRAINT AnosServicoGerenteMinQuatro CHECK (anosServico > 4)
);

CREATE TABLE Vinho (
    idProduto INTEGER PRIMARY KEY CONSTRAINT IdVinhoNaoNulo NOT NULL,
    preco INTEGER CONSTRAINT PrecoVinhoNaoNulo CHECK (preco >= 0),
    tipo VARCHAR(30) CONSTRAINT TipoVinhoNaoNulo NOT NULL,
    regiao VARCHAR(30) CONSTRAINT RegiaoVinhoNaoNulo NOT NULL,
    anoProducao INTEGER CONSTRAINT AnoProducaoVinhoNaoNulo NOT NULL,
    teorAlcool FLOAT CONSTRAINT TeorAlcoolVinhoNaoNulo NOT NULL,
    capacidadeGarrafa FLOAT CONSTRAINT CapacidadeGarrafaVinhoNaoNula NOT NULL, 
    UNIQUE (tipo, regiao, anoProducao, teorAlcool, capacidadeGarrafa)
);

CREATE TABLE Utensilio (
    idProduto INTEGER PRIMARY KEY CONSTRAINT IdUtensilioNaoNulo NOT NULL,
    preco INTEGER CONSTRAINT PrecoUtensilioNaoNegativo CHECK (preco >= 0),
    nome CHAR(30) CONSTRAINT NomeUtensilioNaoNulo NOT NULL
);

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY CONSTRAINT IdHorarioNaoNulo NOT NULL,
    diaSemana VARCHAR(30) CONSTRAINT DiaSemanaPossivel CHECK ((  diaSemana = "SABADO" OR
                                                                 diaSemana = "DOMINGO" OR
                                                                 diaSemana = "SEGUNDA-FEIRA" OR 
                                                                 diaSemana = "TERCA-FEIRA" OR 
                                                                 diaSemana = "QUARTA-FEIRA" OR 
                                                                 diaSemana = "QUINTA-FEIRA" OR 
                                                                 diaSemana = "SEXTA-FEIRA"       ) ),
    horaInicio TIME CONSTRAINT HoraInicioHorarioNaoNula NOT NULL DEFAULT "00:00:00",
    horaFinal TIME CONSTRAINT HoraFinalHorarioNaoNula NOT NULL DEFAULT "00:00:00",
    UNIQUE (diaSemana, horaInicio, horaFinal)
);

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY CONSTRAINT IdArmazemNaoNulo NOT NULL,
    telefone INTEGER CONSTRAINT TelefoneArmazemNaoNulo NOT NULL,
    local VARCHAR(30) CONSTRAINT LocalArmazemNaoNulo NOT NULL,
    UNIQUE (telefone, local)
);

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT IdArmazemStockNaoNulo NOT NULL REFERENCES Armazem (idArmazem) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER CONSTRAINT IdProdutoStockNaoNulo NOT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeStockPositiva CHECK (quantidade > 0) DEFAULT 1,
    PRIMARY KEY (idArmazem, idProduto)
);

CREATE TABLE HorarioFuncionario (
    idHorario INTEGER CONSTRAINT IdHorarioHorarioFuncionarioNaoNulo NOT NULL REFERENCES Horario (idHorario) ON DELETE CASCADE ON UPDATE CASCADE,
    idPessoa INTEGER CONSTRAINT IdPessoaHorarioFuncionarioNaoNulo NOT NULL,
    PRIMARY KEY (idHorario, idPessoa)
);

CREATE TABLE Prova (
    idCliente INTEGER CONSTRAINT IdClienteProvaNaoNulo NOT NULL REFERENCES Cliente (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    idVinho INTEGER CONSTRAINT IdVinhoProvaNaoNulo NOT NULL REFERENCES Vinho (idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
    acompanhamento VARCHAR(30) DEFAULT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeProvaInferiorSeis CHECK (quantidade <= 5) DEFAULT 0,
    PRIMARY KEY (idCliente, idVinho)
);

CREATE TABLE Compra (
    idCliente INTEGER CONSTRAINT IdClienteCompraNaoNulo NOT NULL REFERENCES Cliente (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER CONSTRAINT IdProdutoCompraNaoNulo NOT NULL,
    data DATE CONSTRAINT DataCompraNaoNulo NOT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeCompraPositiva CHECK (quantidade > 0),
    preco INTEGER CONSTRAINT PrecoCompraPositiva CHECK (preco > 0),
    desconto INTEGER,
    PRIMARY KEY (idCliente, idProduto)
);

COMMIT TRANSACTION;