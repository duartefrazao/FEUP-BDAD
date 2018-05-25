.mode columns
.headers on
.nullvalue NULL


--Qual a pontuação do condutor

select nome,pontuaçao_condutor from condutor natural join utilizador where nome = "Trever";

