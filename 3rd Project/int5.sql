.mode columns
.headers on
.nullvalue NULL

-- Qual é o condutor que leva mais vezes o carro cheio?

SELECT condutor.*,
       Max(n) "Vezes que levou o carro cheio"
FROM   (SELECT condutor,
               Count(*) n
        FROM   (SELECT partilha.id,
                       condutor
                FROM   partilha,
                       viagem
                WHERE  lugares_ocupados = lugares_disponiveis
                       AND partilha_associada = partilha.id)
        GROUP  BY condutor),
       condutor; 
