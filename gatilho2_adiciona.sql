.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--  Quando uma pessoa se associa a uma viagem incrementa o número de lugares ocupados

CREATE TRIGGER AssociarViagem
BEFORE INSERT ON LocalParagem
FOR EACH ROW
  BEGIN
    UPDATE Viagem
    SET lugares_ocupados = lugares_ocupados + 1
    WHERE lugares_ocupados <> (select lugares_disponiveis from Partilha);
  END;

-- Quando uma pessoa se desassocia a uma viagem decrementa o número de lugares ocupados
CREATE TRIGGER DesassociarViagem
AFTER DELETE ON LocalParagem
FOR EACH ROW
  BEGIN
    UPDATE Viagem
    SET lugares_ocupados = lugares_ocupados - 1;
  END;
