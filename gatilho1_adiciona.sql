create trigger trig1
after insert on Avaliaçao
for each row 
begin
update Utilizador set pontuaçao_condutor=(select distinct idCliente from Carro as car where new.idCarro=car.idCarro) where idReparacao=new.utilizador;
end;

--INSERT INTO Reparacao (dataInicio, dataFim, idCliente, idCarro)
--VALUES ('2010-09-15', '2010-09-16', NULL, 1);
