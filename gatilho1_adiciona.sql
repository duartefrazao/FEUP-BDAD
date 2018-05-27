.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--  Atualizar as pontuações

--DROP TRIGGER IF EXISTS AtualizaPontuacoes;

CREATE TRIGGER AtualizaPontuacoes
BEFORE INSERT ON Avaliacao
BEGIN
    UPDATE Utilizador 
        SET pontuacao_passageiro =
            (new.avaliacao_passageiro +
            (select count(*) + 1 from Avaliacao where new.utilizador=Avaliacao.utilizador)*
            (select pontuacao_passageiro from Utilizador where new.utilizador = numero_up ))/
            (select count(*)+ 2 from Avaliacao where new.utilizador=Avaliacao.utilizador)
        WHERE new.utilizador=Utilizador.numero_up;
    UPDATE CONDUTOR
        SET pontuacao_condutor= 
            (new.avaliacao_condutor +
            (select count(*)+1 from Avaliacao join Viagem join Partilha 
                where Partilha.condutor=numero_up AND
                Partilha.id = Viagem.partilha_associada AND
                Viagem.id=Avaliacao.Viagem)*
            (select pontuacao_condutor))/
            (select count(*)+2 from Avaliacao join Viagem join Partilha 
                where Partilha.condutor=numero_up AND
                Partilha.id = Viagem.partilha_associada AND
                Viagem.id=Avaliacao.Viagem)
        WHERE 
            Condutor.numero_up =   
            (select numero_up 
            from Viagem join Partilha join Condutor
            where 
                Viagem.id=new.viagem AND
                Viagem.partilha_associada=Partilha.id AND
                Partilha.condutor= Condutor.numero_up
            );

        
END;

--Select * from utilizador where numero_up=201721469;


--select numero_up, pontuacao_condutor from Condutor where numero_up=201781701;
--INSERT INTO Avaliacao (utilizador, viagem, avaliacao_condutor, avaliacao_passageiro) VALUES (201721469, 4, 5, 3.9);
--select numero_up, pontuacao_condutor from Condutor where numero_up=201781701;

--Select * from utilizador where numero_up=201721469;
--INSERT INTO Avaliacao (utilizador, viagem, avaliacao_condutor, avaliacao_passageiro) VALUES (201721469, 2, 4, 5);
--Select * from utilizador where numero_up=201721469;
