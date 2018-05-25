.mode columns
.headers on
.nullvalue NULL

-- Utilzadores que partiram da Zona 9 num intervalo de datas

select
  utilizador
from
  localparagem
join
  viagem
where
  localparagem.viagem = viagem.id
and
  zona = "9"
and
  julianday(data) < (julianday('2018-02-02') + julianday('2000-01-08') - julianday('2000-01-01'));
