-- My Drafts

-- Create a table

CREATE TABLE Person (
    id INTEGER,            -- Integer type
    name CHAR(30),         -- Immutable char array
    adress VARCHAR(255),   -- Muttable char array
    gender CHAR(1),        -- Char value
    birthday DATE,         -- String text, in format "YYYY-MM-DD"
);

-- Remove a table

DROP TABLE Person;              -- Remove
DROP TABLE IF EXISTS Person;    -- Remove if it's in current directory

-- Add and remove columns/atributes

ALTER TABLE Person ADD country VARCHAR(255); -- Add atribute/collumn country
ALTER TABLE Person REMOVE country;           -- Remove atribute/collumn country

-- Insert data tuples

INSERT INTO Person VALUES (123, "Fabio", "Oporto", 'M', "2002-07-10");
INSERT INTO Person VALUES (4375, "Catarina", "Lisbon", 'F', "2002-11-07");
INSERT INTO Person VALUES (123, "Joana", "Aveiro", 'F', "2002-07-09");

-- To view all tables in current dataBase

.tables

-- To view schema of certain table

.schema Person

-- To view all collumns name in header's table

.header on

-- To view formated data

.mode column

-- To enable Foreing Keys

PRAGMA foreign_keys = ON;

-- Create a table with default values, if insertion NULL

CREATE TABLE Person (
    id INTEGER DEFAULT -1,                                      -- -1, error  
    name CHAR(30) DEFAULT "UNKNOWN",                            -- for default, Unknown 
    adress VARCHAR(255) DEFAULT "Oporto",                       -- for default, Oporto
    gender CHAR(1) DEFAULT 'X',                                 -- for default, X
    birthday DATE DEFAULT now,                                  -- for default, date.now
);

ALTER TABLE Person ADD phone CHAR(14) DEFAULT "+351999999999";  -- for default

-- Note:
-- The default default value of SQLite is NULL

-- To run a query

SELECT * FROM Person;                                           -- Show all atributes and tuples from current table Person
SELECT names, date('2021-11-30')-dateNascimento from Person;    -- Show name | age in current table Person

-- Create a table with constraints

CREATE TABLE Person (
    id INTEGER NOT NULL,                    -- In the insertion, if id == NULL, gives an error    
    name CHAR(30) DEFAULT "Unknown",        -- In the insertion, if name == NULL, name == "Unknown"
    adress VARCHAR(255) UNIQUE,             -- Allows unique values in tuples, and allows NULL values
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
    phone VARCHAR(14) UNIQUE
);

-- or

CREATE TABLE Person (
    id INTEGER NOT NULL,                    -- In the insertion, if id == NULL, gives an error    
    name CHAR(30) DEFAULT "Unknown",        -- In the insertion, if name == NULL, name == "Unknown"
    adress VARCHAR(255),           
    gender CHAR(1) DEFAULT '?',  
    birthday DATE,
    phone VARCHAR(14),
    UNIQUE (adress, phone)                  -- Allows unique subTuples and NULL
    UNIQUE (name, birthdate)                -- Allows unique subTuples and NULL
);

-- Check constraints

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,
    name VARCHAR(10),
    city CHAR(100),
    CHECK (name <> 'ISEP' AND city == 'COIMBRA')
)

INSERT INTO Faculty values ('ISEP', 'PORTO')            -- Gives an error, check violation
INSERT INTO Faculty values ('FEUP', 'COIMBRA')          -- Correct

-- Include constraints name -> Good practise

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,
    name VARCHAR(10) CONSTRAINT NameNotNull NOT NULL,   -- If gives an error, show NameNotNull message
    city CHAR(100) CONSTRAINT CityNotNull NOT NULL,     -- If gives an error, show CityNotNull message
    CHECK (name <> 'ISEP' AND city == 'COIMBRA')
    CONSTRAINT FacultyPKError PRIMARY KEY (id)          -- If gives an error, show FacultyPKError message
);

-- Create a table with primaryKey

CREATE TABLE Person (
    id INTEGER PRIMARY KEY,                     -- Primary Key, NOT NULL and UNIQUE for default            
    name CHAR(30) DEFAULT "Unknown",
    birthDate DATE,
);

-- Create a table with composed primaryKey

CREATE TABLE Faculty (
    id INTEGER AUTOINCREMENT,                   -- Auto increment, based on last table tuple
    name CHAR(30),
    city CHAR(10),
    PRIMARY KEY (id, city)                      -- (id+city) is a composed primary key
);

-- Insert some values and errors

INSERT INTO Person (id, name, birthDate) VALUES (325, "Fabio", '2002-07-10');
INSERT INTO Person (id, name, birthDate) VALUES (23, "Gabriela", '2002-11-10');
INSERT INTO Person (id, name, birthDate) VALUES (325, "Luis", '1987-05-23');        -- Gives an error, UNIQUE key violation

INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 0
INSERT INTO Faculty (name, city) VALUES ("UM", "Braga");                        -- id = 1
INSERT INTO Faculty (name, city) VALUES ("FEUP", "Porto");                      -- id = 2
INSERT INTO Faculty (id, name, city) VALUES (1, "IPCA", "Braga")                -- Gives an error, UNIQUE violation

-- Note
-- If exists an integer ID, ID is an alias of ROWID (implicit primary key)

-- Create tables

CREATE TABLE Student (
    sID INTEGER PRIMARY KEY,
    sName CHAR(10),
    grade FLOAT,
    college CHAR(30)
);

CREATE TABLE College (
    cName CHAR(10) PRIMARY KEY,
    city CHAR(10)
);

CREATE TABLE Apply (
    sID INTEGER REFERENCES Student(sID) ON UPDATE CASCADE ON DELETE SET NULL,            -- Student's primary key
    cName CHAR(10) REFERENCES College(cName) ON UPDATE CASCADE ON DELETE SET NULL,       -- College's primary key
    PRIMARY KEY (sID, cName)                        -- Aplly is a primary key too
)

-- Note
-- if Student has (sID, sName) for Primary Key, Apply will have
-- FOREING KEY (sID, sName) REFERENCES Student(sID, sName);

-- Note
-- if Apply's sID is updated, Student will be updated too
-- if Apply's cName is deleted, College will be set to NULL

-- A simple query

SELECT * FROM Person;                               -- Show all data in Person's table
SELECT name, birthDate-now as age FROM Person;      -- Show name | age in all tuples
SELECT Person1.name, Person2.name FROM Person Person1, Person Person2 WHERE Person1.name > Person2.name;

-- With conditions

SELECT name FROM Person WHERE gender = 'M';                 -- Select all male persons
SELECT name, address FROM Person WHERE birthDate-now < 20;  -- Select all persons which age < 20

-- Sorting

SELECT name FROM Person ORDER BY name;                      -- Show all persons, sorting by names (ascending)
SELECT name FROM Person ORDER BY name ASC, gender DESC;     -- Sorting by name and gender, if exists colision 

-- Like operator

SELECT * FROM PERSON WHERE name LIKE "%bi%";        -- Ex: Fabio
SELECT * FROM PERSON WHERE name LIKE "%na";         -- Ex: Joana, Catarina
SELECT * FROM PERSON WHERE name LIKE "Na%";         -- Ex: Nadia

-- Union operator

SELECT Student.name FROM Student
Union                                       -- Union without repetition (for SQL default)
SELECT Professor.name from Professor
ORDER BY age DESC;

SELECT Student.name FROM Student
Union all                                   -- Union with repetition
SELECT Professor.name from Professor
ORDER BY gender ASC;

-- Intersection

SELECT student.ID from Student WHERE major = 'AED'
INTERSECT                                               -- Select all students that are enrolled in AED and BD
SELECT student.ID from Student WHERE major = 'BD'

-- Except

SELECT student.ID from Student WHERE major = 'AED'
EXCEPT                                                  -- Select all students that are enrolled in AED and not in BD
SELECT student.ID from Studnt WHERE major = 'BD'

-- A simple subquerie

SELECT name FROM Student WHERE id IN (
    SELECT id from Apply WHERE major = 'BD'          -- Returns student's name that are now enrolled in BD
);

-- Exists operator

SELECT name FROM Student WHERE id EXISTS IN (
    SELECT id from Student WHERE GPA > 16.0       -- Returns student's name that has GPA more than 16.0
);

-- Maximum value

SELECT name FROM Student S1 WHERE not exists (
    SELECT * FROM Student S2 WHERE S2.GPA > S1.GPA   -- Returns all students that have the same maximum GPA
);

-- All operator

SELECT name FROM Student S1 WHERE S1.GPA >= ALL (
    SELECT GPA FROM Student S2                       -- Same of above
);

-- Any operator

SELECT name FROM Student S1 WHERE S1.GPA < ANY (
    SELECT GPA FROM Student S2                       -- Same of above
);

-- Existencial quantifier

SELECT DISTINCT name FROM Apply, Student WHERE Apply.SID = Student.SID AND GPA >= 3.8; 

-- Subqueries in the FROM clause
-- Note: só pode retornar um tuplo / um atributo na subquerie do from

SELECT * FROM (SELECT id, Name, GPA, GPA*(HS/1000) AS scaledGPA FROM Student) G
         WHERE abs(scaledGPA - GPA) > 1.0;

-- Inner Join / Join for default

SELECT sName, GPA 
FROM Student JOIN Apply ON Student.sID = Apply.sID 
WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';

SELECT DISTINCT nName, major
FROM Student JOIN Apply USING (sID)           -- Desde que se selecione um atributo em comum nas duas tabelas

-- Natural Join

SELECT DISTINCT sName, major                  -- Desde que tenham um atributo em comum, para fazer a devida junção
FROM Student NATURAL JOIN Apply;

-- Left outer join / left join

SELECT sName, sID, cName, major                      -- Todos os estudantes são ligados aos applies, e se não houver 
FROM Student LEFT OUTER JOIN Apply using (sID)       -- ligação, cName e major ficam NULL

-- Right outer join / right join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes, e se não houver 
FROM Student RIGHT OUTER JOIN Apply using (sID)      -- ligação, sName e sID ficam NULL

-- Full outer join / full join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes e todos os estudantes, e se não houver 
FROM Student FULL OUTER JOIN Apply using (sID)       -- ligados aos applies, se não houver ligação ligação, ficam a NULL


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
    idCartao INTEGER PRIMARY KEY CONSTRAINT IdCartao NOT NULL,
    numero INTEGER CONSTRAINT NumeroCartao CHECK (numero > 0),
    saldo INTEGER CONSTRAINT SaldoCartao CHECK (saldo >= 0),
    dataAdesao DATE CONSTRAINT DataAdesaoCartao NOT NULL
);

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

CREATE TABLE Utensilio (
    idProduto INTEGER PRIMARY KEY CONSTRAINT IdUtensilio NOT NULL,
    preco INTEGER CONSTRAINT PrecoUtensilio CHECK (preco >= 0),
    nome CHAR(30) CONSTRAINT NomeUtensilio NOT NULL
);

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

CREATE TABLE Armazem (
    idArmazem INTEGER PRIMARY KEY CONSTRAINT IdArmazem NOT NULL,
    telefone INTEGER CONSTRAINT TelefoneArmazem NOT NULL,
    local TEXT CONSTRAINT LocalArmazem NOT NULL,
    UNIQUE (telefone, local)
);

CREATE TABLE Stock (
    idArmazem INTEGER CONSTRAINT IdArmazemStock NOT NULL REFERENCES Armazem (idArmazem),
    idProduto INTEGER CONSTRAINT IdProdutoStock NOT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeStock CHECK (quantidade > 0),
    PRIMARY KEY (idArmazem, idProduto)
);

CREATE TABLE HorarioFuncionario (
    idHorario INTEGER CONSTRAINT IdHorarioHorarioFuncionario NOT NULL REFERENCES Horario (idHorario),
    idPessoa INTEGER CONSTRAINT IdPessoaHorarioFuncionario NOT NULL,
    PRIMARY KEY (idHorario, idPessoa)
);

CREATE TABLE Prova (
    idCliente INTEGER CONSTRAINT IdClienteProva NOT NULL REFERENCES Cliente (idPessoa),
    idVinho INTEGER CONSTRAINT IdVinhoProva NOT NULL REFERENCES Vinho (idProduto),
    acompanhamento TEXT DEFAULT NULL,
    quantidade INTEGER CONSTRAINT QuantidadeProva CHECK (quantidade <= 5),
    PRIMARY KEY (idCliente, idVinho)
);

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

PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

-- Table Cartao

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            9,
                            24,
                            20,
                            '2015-10-25'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            3,
                            52,
                            15,
                            '2018-05-28'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            7,
                            71,
                            8,
                            '2020-08-05'
                    );

-- Table Cliente

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade
                        ) 
                        VALUES (
                            3847, 
                            'João Pedro',
                            '2002-01-25',
                            'Porto, Rua Santa Catarina 19',
                            914523697,
                            19,
                            250252748,
                            1
                    );

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade,
                        idCartao
                        ) 
                        VALUES (
                            2356, 
                            'Henrique Silva',
                            '2005-01-25',
                            'Lisboa, Rua de Alvalade 100',
                            935423697,
                            16,
                            250456748,
                            0,
                            9
                    );

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade
                        ) 
                        VALUES (
                            6578,
                            'Rui Costa',
                            '2000-05-13',
                            'Porto, Avenida dos Aliados 44',
                            917892637,
                            21,
                            125364748,
                            1
                    );

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade,
                        idCartao
                        ) 
                        VALUES (
                            7657, 
                            'Carolina Brandão',
                            '1990-01-05',
                            'Évora, Rua Torta 119',
                            914789457,
                            31,
                            256532748,
                            1, 
                            3
                    );

INSERT INTO Cliente (
                        idPessoa,
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade
                        ) 
                        VALUES (
                            8566, 
                            'Fabio Sá',
                            '1998-06-10',
                            'Castelo Branco, Travessa dos Pedregais 88',
                            914524563,
                            23,
                            250278451,
                            1
                    );
                    
INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade,
                        idCartao
                        ) 
                        VALUES (
                            2354, 
                            'João Silva',
                            '2000-02-14',
                            'Porto, Rua da Pasteleira 55',
                            978923697,
                            21,
                            245552748,
                            1, 
                            7
                    );

INSERT INTO Cliente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        maiorIdade
                        ) 
                        VALUES (
                            5477, 
                            'Daniela Marques',
                            '2002-03-18',
                            'Espinho, Rua 19 478',
                            917893697,
                            19,
                            278942748,
                            1
                    );

-- Table NaoGerente

INSERT INTO NaoGerente (
                            idPessoa, 
                            nome,
                            dataNascimento,
                            morada,
                            telefone,
                            idade,
                            nif,
                            salario,
                            funcao
                            ) 
                            VALUES (
                                9812,
                                'Tomás Marques',
                                '1968-09-19',
                                'Braga, Avenida Olímpica 109',
                                975623697,
                                53,
                                255621748,
                                872,
                                "limpeza"
                        );

INSERT INTO NaoGerente (
                            idPessoa, 
                            nome,
                            dataNascimento,
                            morada,
                            telefone,
                            idade,
                            nif,
                            salario,
                            funcao
                            ) 
                            VALUES (
                                7823,
                                'Rita Teixeira',
                                '2002-02-22',
                                'Porto, Rua Santa Catarina 129',
                                919293998,
                                19,
                                254552768,
                                689, 
                                "armazem"
                        );

-- Table Gerente

INSERT INTO Gerente (
                        idPessoa, 
                        nome,
                        dataNascimento,
                        morada,
                        telefone,
                        idade,
                        nif,
                        salario,
                        anosServico
                        ) 
                        VALUES (
                            8594,
                            'José Andrade',
                            '1995-12-25',
                            'Vila Nova de Gaia, Praça dos Descobrimentos 23',
                            914456397,
                            26,
                            251235748,
                            1129, 
                            6
                    );

-- Table Vinho

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            34,
                            12,
                            'Verde Branco',
                            'Minho',
                            2000,
                            12.5,
                            0.7
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            62,
                            9,
                            'Maduro Tinto',
                            'Douro',
                            2017,
                            13,
                            0.75
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            72,
                            34,
                            'Verde Tinto',
                            'Baião',
                            1999,
                            13,
                            0.75
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            53,
                            5,
                            'Maduro Branco',
                            'Riga Tejo',
                            2001,
                            14,
                            0.75
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            71,
                            2, 
                            'Maduro Tinto',
                            'Alentejo',
                            1983,
                            12.5,
                            0.75
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            77,
                            31,
                            'Vinho do Porto Tawny',
                            'Douro',
                            2016,
                            19.5,
                            0.75
                    );

INSERT INTO Vinho ( 
                        idProduto,
                        preco,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            94,
                            53,
                            'Vinho do Porto Branco',
                            'Douro',
                            1999,
                            19.5,
                            0.75
                    );

-- Table Utensilio

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                32,
                                42,
                                'Decantador'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                75,
                                20,
                                'Saca-rolhas'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                78,
                                7,
                                'Bomba de vácuo'
                        );

-- Table Horario

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            54635,
                            'TERCA-FEIRA',
                            '8:00',
                            '18:00'
				    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            34667,
                            'SEGUNDA-FEIRA',
                            '10:00',
                            '20:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            12324,
                            'QUINTA-FEIRA',
                            '10:00',
                            '20:00'
				    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            46767,
                            'SEXTA-FEIRA',
                            '12:00',
                            '20:00'
				    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            25647,
                            'SABADO',
                            '9:00',
                            '16:00'
				    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            46883,
                            'QUARTA-FEIRA',
                            '8:00',
                            '18:00'
				    );
				
INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            58973,
                            'QUINTA-FEIRA',
                            '10:00',
                            '19:00'
				    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            22897,
                            'TERCA-FEIRA',
                            '8:00',
                            '17:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            36724,
                            'SEXTA-FEIRA',
                            '9:00',
                            '18:00'
                    );

-- Table Armazem

INSERT INTO Armazem (
                        idArmazem,
                        telefone,
                        local
                        )
                        VALUES (
                            375,
                            919191919,
                            'Setubal, Avenida da República 10'
                    );

INSERT INTO Armazem (
                        idArmazem,
                        telefone,
                        local
                        )
                        VALUES (
                            832,
                            919191919,
                            'Setubal, Avenida da República 11'
                    );

INSERT INTO Armazem (
                        idArmazem,
                        telefone,
                        local
                        )
                        VALUES (
                            134,
                            919191919,
                            'Setubal, Avenida da República 12'
                    );

-- Table Stock

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            375,
                            72,
                            2
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            375,
                            53,
                            4
                    );

INSERT INTO Stock(
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            375,
                            71,
                            2
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            375,
                            77,
                            2
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            375,
                            94,
                            5
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            134,
                            94,
                            2
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            134,
                            32,
                            4
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            134,
                            75,
                            1
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            134,
                            78,
                            7
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            832,
                            34,
                            2
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            832,
                            62,
                            4
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            832,
                            72,
                            2
				    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                            832,
                            53,
                            6
				    );

-- Table HorarioFuncionario

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        9812,
                                        54635
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7823,
                                        34667
                                );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        8594,
                                        12324
                                );
					
INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        9812,
                                        46767
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7823,
                                        25647
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        8594,
                                        46883
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        9812,
                                        58973
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7823,
                                        22897
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        8594,
                                        36724
					            );

-- Table Prova

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            77,
                            'queijo',
                            2
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            94,
                            'presunto',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            8566,
                            53,
                            'presunto',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            2354,
                            62,
                            'presunto',
                            4
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            2354,
                            34,
                            'queijo',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            62,
                            'presunto',
                            2
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            72,
                            'queijo',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            53,
                            'queijo',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5477,
                            71,
                            'presunto',
                            1
                    );

-- Table Compra

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            3847,
                            75,
                            '2021-12-05',
                            2,
                            6,
                            0.2
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            2356,
                            32,
                            '2021-11-24',
                            1,
                            50,
                            0.7
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            2354,
                            53,
                            '2021-08-20',
                            3,
                            19.5,
                            0.1
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            5477,
                            71,
                            '2020-10-02',
                            1,
                            10,
                            0.1
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            6578,
                            77,
                            '2020-12-19',
                            2,
                            11.3,
                            0.56
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            7657,
                            32,
                            '2021-01-25',
                            2,
                            100,
                            0.09
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            8566,
                            77,
                            '2021-01-23',
                            3,
                            16.95,
                            0.4
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            2354,
                            94,
                            '2021-07-10',
                            2,
                            13.3,
                            0.32
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            5477,
                            32,
                            '2021-09-27',
                            1,
                            50,
                            0.21
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            2356,
                            77,
                            '2021-04-03',
                            2,
                            11.3,
                            0.3
                    );

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            6578,
                            78,
                            '2021-12-09',
                            1,
                            5.5,
                            0.9
                    );

COMMIT TRANSACTION;

-- Inner Join / Join for default

SELECT sName, GPA 
FROM Student JOIN Apply ON Student.sID = Apply.sID 
WHERE HS < 1000 AND major = 'CS' AND cNAME = 'Stanford';

SELECT DISTINCT nName, major
FROM Student JOIN Apply USING (sID)           -- Desde que se selecione um atributo em comum nas duas tabelas

-- Natural Join

SELECT DISTINCT sName, major                  -- Desde que tenham um atributo em comum, para fazer a devida junção
FROM Student NATURAL JOIN Apply;

-- Left outer join / left join

SELECT sName, sID, cName, major                      -- Todos os estudantes são ligados aos applies, e se não houver 
FROM Student LEFT OUTER JOIN Apply using (sID)       -- ligação, cName e major ficam NULL

-- Right outer join / right join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes, e se não houver 
FROM Student RIGHT OUTER JOIN Apply using (sID)      -- ligação, sName e sID ficam NULL

-- Full outer join / full join

SELECT sName, sID, cName, major                      -- Todos os applies são ligados aos estudantes e todos os estudantes, e se não houver 
FROM Student FULL OUTER JOIN Apply using (sID)       -- ligados aos applies, se não houver ligação ligação, ficam a NULL

SELECT min(GPA)
FROM Student
WHERE Student.sID = Apply.sID AND major = 'CS';

SELECT max(abs(maximum - minimum)) as difference
FROM (
    SELECT cName, major, min(GPA) as minimum, max(GPA) as maximum
    FROM Student, Apply
    WHERE Student.id = Apply.id
    GROUP BY cName, major
);

SELECT cName
FROM Apply
GROUP BY cName
HAVING count(DISTINCT sID) < 5; -- excluem valores nulos

INSERT INTO Student (name, college) VALUES ('Fabio', 'FEUP');

INSERT INTO Apply
SELECT sID, 'FEUP', 'Eng. Informática', NULL
FROM Student
WHERE sID NOT IN (
    SELECT sID
    FROM Apply
);

DELETE FROM Student
WHERE Student.id IN (
    SELECT sID 
    FROM Apply
    GROUP BY sID
    HAVING count(DISTINCT major) > 2
);

UPDATE Apply
SET desision = 'Y', major = 'Eng. Informática'
WHERE cName = 'FEUP' AND sID in (
    SELECT sID
    FROM Student
    WHERE GPA < 3.6
);

UPDATE Student
SET GPA = (SELECT max(GPA) FROM Student), 
    sizeHS = (SELECT min(sizeHS) FROM Student);

CREATE TRIGGER example
AFTER UPDATE OF cName ON college
FOR EACH ROW
BEGIN
    UPDATE Apply
    SET cName = NEW.cName
    WHERE cName = OLD.cName;
END;

INSERT INTO CSEE VALUES (111, 'Berkeley', 'CS');

CREATE TRIGGER CSEEinsert
INSTEAD OF INSERT ON CSEE
FOR EACH ROW
BEGIN
    INSERT INTO Apply
    VALUES (NEW.sID, NEW.cName, NEW.major, NULL);
END;

CREATE INDEX courseIDX on Exam(course_code); --> cria um index, para melhorar a performance caso
                                             --> o atributo de course_code for muito usado no sistema

-- Notes:
-- Index baseado em igualdade -> usa HashTables
-- Index baseado em comparações -> usa B-Trees

-- Solutions of Code Runner (Moodle)

SELECT nr FROM Student ASC;

SELECT code, name FROM Course WHERE department = 'AC' ORDER BY code ASC;

SELECT DISTINCT Student.name FROM Student, Prof WHERE Student.name = Prof.name ORDER BY Student.name ASC;

SELECT DISTINCT Student.name FROM Student, Prof WHERE Student.name = Prof.name ORDER BY Student.name ASC;

SELECT Student.name FROM Student
UNION
SELECT Prof.name FROM Prof
ORDER BY name ASC;

SELECT Student.name FROM Student WHERE Student.nr IN (
    SELECT DISTINCT Exam.student_nr FROM Exam WHERE Exam.course_code = 'TS1'
)
ORDER BY name ASC;

SELECT Student.name FROM Student WHERE Student.nr IN (
    SELECT DISTINCT Exam.student_nr FROM Exam WHERE Exam.course_code IN (
        SELECT DISTINCT Course.code FROM Course WHERE Course.department = 'IS'
    )
)
ORDER BY name ASC;

--SELECT DISTINCT Student.name FROM Student WHERE Student.nr in (
--    SELECT DISTINCT Exam.student_nr FROM Exam WHERE Exam.grade >= 10 AND Exam.course_code IN (
--        SELECT Course.code FROM Course WHERE Course.program = 'IS'
--    )
--) ORDER BY Student.name ASC;

SELECT name FROM Student WHERE NOT EXISTS (
    SELECT * FROM Course WHERE program = 'IS' AND NOT EXISTS (
        SELECT * FROM Exam WHERE student_nr = nr AND course_code = code AND grade >= 10
    )    
) ORDER BY name ASC;

SELECT max(grade)
FROM Exam;

SELECT round(avg(grade), 2)
FROM Exam
WHERE course_code = 'BD';

SELECT count(*) as num_students
FROM Student;

SELECT program, count(*) as num_courses
FROM Course
GROUP BY program
ORDER BY program ASC;

SELECT student_nr, count(*) as num_exams
FROM Exam
GROUP BY student_nr;

SELECT round(avg(num_exams), 2) as avg_num_exams FROM (

    SELECT DISTINCT student_nr, count(*) as num_exams
    FROM Exam
    GROUP BY student_nr
);

