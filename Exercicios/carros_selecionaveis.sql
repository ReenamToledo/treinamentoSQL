SELECT COUNT(*) AS total_cliente FROM cliente;

SELECT cliente.nome, SUM(carro.valor) AS total_gasto FROM cliente JOIN aluguel ON cliente.codcliente = aluguel.codcliente 
JOIN carro ON aluguel.codcarro = carro.codcarro GROUP BY cliente.nome