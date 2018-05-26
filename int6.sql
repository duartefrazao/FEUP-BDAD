.mode columns
.headers on
.nullvalue NULL

-- Qual o condutor, que também é utilizador, com maior descrepância de pontuações

SELECT nome,
       Max(Abs(avaliaçao_condutor - avaliçao_passageiro))
       "Maior diferença de avaliação"
FROM   avaliaçao,
       condutor,
       utilizador
WHERE  avaliaçao.utilizador = utilizador.numero_up
       AND utilizador.numero_up = condutor.numero_up;
