PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Pessoa;

CREATE TABLE Pessoa (
    idPessoa INTEGER PRIMARY KEY,
    nome CHAR(30) CONSTRAINT ErroPessoaNome NOT NULL,
    dataNascimento DATE CONSTRAINT ErroPessoaData NOT NULL,
    telefone INTEGER CONSTRAINT ErroPessoaTelefone NULL,
    idade INTEGER CONSTRAINT ErroPessoaIdade NOT NULL,
    nif INTEGER CONSTRAINT ErroPessoaNif NULL  
);

DROP TABLE IF EXISTS Funcionario;

CREATE TABLE Funcionario (
    idPessoa INTEGER CONSTRAINT ErroFuncionarioIdPessoa PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    salario INTEGER CONSTRAINT ErroFuncionarioSalario CHECK (salario >= 0)
);

DROP TABLE IF EXISTS Gerente;

CREATE TABLE Gerente (
    idFuncionario CONSTRAINT ErroGerenteIdFuncionario PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico CONSTRAINT ErroGerenteIdAnosServico CHECK (anosServico > 4)
);

DROP TABLE IF EXISTS NaoGerente;

CREATE TABLE NaoGerente (
    idFuncionario CONSTRAINT ErroNaoGerenteIdFuncionario PRIMARY KEY REFERENCES Pessoa (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    funcao TEXT
);

DROP TABLE IF EXISTS Cliente;

CREATE TABLE Cliente (
    idPessoa INTEGER CONSTRAINT ErroClienteIdPessoa PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    maioridade BOOL CONSTRAINT ErroClienteMaioridade NOT NULL
);

DROP TABLE IF EXISTS Armazem;

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY,
    telefone INTEGER CONSTRAINT ErroArmazemTelefone NOT NULL,
    local TEXT CONSTRAINT ErroArmazemLocal NOT NULL,
    UNIQUE(telefone, local)
);

DROP TABLE IF EXISTS Horario;

CREATE TABLE Horario (
    idHorario INTEGER PRIMARY KEY,
    horaInicio TIME CONSTRAINT ErroHorarioInicio NOT NULL,
    horaFinal TIME CONSTRAINT ErroHorarioFinal NOT NULL,
    diaSemana TEXT CONSTRAINT ErroHorarioDia CHECK ( (diaSemana = "SEGUNDA-FEIRA" OR 
                            diaSemana = "TERCA-FEIRA" OR 
                            diaSemana = "QUARTA-FEIRA" OR 
                            diaSemana = "QUINTA-FEIRA" OR 
                            diaSemana = "SEXTA-FEIRA" OR 
                            diaSemana = "SABADO" OR 
                            diaSemana = "DOMINGO" ) ),
    UNIQUE (diaSemana, horaInicio, horaFinal)
);

DROP TABLE IF EXISTS HorarioFuncionario;

CREATE TABLE HorarioFuncionario (
    idFuncionario INTEGER CONSTRAINT ErroHorarioFuncionarioIdFuncionario REFERENCES Funcionario (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idHorario INTEGER CONSTRAINT ErroHorarioFuncionarioIdHorario REFERENCES Horario (idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idFuncionario, idHorario)
);

DROP TABLE IF EXISTS Produto;

CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY,
    preco INTEGER CONSTRAINT ErroProdutoPreco CHECK (preco >= 0)
);

DROP TABLE IF EXISTS Utensilio;

CREATE TABLE Utensilio (
    idProduto INTEGER CONSTRAINT ErroUtensilioIdProduto PRIMARY KEY REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    nome INTEGER CONSTRAINT ErroUtensilioNome NOT NULL 
);

DROP TABLE IF EXISTS Vinho;

CREATE TABLE Vinho (
    idProduto INTEGER CONSTRAINT ErroVinhoIdProduto PRIMARY KEY REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    tipo TEXT CONSTRAINT ErroVinhoTipo NOT NULL,
    regiao TEXT CONSTRAINT ErroVinhoRegiao NOT NULL,
    anoProducao INTEGER CONSTRAINT ErroVinhoAnoProducao NOT NULL,
    teorAlcool FLOAT CONSTRAINT ErroVinhoTeorAlcool NOT NULL,
    capacidadeGarrafa FLOAT CONSTRAINT ErroVinhoCapacidadeGarrafa NOT NULL, 
    UNIQUE (tipo, regiao, anoProducao, teorAlcool, capacidadeGarrafa)
);

DROP TABLE IF EXISTS Cartao;

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY,
    dataAdesao DATE CONSTRAINT ErroCartaoDataAdesao NOT NULL,
    saldo INTEGER CONSTRAINT ErroCartaoSaldo CHECK (saldo>=0),
    numero INTEGER CONSTRAINT ErroCartaoNumero CHECK (numero>0)
);

DROP TABLE IF EXISTS Prova;

CREATE TABLE Prova (
    quantidade INTEGER CONSTRAINT ErroProvaQuantidade CHECK (quantidade<=5),
    idCliente INTEGER CONSTRAINT ErroProvaIdCliente REFERENCES Cliente (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idVinho INTEGER CONSTRAINT ErroProvaIdVinho REFERENCES Vinho (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idCliente, idVinho)
);

DROP TABLE IF EXISTS Stock;

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT ErroStockIdArmazem REFERENCES Armazem (idArmazem) ON DELETE CASCADE ON UPDATE CASCADE,
    idProduto INTEGER CONSTRAINT ErroStockIdProduto REFERENCES Produto (idProduto) ON DELETE CASCADE ON UPDATE CASCADE,
    quantidade INTEGER CONSTRAINT ErroStockQuantidade CHECK (quantidade > 0),
    PRIMARY KEY (idArmazem, idProduto)
);

DROP TABLE IF EXISTS Compra;

CREATE TABLE Compra (
    idProduto INTEGER CONSTRAINT ErroCompraIdProduto REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    idCliente INTEGER CONSTRAINT ErroCompraIdCliente REFERENCES Cliente (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    data DATE CONSTRAINT ErroCompraData NOT NULL,
    preco INTEGER CONSTRAINT ErroCompraPreco CHECK (preco>=0),
    quantidade INTEGER CONSTRAINT ErroComparaQuantidade CHECK (quantidade>0),
    PRIMARY KEY (idCliente, idProduto)
);

COMMIT TRANSACTION;
PRAGMA foreign_keys = ON;