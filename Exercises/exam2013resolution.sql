-- 8.1

SELECT hostname, nome
FROM SERVIDOR INNER JOIN Pessoa
WHERE Servidor.idResponsavel = Pessoa.idPessoa AND vulneravel LIKE 'sim';

-- 8.2

SELECT hostname, Bug.descricao, Pessoa.nome
FROM Bug INNER JOIN Pessoa INNER JOIN AplicacaoServidor INNER JOIN Servidor INNER JOIN Aplicacao
WHERE   Servidor.idServidor = AplicacaoServidor.idServidor AND
        AplicacaoServidor.idAplicacao = Aplicacao.idAplicacao AND
        Bug.idAplicacao = Aplicacao.idAplicacao AND
        Servidor.idResponsavel = Pessoa.idPessoa AND
        Bug.vulnerabilidade LIKE 'sim'
ORDER BY hostname;

-- 8.3

SELECT hostname
FROM Servidor JOIN  Pessoa
WHERE hostname LIKE 'alu%' AND
	  mail LIKE 'joao.almeida@cica.pt' AND
	  Servidor.idResponsavel = Pessoa.idPessoa AND
	  EXISTS (
		  SELECT *
		  FROM Servidor, AplicacaoServidor, Bug
		  WHERE Servidor.idServidor = AplicacaoServidor.idServidor AND
			    AplicacaoServidor.idAplicacao = Bug.idAplicacao
	  );

-- 8.4

SELECT Aplicacao.nome
FROM Aplicacao, Bug
WHERE Aplicacao.idAplicacao = Bug.idAplicacao
GROUP BY Aplicacao.nome
ORDER BY count(*) DESC
LIMIT 1;

-- 8.5

CREATE TRIGGER Trigger1
AFTER INSERT ON AplicacaoServidor
WHEN
    EXISTS (
        SELECT *
        FROM Bug
        WHERE NEW.idAplicacao = Bug.idAplicacao AND vulnerabilidade LIKE 'sim'
    )
BEGIN
    UPDATE Servidor
    SET vulneravel = 'sim'
    WHERE NEW.idServidor = Servidor.idServidor;
END

-- 8.6

CREATE TRIGGER Trigger2
AFTER INSERT ON Bug
WHEN
    NEW.vulnerabilidade LIKE 'sim'
BEGIN
    UPDATE Servidor
    SET vulneravel = 'sim'
    WHERE Servidor.idServidor = (
        SELECT idServidor 
        FROM AplicacaoServidor
        WHERE NEW.idAplicacao = AplicacaoServidor.idAplicacao
    )
    UPDATE Bug
    SET prioridade = 1
    WHERE Bug.idBug = NEW.idBug;
END