----7
create view hadFive as 
select utilizador from Avaliacao where avaliacao_passageiro = 5;

select numero_up from Utilizador where numero_up not in(select * from hadFive);


---8
select Viagem.id as ViagemID, lugares_disponiveis
from Viagem join Zona join Partilha join LocalParagem
where zona.id=LocalParagem.zona and LocalParagem.viagem=Viagem.id and Viagem.partilha_associada = Partilha.id and data="2018-03-06" and Zona.nome = 'Amial' and hora_começo > '10:20 AM' AND hora_começo < '3:32 PM';