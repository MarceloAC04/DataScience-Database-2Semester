-- Subqueiries - Carro
USE db_carro;

-- 1. Quais carros tem um preço acima da média
-- 1 Calcular a media
SELECT AVG(valor) FROM tb_carro;

SELECT * FROM tb_carro WHERE VALOR > (SELECT AVG(valor) FROM tb_carro); 