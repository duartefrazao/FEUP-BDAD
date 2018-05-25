.mode columns
.headers on
.nullvalue NULL

-- Qual é a diferença entre a partilha mais cara e mais barata a partir da mesma zona com destino FEUP

create view expensiveSharing as
SELECT
 preço_total
FROM
 partilha
ORDER BY
 preço_total DESC
LIMIT 1;

create view cheapeSharing as
SELECT
   preço_total
FROM
   partilha
ORDER BY
   preço_total ASC
LIMIT 1;

SELECT expensiveSharing.preço_total - cheapeSharing.preço_total from expensiveSharing, cheapeSharing;

drop view if exists expensiveSharing;
drop view if exists cheapeSharing;
