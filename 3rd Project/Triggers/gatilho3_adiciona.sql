.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Impede que um utilizador se associe a uma viagem em que ele próprio é o condutor
CREATE TRIGGER ImpedirAssociar
BEFORE INSERT ON LocalParagem
BEGIN
    SELECT RAISE(abort,'Utilizador é o condutor! Impossível associar')
    where exists(
    select * from Viagem join Partilha 
        where new.viagem=Viagem.id AND
        Viagem.partilha_associada = Partilha.id AND
        Partilha.condutor = new.utilizador
);

END;
