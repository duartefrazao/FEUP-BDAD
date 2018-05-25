.mode columns
.headers on
.nullvalue NULL

-- Quais os 3 condutores que tiveram as partilhas mais baratas

select distinct
  numero_up,
  preço_total
from
  condutor
  join
  partilha
  where
  partilha.condutor=condutor.numero_up
  order by
  preço_total ASC
  limit 3;
