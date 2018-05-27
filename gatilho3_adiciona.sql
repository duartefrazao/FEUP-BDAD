.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Impede que um utilizador se associe a uma viagem em que ele próprio é o condutor

CREATE TRIGGER ImpedirAssociar

BEFORE INSERT ON LocalParagem
FOR EACH ROW
WHEN ( new.utilizador = (select condutor from partilha where partilha.id = (select partilha_associada from viagem where viagem.id = 1)))
BEGIN
SELECT RAISE(abort, 'Utilizador é o condutor! Impossível associar');
END;
