.mode columns
.headers on
.nullvalue NULL

-- Pares de viagens diários que me levam e trazem para a FEUP num certo intervalo de horas?

select*

from viagem

where id in(select id
		from partilha
		where hora_começo > '10:20 AM' AND hora_começo < '3:32 PM')
