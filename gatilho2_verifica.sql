.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print '<<<Estado atual de Viagem>>>'
.print ''

SELECT id , lugares_ocupados
FROM viagem
WHERE id = 1;

.print ''
.print '<<<Apos criacao de LocalParagem -> dispara gatilho que incrementa o número de lugares ocupados de Viagem>>>'
.print ''

INSERT INTO LocalParagem (utilizador, viagem, morada, coordenadas_GPS, zona) VALUES (201620671, 1, 'Porto', '13.220554', 2);

SELECT id , lugares_ocupados
FROM viagem
WHERE id = 1;

.print ''
.print '<<<Apos remocao de LocalParagem -> dispara gatilho que decrementa o número de lugares ocupados de Viagem>>>'
.print ''

DELETE FROM LocalParagem WHERE viagem = 1 AND utilizador = 201620671;

SELECT id , lugares_ocupados
FROM viagem
WHERE id = 1;
