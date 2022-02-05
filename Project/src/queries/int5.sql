.mode columns
.headers on
.nullvalue NULL

SELECT SalarioGerente, SalarioNaoGerente, SalarioGerente - SalarioNaoGerente AS Diferença
FROM (select avg(salario) as SalarioGerente from Gerente), (select avg(salario) as SalarioNaoGerente from NaoGerente);