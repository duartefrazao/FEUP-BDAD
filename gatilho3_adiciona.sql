.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

-- Impede que um utilizador se associe a uma viagem em que ele próprio é o condutor

CREATE TRIGGER ImpedirAssociar

BEFORE INSERT ON LocalParagem
FOR EACH ROW
WHEN ( new.utilizador = (select condutor from (select partilha_associada from viagem where new.viagem = viagem.id)))
BEGIN
SELECT RAISE(rollback, '<<<Utilizador é o condutor! Impossível associar>>>');
END;
