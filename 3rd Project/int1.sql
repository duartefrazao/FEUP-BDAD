.mode columns
.headers on
.nullvalue NULL

-- Quais as próximas viagens do condutor x na proxima semana para a feup
-- Para selecionar a data, alterar a data exemplo ('2018-02-02')

SELECT
  nome,data,hora_começo,lugares_disponiveis,preco_total,para_feup
FROM
  viagem natural join partilha natural join condutor natural join utilizador
where
  condutor=numero_up and Partilha.id=partilha_associada and nome="Darwin"
and
  julianday(data) < (julianday('2018-02-02') + julianday('2000-01-08') - julianday('2000-01-01'))
and 
  julianday(data)>julianday('2018-02-02')
and 
  para_feup='true';
