.mode columns
.headers on
.nullvalue NULL

--Viagens no dia x para a feup com lugares disponiveis ordenado pelo preço minimo

select viagem.id,nome,hora_começo 
	from (viagem join partilha) 
	join condutor 
	natural join utilizador 
where Partilha.id=partilha_associada and condutor=numero_up and lugares_disponiveis>0 and data="2018-01-09" and para_feup='true';

