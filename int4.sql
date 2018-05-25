.mode columns
.headers on
.nullvalue NULL

-- Quais os três condutores com melhor pontuação

SELECT
 numero_up,
 pontuaçao_condutor
FROM
 condutor
ORDER BY DESC
 pontuaçao_condutor
LIMIT 3;
