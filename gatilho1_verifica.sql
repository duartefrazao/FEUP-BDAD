.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print '<<<Estado atual das pontuações dos condutores da avaliacao:>>>'
.print ''

select numero_up,pontuacao_condutor
from Condutor
    join Partilha
    join Viagem
    join Avaliacao
where
    Condutor.numero_up=Partilha.condutor and
    Partilha.id=Viagem.partilha_associada AND
    Avaliacao.viagem=Viagem.id AND
    Avaliacao.utilizador=201721469 AND
    Avaliacao.viagem=4;

select numero_up, pontuacao_condutor from Condutor where numero_up=201781701;
Select numero_up, pontuacao_passageiro from utilizador where numero_up=201721469;

.print ''
.print '<<<Apos inserir avaliação>>>'
.print ''
INSERT INTO Avaliacao (utilizador, viagem, avaliacao_condutor, avaliacao_passageiro) VALUES (201721469, 4, 5, 3.9);
--select numero_up, pontuacao_condutor from Condutor where numero_up=201781701;

select numero_up, pontuacao_condutor from Condutor where numero_up=201781701;
Select numero_up, pontuacao_passageiro from utilizador where numero_up=201721469;
