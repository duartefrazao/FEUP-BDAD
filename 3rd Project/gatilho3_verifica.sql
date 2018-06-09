.mode columns
.header on
.nullvalue NULL

PRAGMA foreign_keys = ON;

.print ''
.print '<<<Estado atual da viagem de id 1, em que não se encontra cheia:>>>'
.print ''

select * from viagem where id = 1;

.read gatilho2_adiciona.sql

.print ''
.print '<<<Apos inserir utilizador que é o condutor>>>'
.print ''

INSERT INTO LocalParagem (utilizador, viagem, morada, coordenadas_GPS, zona) VALUES (201614806, 1, 'Porto', '13.220554', 2);

 select * from viagem where id = 1;

.read gatilho2_remove.sql
