.mode columns
.headers on
.nullvalue NULL

SELECT acompanhamento, max(quantidade) as Total
FROM (
    SELECT acompanhamento, count(*) as quantidade FROM Prova GROUP BY acompanhamento
    EXCEPT
    SELECT acompanhamento, count(*) as quantidade FROM Prova WHERE acompanhamento IS NULL
);