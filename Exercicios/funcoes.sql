/*COUNT, SUM, AVG, MIN E MAX*/
SELECT COUNT(*) AS total_cliente FROM cliente;

/*AVG: AVERAGE - MÉDIA*/
/*Média dos valores dos aluguéis dos carros*/
SELECT AVG(valor) AS media_valor_carros FROM carro;

/*MIN: MÍNIMO*/
/*Menor valor de aluguel de carros*/
SELECT MIN(valor) AS valor_minimo_carros FROM carro;

/*MAX: MÁXIMO*/
/*Maior valor de aluguel de carros*/
SELECT MAX(valor) AS valor_maximo_carros FROM carro;


