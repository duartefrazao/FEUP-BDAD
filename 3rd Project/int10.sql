.mode columns
.headers on
.nullvalue NULL

--Viagens que me levam ou trazem para a FEUP num certo intervalo de horas no dia x?

select * from viagem join partilha 
where viagem.partilha_associada = partilha.id and hora_começo > '10:10 AM' AND hora_começo < '3:32 PM' and para_feup='true' and data='2018-02-04';
