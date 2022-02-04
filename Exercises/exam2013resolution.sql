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