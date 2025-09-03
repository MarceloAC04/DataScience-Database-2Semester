USE db_carro;

-- Função - Realizar consultas e caso precise, realizar calculos
-- Calculo de desconto
DELIMITER $$

CREATE FUNCTION calcularDesconto(valor DECIMAL(10, 2), desconto DECIMAL(5,2))
RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
	RETURN valor - (valor * desconto / 100);
END $$

SELECT marca, modelo, valor, calcularDesconto(valor, 20) AS 'Valor com Desconto %' 
FROM tb_carro;

-- CALCULO DE VENDAS GERAIS POR MARCA
DELIMITER $$
CREATE FUNCTION valorPorMarca(p_marca VARCHAR(255))
RETURNS DECIMAL(50,2)
READS SQL DATA
BEGIN
	DECLARE valorTotal DECIMAL(50,2);
	SELECT SUM(valor * nuemro_vendas) INTO valorTotal FROM tb_carro WHERE marca = p_marca;
    RETURN valorTotal;
END $$

SELECT valorPorMarca('Fiat');