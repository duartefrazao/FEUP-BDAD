.mode columns
.headers on
.nullvalue NULL

create view hadFive as 
select utilizador from Avaliacao where avaliacao_passageiro = 5;

select numero_up from Utilizador where numero_up not in(select * from hadFive);

