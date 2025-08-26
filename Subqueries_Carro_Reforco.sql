USE db_carro;

-- 1. Proprietários de carros acima da média de preço
SELECT nome FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_carroF = C.id_carro
WHERE valor > (SELECT AVG(valor) FROM tb_carro);

SELECT AVG(nuemro_vendas) FROM tb_carro;

-- 2. Carros vendidos mais que a média geral de vendas
SELECT * FROM tb_carro 
WHERE nuemro_vendas > (SELECT AVG(nuemro_vendas) FROM tb_carro);

-- 3. Carros que já tiveram valor acima da média histórica
SELECT * FROM tb_carro 
WHERE valor > (SELECT AVG(valor_anterior + valor_novo) FROM tb_historico_preco);


-- 4. Carros sem histórico de alteração de preço
SELECT * FROM tb_carro
WHERE id_carro NOT IN (SELECT id_carroF FROM tb_historico_preco);