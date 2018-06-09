.mode columns
.headers on
.nullvalue NULL

--Qual o condutor com o qual já fiz mais viagens?

SELECT condutor,utilizador,
       Max(n) "Vezes com que utilizador viajou"
FROM   (SELECT condutor,utilizador,
               Count(*) n
        FROM   (SELECT partilha.id,utilizador,
                       condutor
                FROM   partilha,
                       viagem,
		       localParagem
                WHERE  localParagem.viagem = viagem.id
                       AND partilha_associada = partilha.id
		       AND utilizador = "201620178")
        GROUP  BY condutor);
