.mode columns
.headers on
.nullvalue NULL

SELECT DISTINCT tipo, regiao, anoProducao
FROM Vinho
WHERE (
    regiao LIKE 'Douro' OR
    regiao LIKE 'Baião' OR
    regiao LIKE 'Minho'
)
ORDER BY regiao ASC;