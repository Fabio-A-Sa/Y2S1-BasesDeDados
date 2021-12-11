PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Cartao;

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY CONSTRAINT IdCartao NOT NULL,
    numero INTEGER CONSTRAINT NumeroCartao CHECK (numero > 0),
    saldo INTEGER CONSTRAINT SaldoCartao CHECK (saldo >= 0),
    dataAdesao DATE CONSTRAINT DataAdesaoCartao NOT NULL
);

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdCliente NOT NULL,
    nome CHAR(30) CONSTRAINT NomeCliente NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoCliente NOT NULL,
    morada TEXT,
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeCliente CHECK (idade >= 0),
    nif CHAR(9),
    maioridade BOOL CONSTRAINT MaioridadeCliente NOT NULL,
    idCartao INTEGER CONSTRAINT IdCartaoCliente REFERENCES Cartao (idCartao) UNIQUE DEFAULT NULL
);

DROP TABLE IF EXISTS NaoGerente;

CREATE TABLE NaoGerente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdNaoGerente NOT NULL,
    nome CHAR(30) CONSTRAINT NomeNaoGerente NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoNaoGerente NOT NULL,
    morada TEXT,
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeNaoGerente CHECK (idade >= 0),
    nif CHAR(9),
    salario INTEGER CONSTRAINT SalarioNaoGerente CHECK (salario >= 0),
    funcao TEXT
);

DROP TABLE IF EXISTS Gerente;

CREATE TABLE Gerente (
    idPessoa INTEGER PRIMARY KEY CONSTRAINT IdGerente NOT NULL,
    nome CHAR(30) CONSTRAINT NomeGerente NOT NULL,
    dataNascimento DATE CONSTRAINT DataNascimentoGerente NOT NULL,
    morada TEXT,
    telefone INTEGER,
    idade INTEGER CONSTRAINT IdadeGerente CHECK (idade >= 0),
    nif CHAR(9),
    salario INTEGER CONSTRAINT SalarioGerente CHECK (salario >= 0),
    anosServico INTEGER CONSTRAINT AnosServicoGerente CHECK (anosServico > 4)
);

DROP TABLE IF EXISTS Vinho;

CREATE TABLE Vinho (
    idProduto INTEGER PRIMARY KEY CONSTRAINT IdVinho NOT NULL,
    preco INTEGER CONSTRAINT PrecoVinho CHECK (preco >= 0),
    tipo TEXT CONSTRAINT TipoVinho NOT NULL,
    regiao TEXT CONSTRAINT RegiaoVinho NOT NULL,
    anoProducao INTEGER CONSTRAINT AnoProducaoVinho NOT NULL,
    teorAlcool FLOAT CONSTRAINT TeorAlcoolVinho NOT NULL,
    capacidadeGarrafa FLOAT CONSTRAINT CapacidadeGarrafaVinho NOT NULL, 
    UNIQUE (tipo, regiao, anoProducao, teorAlcool, capacidadeGarrafa)
);

DROP TABLE IF EXISTS Utensilio;

CREATE TABLE Utensilio (
    idProduto INTEGER PRIMARY KEY CONSTRAINT IdUtensilio NOT NULL,
    preco INTEGER CONSTRAINT PrecoUtensilio CHECK (preco >= 0),
    nome CHAR(30) CONSTRAINT NomeUtensilio NOT NULL
);

DROP TABLE IF EXISTS Horario;

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY CONSTRAINT IdHorario NOT NULL,
    diaSemana TEXT CONSTRAINT DiaSemanaHorario CHECK ( (    diaSemana = "SABADO" OR
                                                            diaSemana = "DOMINGO" OR
                                                            diaSemana = "SEGUNDA-FEIRA" OR 
                                                            diaSemana = "TERCA-FEIRA" OR 
                                                            diaSemana = "QUARTA-FEIRA" OR 
                                                            diaSemana = "QUINTA-FEIRA" OR 
                                                            diaSemana = "SEXTA-FEIRA"       ) ),
    horaInicio TIME CONSTRAINT HoraInicioHorario NOT NULL,
    horaFinal TIME CONSTRAINT HoraFinalHorario NOT NULL,
    UNIQUE (diaSemana, horaInicio, horaFinal)
);

DROP TABLE IF EXISTS Armazem;

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY CONSTRAINT IdArmazem NOT NULL,
    telefone INTEGER CONSTRAINT TelefoneArmazem NOT NULL,
    local TEXT CONSTRAINT LocalArmazem NOT NULL,
    UNIQUE (telefone, local)
);

DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT IdArmazemStock NOT NULL REFERENCES Armazem (idArmazem),
    idProduto INTEGER CONSTRAINT IdProdutoStock NOT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeStock CHECK (quantidade > 0),
    PRIMARY KEY (idArmazem, idProduto)
);

DROP TABLE IF EXISTS HorarioFuncionario;

CREATE TABLE HorarioFuncionario (
    idPessoa INTEGER CONSTRAINT IdPessoaHorarioFuncionario NOT NULL,
    idHorario INTEGER CONSTRAINT IdHorarioHorarioFuncionario NOT NULL REFERENCES Horario (idHorario),
    PRIMARY KEY (idPessoa, idHorario)
);

DROP TABLE IF EXISTS Prova;

CREATE TABLE Prova (
    idCliente INTEGER CONSTRAINT ClienteProva NOT NULL REFERENCES Cliente (idPessoa),
    idProduto INTEGER CONSTRAINT VinhoProva NOT NULL,
    acompanhamento TEXT DEFAULT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeProva CHECK (quantidade <= 5),
    PRIMARY KEY (idCliente, idProduto)
);

DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra (
    idCliente INTEGER CONSTRAINT IdClienteCompra NOT NULL REFERENCES Cliente (idPessoa),
    idProduto INTEGER CONSTRAINT IdProdutoCompra NOT NULL,
    data DATE CONSTRAINT DataCompra NOT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeCompra CHECK (quantidade > 0),
    preco INTEGER CONSTRAINT PrecoCompra CHECK (preco > 0),
    desconto INTEGER,
    PRIMARY KEY (idCliente, idProduto)
);

COMMIT TRANSACTION;