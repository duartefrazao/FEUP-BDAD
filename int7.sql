.mode columns
.headers on
.nullvalue NULL

-- Utilizadores que nunca tiveram uma avaliação 5

select
  distinct utilizador
from
  avaliacao
group by avaliacao_condutor, avaliacao_passageiro
having Max(avaliacao_condutor) < 5 AND Max(avaliacao_passageiro) < 5
