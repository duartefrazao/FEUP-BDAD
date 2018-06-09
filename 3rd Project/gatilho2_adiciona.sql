.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

--  Quando uma pessoa se associa a uma viagem incrementa o número de lugares ocupados

CREATE TRIGGER AssociarViagem
BEFORE INSERT ON LocalParagem
FOR EACH ROW
WHEN ((select lugares_ocupados from viagem) <> (select lugares_disponiveis from partilha) and
(select partilha_associada from viagem) = (select id from partilha))
  BEGIN
    UPDATE Viagem
    SET lugares_ocupados = lugares_ocupados + 1
    WHERE id = new.viagem;
  END;

-- Quando uma pessoa se desassocia a uma viagem decrementa o número de lugares ocupados
CREATE TRIGGER DesassociarViagem
AFTER DELETE ON LocalParagem
FOR EACH ROW
WHEN ((select partilha_associada from viagem) = (select id from partilha))
  BEGIN
    UPDATE Viagem
    SET lugares_ocupados = lugares_ocupados - 1
    WHERE id = old.viagem;
  END;
