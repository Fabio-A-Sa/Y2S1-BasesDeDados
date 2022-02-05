.mode columns
.headers on
.nullvalue NULL

CREATE VIEW Funcionario AS
SELECT idPessoa, nome, dataNascimento, idade, salario, nif
FROM (
    SELECT * FROM Gerente 
    UNION 
    SELECT * FROM NaoGerente
);

SELECT nome, dataNascimento, idade, salario, nif, sum(CargaHoráriaDiária) AS CargaHoráriaSemanal
FROM (
    SELECT *, abs(horaFinal-horaInicio) AS CargaHoráriaDiária 
    FROM ( 
        Horario INNER JOIN HorarioFuncionario INNER JOIN Funcionario
        ON HorarioFuncionario.idHorario = Horario.idHorario AND HorarioFuncionario.idPessoa = Funcionario.idPessoa
    ) 
    GROUP BY nome, CargaHoráriaDiária
)
GROUP BY nome
ORDER BY nome ASC
LIMIT 5;

DROP VIEW Funcionario;