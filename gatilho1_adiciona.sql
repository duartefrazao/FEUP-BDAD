.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--  Atualizar as pontuações

DROP TRIGGER IF EXISTS AtualizaPontuacoes;

CREATE TRIGGER AtualizaPontuacoes
BEFORE INSERT ON Avaliacao
BEGIN
    UPDATE Utilizador 
        SET pontuacao_passageiro = (new.avaliacao_passageiro +   (select count(*) + 1 from Avaliacao where new.utilizador=Avaliacao.utilizador)*(select pontuacao_passageiro from Utilizador where new.utilizador = numero_up ))/( select count(*)+ 2 from Avaliacao where new.utilizador=Avaliacao.utilizador)
        WHERE new.utilizador=Utilizador.numero_up;
END;

Select * from utilizador where numero_up=201721469;
INSERT INTO Avaliacao (utilizador, viagem, avaliacao_condutor, avaliacao_passageiro) VALUES (201721469, 4, 4, 3.9);
Select * from utilizador where numero_up=201721469;
INSERT INTO Avaliacao (utilizador, viagem, avaliacao_condutor, avaliacao_passageiro) VALUES (201721469, 2, 4, 5);
Select * from utilizador where numero_up=201721469;
