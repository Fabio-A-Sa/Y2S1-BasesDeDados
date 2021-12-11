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
                            'Bião',
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

COMMIT TRANSACTION;