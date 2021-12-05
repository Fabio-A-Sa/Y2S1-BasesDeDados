PRAGMA foreign_keys = on;
BEGIN TRANSACTION;

INSERT INTO Pessoa (
                       idPessoa,
                       nome,
                       dataNascimento,
                       morada,
                       telefone,
                       idade,
                       nif 
                   )
                   VALUES (
                       1,
                       'João Félix',
                       '2002-01-25',
                       'Porto, Rua Gulbenkian 88',
                       969783121,
                       19,
                       250146359
                   );

INSERT INTO Pessoa (
                       idPessoa,
                       nome,
                       dataNascimento,
                       morada,
                       telefone,
                       idade,
                       nif 
                   )
                   VALUES (
                       2,
                       'Carolina Brandão',
                       '2001-11-24',
                       'Evora, Rua do Carmo 89',
                       948596518,
                       20,
                       789145236
                   );

INSERT INTO Pessoa (
                       idPessoa,
                       nome,
                       dataNascimento,
                       morada,
                       telefone,
                       idade,
                       nif 
                   )
                   VALUES (
                       3,
                       'Fábio Sá',
                       '2002-07-10',
                       'Viana do Castelo, Praca do Outeiro 11',
                       912152214,
                       19,
                       456123789
                   );

INSERT INTO Cartao (
                        idCartao,
                        numero,
                        saldo,
                        dataAdesao
                        )
                        VALUES (
                            9,
                            44,
                            15,
                            '2015-10-25'
                    );
                   
INSERT INTO Cliente (
                        idPessoa,
                        idCartao,
                        maiorIdade
                    )
                    VALUES (
                        1,
                        9,
                        0
                    );

INSERT INTO Funcionario (
                            idPessoa,
                            salario
                        )
                        VALUES (
                            2,
                            712.9
                        );
                        
INSERT INTO Funcionario (
                            idPessoa,
                            salario
                        )
                        VALUES (
                            3,
                            900
                        );    

INSERT INTO NaoGerente (
                        idFuncionario,
                        funcao
                        )
                        VALUES (
                            2,
                            'armazem'
                            );

INSERT INTO Gerente (
                        idFuncionario,
                        anosServico
                     )
                     VALUES (
                        3,
                        5
                        );                                                          

INSERT INTO Produto (
                        idProduto,
                        preco
                    )
                    VALUES (
                        4,
                        10
                     );
                     
INSERT INTO Produto (
                        idProduto,
                        preco
                    )
                    VALUES (
                        5,
                        100
                     );
                                     
INSERT INTO Vinho ( 
                        idProduto,
                        tipo,
                        regiao,
                        anoProducao,
                        teorAlcool,
                        capacidadeGarrafa     
                        )
                        VALUES (     
                            4,
                            'Branco',
                            'Douro',
                            2000,
                            12.5,
                            0.7
                            );

INSERT INTO Utensilio (
                        idProduto,
                        nome
                        )
                        VALUES (
                            5,
                            'Decantador'
                            );
                                 
INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                    )
                    VALUES (
                        6,
                        'SEGUNDA-FEIRA',
                        '09:00',
                        '17:00'
                    );

INSERT INTO Horario (
                        idHorario,
                        diaSemana,
                        horaInicio,
                        horaFinal
                    )
                    VALUES (
                        7,
                        'TERCA-FEIRA',
                        '10:30',
                        '13:15'
                    );                    

INSERT INTO Armazem (
                        idArmazem,
                        telefone,
                        local
                    )
                    VALUES (
                        8,
                        785412632,
                        'Rua das Travessas, Porto'
                        );

INSERT INTO Stock (
                      idArmazem,
                      idProduto,
                      quantidade
                  )
                  VALUES (
                      8,
                      4,
                      25
                  );

INSERT INTO Stock (
                      idArmazem,
                      idProduto,
                      quantidade
                  )
                  VALUES (
                      8,
                      5,
                      1
                  );

INSERT INTO HorarioFuncionario (
                            idFuncionario,
                            idHorario
                        )
                        VALUES (
                            2,
                            6
                        );
                        
INSERT INTO HorarioFuncionario (
                            idFuncionario,
                            idHorario
                        )
                        VALUES (
                            3,
                            7
                        );

INSERT INTO Prova (
                        idCliente,
                        idVinho,
                        acompanhamento,
                        quantidade
                        )
                        VALUES (
                            1,
                            4,
                            'queijo',
                            2
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
                            1,
                            4,
                            '2021-12-05',
                            2,
                            200,
                            0
                            );
                            
COMMIT TRANSACTION;