.mode columns
.headers on
.nullvalue NULL


--Condutores com 5 a todas as viagens

select nome,pontuaçao_condutor from condutor natural join utilizador where nome = "Trever";

