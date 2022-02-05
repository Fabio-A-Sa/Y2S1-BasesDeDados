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
                            '2020-10-25'
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
                            '2020-05-28'
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

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
)
                        VALUES (
                                2,
                                5,
                                200,
                                '2020-10-05'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                                5,
                                9,
                                100,
                                '2020-02-05'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                                6,
                                2,
                                15,
                                '2020-01-25'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                                8,
                                66,
                                88,
                                '2020-11-25'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                                1,
                                44,
                                5,
                                '2020-04-14'
                    );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                                4,
                                99,
                                25,
                                '2020-08-14'
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
                                4578,
                                'António Gomes',
                                '2002-03-10',
                                'Espinho, Rua 25 478',
                                978945697,
                                19,
                                278949638,
                                1,
                                2
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
                                5537,
                                'Joaquim da Silva',
                                '1972-02-23',
                                'Mazarefes, Rua do Torto, 18',
                                918208492,
                                49,
                                292737273,
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
                                3485,
                                'Pedro Teixeira',
                                '2004-01-25',
                                'Sintra, Rua das Camélias 100',
                                 935424561,
                                 17,
                                 258556748,
                                 0,
                                 5
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
                                1765,
                                'Ana Rio',
                                '1999-01-25',
                                'Sintra, Rua das Amoreiras 78',
                                974104561,
                                23,
                                175956748,
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
                                7164,
                                'André Almeida',
                                '2000-03-03',
                                'Braga, Rua 78',
                                974174101,
                                22,
                                175321648,
                                1,
                                6
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
                                   1245,
                                   'André Teixeira',
                                   '2002-03-03',
                                   'Braga, Rua 77',
                                   912574101,
                                   19,
                                   156321648,
                                   1,
                                   8
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
                                1234,
                                'Cristiano Ronaldo',
                                '1985-02-05',
                                'Londres, Rua Red 07',
                                912545631,
                                36,
                                188321648,
                                1,
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
                                1678,
                                'Cristiano Ronaldo',
                                '2004-02-05',
                                'Setúbal, Rua Martins 17',
                                912566631,
                                17,
                                188399648,
                                0,
                                4
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
                                    1635,
                                    'Rita Pereira',
                                    '2002-05-22',
                                    'Estremoz, Rua Santa Catarina 129',
                                    919754108,
                                    19,
                                    256652768,
                                    701,
                                    "armazem"
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
                                    1986,
                                    'Ricardo Alvarenga',
                                    '2000-08-29',
                                    'Arcozelo, Rua 129',
                                    999661078,
                                    21,
                                    256993368,
                                    725,
                                    "armazem"
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
                                    7852,
                                    'Tomás Almeida',
                                    '2000-02-15',
                                    'Miramar, Rua do Almirante 09',
                                    912361078,
                                    19,
                                    145693368,
                                    722,
                                    "armazem"
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
                                    4935,
                                    'Inês Almeida',
                                    '1998-02-01',
                                    'Miramar, Rua da Prelada 88',
                                    912666678,
                                    23,
                                    145120168,
                                    720,
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
                                    5869,
                                    'Gustavo Lima',
                                    '1998-09-21',
                                    'Miramar, Rua do Senhor da Pedra 10',
                                    914567678,
                                    23,
                                    141398168,
                                    723,
                                    "limpeza"
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
                            1857,
                            'Abílio da Silva',
                            '1962-09-16',
                            'Esposende, Rua da Farofa, 56',
                            934128337,
                            59,
                            241892003,
                            1381, 
                            11
                    );

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
                            1555,
                            'Pinhão da Cunha',
                            '2002-12-25',
                            'Lisboa, Rua da Roleta Russa, 42',
                            934190064,
                            19,
                            2349127347,
                            1024, 
                            5
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
                            'Riba Tejo',
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
                            44,
                            8,
                            'Maduro Branco',
                            'Riba Tejo',
                            2019,
                            14,
                            5
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
                            55,
                            8, 
                            'Maduro Tinto',
                            'Alentejo',
                            2020,
                            12.5,
                            5
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
                            78,
                            10,
                            'Maduro Tinto',
                            'Douro',
                            2017,
                            13,
                            5
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
                            91,
                            10,
                            'Verde Tinto',
                            'Baião',
                            2009,
                            13,
                            5
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
                            70,
                            12,
                            'Verde Branco',
                            'Minho',
                            2021,
                            12.5,
                            5
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
                            88,
                            12.5,
                            'Verde Branco',
                            'Minho',
                            2020,
                            12.5,
                            5
                    );

-- Table Utensilio

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                32,
                                50,
                                'Decantador'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                75,
                                2,
                                'Saca-rolhas'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                78,
                                5.5,
                                'Bomba de vácuo'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                20,
                                8,
                                'Marcadores de copos'
                        );

INSERT INTO Utensilio (
                            idProduto,
                            preco,
                            nome
                            )
                            VALUES (
                                35,
                                5,
                                'Vertedor flexível anti-gota'
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

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            77885,
                            'SEGUNDA-FEIRA',
                            '15:00',
                            '21:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            55449,
                            'SABADO',
                            '11:00',
                            '18:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            44662,
                            'DOMINGO',
                            '9:00',
                            '19:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            24461,
                            'TERCA-FEIRA',
                            '8:00',
                            '15:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            22001,
                            'QUINTA-FEIRA',
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
                            22445,
                            'SEXTA-FEIRA',
                            '10:00',
                            '14:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            11101,
                            'DOMINGO',
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
                            75610,
                            'DOMINGO',
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
                            25635,
                            'SEXTA-FEIRA',
                            '9:00',
                            '21:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            44887,
                            'SEXTA-FEIRA',
                            '15:00',
                            '19:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            65245,
                            'SEXTA-FEIRA',
                            '9:00',
                            '12:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            24570,
                            'SEGUNDA-FEIRA',
                            '8:00',
                            '10:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            11542,
                            'TERCA-FEIRA',
                            '9:00',
                            '10:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            11022,
                            'QUARTA-FEIRA',
                            '8:00',
                            '12:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            22025,
                            'QUARTA-FEIRA',
                            '8:00',
                            '19:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            32554,
                            'SEXTA-FEIRA',
                            '9:00',
                            '17:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            24582,
                            'QUINTA-FEIRA',
                            '15:00',
                            '21:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            10024,
                            'SABADO',
                            '20:00',
                            '21:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            24111,
                            'SABADO',
                            '19:00',
                            '20:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            10072,
                            'DOMINGO',
                            '8:00',
                            '15:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                        )
                        VALUES (
                            25012,
                            'DOMINGO',
                            '19:00',
                            '21:00'
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
                            200
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
                            10
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

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                375,
                                44,
                                6
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                375,
                                70,
                                3
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                375,
                                32,
                                10
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                134,
                                55,
                                2
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                134,
                                88,
                                8
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                134,
                                35,
                                3
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                134,
                                77,
                                5
                               );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                134,
                                44,
                                6
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                832,
                                55,
                                5
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                832,
                                20,
                                1
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                832,
                                78,
                                4
                    );

INSERT INTO Stock (
                        idArmazem,
                        idProduto,
                        quantidade
                        )
                        VALUES (
                                832,
                                91,
                                9
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

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1635,
                                        77885
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1635,	
                                        55449
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1635,
                                        44662
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1986,
                                        24461
					            );  

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1986,
                                        22001
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1986,
                                        22445
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7852,
                                        11101
					            );
                                
INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7852,
                                        75610
					            ); 

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        7852,
                                        25635
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        4935,
                                        44887
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        4935,
                                        65245
					            );
                                
INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        4935,
                                        24570
					            ); 

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        5869,
                                        11542
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        5869,
                                        11022
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        5869,
                                        22025
					            );
                                
INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1857,
                                        32554
					            ); 

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1857,
                                        24582
					            );

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1857,
                                        10024
					            );
                                
INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1555,
                                        24111
					            ); 

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1555,
                                        10072
					            );                                 

INSERT INTO HorarioFuncionario (
                                    idPessoa,
                                    idHorario
                                    )
                                    VALUES (
                                        1555,
                                        25012
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

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            5537,
                            44,
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
                            5537,
                            55,
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
                            5537,
                            78,
                            'tostas com queijo',
                            1
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            4578,
                            91,
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
                            1765,
                            70,
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
                            3485,
                            44,
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
                            3485,
                            55,
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
                            3485,
                            78,
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
                            3485,
                            91,
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
                            7164,
                            70,
                            'presunto',
                            3
                    );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            1245,
                            88,
                            'queijo',
                            3
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

INSERT INTO Compra (
                        idCliente,
                        idProduto,
                        data,
                        quantidade,
                        preco,
                        desconto
                        )
                        VALUES (
                            5537,
                            71,
                            '2021-11-09',
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
                            5537,
                            77,
                            '2022-01-09',
                            2,
                            11.3,
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
                            4578,
                            62,
                            '2021-11-09',
                            1,
                            9,
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
                            1765,
                            72,
                            '2022-12-30',
                            1,
                            34,
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
                            1765,
                            78,
                            '2022-01-05',
                            1,
                            5.5,
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
                            1765,
                            44,
                            '2021-12-30',
                            2,
                            16,
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
                            3485,
                            55,
                            '2021-12-29',
                            1,
                            8,
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
                            7164,
                            78,
                            '2021-12-29',
                            1,
                            5.50,
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
                            1245,
                            32,
                            '2021-12-27',
                            1,
                            50,
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
                            1245,
                            75,
                            '2021-12-27',
                            1,
                            3,
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
                            1234,
                            78,
                            '2021-12-28',
                            1,
                            5.5,
                            0.6
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
                            1234,
                            91,
                            '2021-12-28',
                            2,
                            20,
                            0.6
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
                            1234,
                            35,
                            '2021-12-28',
                            2,
                            10,
                            0.6
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
                            1678,
                            32,
                            '2021-12-23',
                            1,
                            50,
                            0.3
                    );

COMMIT TRANSACTION;