.mode columns
.headers on
.nullvalue NULL
--Condutores que nunca obtiveram um pontuação abaixo de 5 e que já foram avaliados pelo menos uma vez

drop view if exists NotFive;

create view NotFive as
select condutor
from Partilha join Viagem join Avaliacao
WHERE avaliacao_condutor <5 and 
    Partilha.id=Viagem.partilha_associada AND
    Avaliacao.viagem=Viagem.id ;

create view Avaliados AS
select condutor 
from Partilha join Viagem join Avaliacao
WHERE Partilha.id=Viagem.partilha_associada AND
    Avaliacao.viagem=Viagem.id ;

select nome
from Condutor join Utilizador
where Condutor.numero_up not in(select * from NotFive) and Condutor.numero_up  in (select * from Avaliados) and Condutor.numero_up = Utilizador.numero_up;

