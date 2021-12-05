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
DROP TABLE IF EXISTS Utensilio;
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

CREATE TABLE HorarioFuncionario (
    idFuncionario INTEGER CONSTRAINT ErroHorarioFuncionarioIdFuncionario REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE,
    idHorario INTEGER CONSTRAINT ErroHorarioFuncionarioIdHorario REFERENCES Horario (idHorario) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idFuncionario, idHorario)
);

CREATE TABLE Funcionario (
    idPessoa INTEGER CONSTRAINT ErroFuncionarioIdPessoa PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    salario INTEGER CONSTRAINT ErroFuncionarioSalario CHECK (salario >= 0)
);

CREATE TABLE Cliente (
    idPessoa INTEGER CONSTRAINT ErroClienteIdPessoa PRIMARY KEY REFERENCES Pessoa (idPessoa) ON DELETE CASCADE ON UPDATE CASCADE,
    maioridade BOOL CONSTRAINT ErroClienteMaioridade NOT NULL
);

CREATE TABLE Produto (
    idProduto INTEGER PRIMARY KEY,
    preco INTEGER CONSTRAINT ErroProdutoPreco CHECK (preco >= 0)
);

CREATE TABLE Gerente (
    idFuncionario CONSTRAINT ErroGerenteIdFuncionario PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON DELETE CASCADE ON UPDATE CASCADE,
    anosServico CONSTRAINT ErroGerenteIdAnosServico CHECK (anosServico > 4)
);

CREATE TABLE NaoGerente (
    idFuncionario CONSTRAINT ErroNaoGerenteIdFuncionario PRIMARY KEY REFERENCES Funcionario (idFuncionario) ON UPDATE CASCADE ON DELETE CASCADE,
    funcao TEXT
);

CREATE TABLE Cartao (
    idCartao INTEGER PRIMARY KEY,
    dataAdesao DATE CONSTRAINT ErroCartaoDataAdesao NOT NULL,
    saldo INTEGER CONSTRAINT ErroCartaoSaldo CHECK (saldo>=0),
    numero INTEGER CONSTRAINT ErroCartaoNumero CHECK (numero>0)
);

CREATE TABLE Prova (
    quantidade INTEGER CONSTRAINT ErroProvaQuantidade CHECK (quantidade<=5),
    idCliente INTEGER CONSTRAINT ErroProvaIdCliente REFERENCES Cliente (idPessoa) ON UPDATE CASCADE ON DELETE CASCADE,
    idVinho INTEGER CONSTRAINT ErroProvaIdVinho REFERENCES Vinho (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY (idCliente, idVinho)
);

CREATE TABLE Utensilio (
    idProduto INTEGER CONSTRAINT ErroUtensilioIdProduto PRIMARY KEY REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    nome INTEGER CONSTRAINT ErroUtensilioNome NOT NULL 
);

CREATE TABLE Vinho (
    idProduto INTEGER CONSTRAINT ErroVinhoIdProduto PRIMARY KEY REFERENCES Produto (idProduto) ON UPDATE CASCADE ON DELETE CASCADE,
    tipo TEXT CONSTRAINT ErroVinhoTipo NOT NULL,
    regiao TEXT CONSTRAINT ErroVinhoRegiao NOT NULL,
    anoProducao INTEGER CONSTRAINT ErroVinhoAnoProducao NOT NULL,
    teorAlcool FLOAT CONSTRAINT ErroVinhoTeorAlcool NOT NULL,
    capacidadeGarrafa FLOAT CONSTRAINT ErroVinhoCapacidadeGarrafa NOT NULL, 
    UNIQUE (tipo, regiao, anoProducao, teorAlcool, capacidadeGarrafa)
);
