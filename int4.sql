.mode columns
.headers on
.nullvalue NULL

-- Quais os três condutores com melhor pontuação

SELECT
 nome,
 pontuaçao_condutor
FROM
 condutores
ORDER BY
 pontuaçao_condutor
LIMIT 3;
