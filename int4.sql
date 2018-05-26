.mode columns
.headers on
.nullvalue NULL

-- Quais os três condutores com melhor pontuação

SELECT *
FROM   condutor m
WHERE  3 = (SELECT Count(DISTINCT pontuacao_condutor)
            FROM   condutor
            WHERE  pontuacao_condutor < m.pontuacao_condutor)
        OR 4 = (SELECT Count(DISTINCT pontuacao_condutor)
                FROM   condutor
                WHERE  pontuacao_condutor < m.pontuacao_condutor)
ORDER  BY pontuacao_condutor; 
