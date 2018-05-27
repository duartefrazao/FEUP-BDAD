-- Viagens para o dia x num certo intervalo de horas que passam no sítio que quero

select*

from viagem

where data="2017-11-23" and id in(select id
					from partilha
					where hora_começo > '10:20 AM' AND hora_começo < '3:32 PM')
			and id in(select viagem
					from LocalidadesPossiveis
					where zona = "1")
