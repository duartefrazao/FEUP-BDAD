.mode columns
.headers on
.nullvalue NULL

-- Qual é a diferença entre a partilha mais cara e mais barata a partir da mesma zona com destino FEUP

CREATE view expensivesharing
AS
  SELECT preco_total
  FROM   partilha
  ORDER  BY preco_total DESC
  LIMIT  1;

CREATE view cheapesharing
AS
  SELECT preco_total
  FROM   partilha
  ORDER  BY preco_total ASC
  LIMIT  1;

SELECT expensivesharing.preco_total - cheapesharing.preco_total
FROM   expensivesharing,
       cheapesharing;

DROP view IF EXISTS expensivesharing; 
DROP view IF EXISTS cheapesharing;
