USE db_carro;

SELECT * FROM tb_carro;

-- STORED PROCEDURE
-- Quando precisa armazenar um bloco de código que pode envolver multiplas operaçóes (INSERT, UPDATE, DELETE).

-- *Cria uma procedure que insira um novo carro na tabela
-- IN -> PARAMETRO DE ENTRADA
-- OUT -> PARAMETROS DE SAIDA
DELIMITER $$
CREATE PROCEDURE InserirCarro (
IN p_id_carro INT,
IN p_marca VARCHAR(100),
IN p_modelo VARCHAR(100),
IN p_ano INT,
IN p_valor DECIMAL(10,2),
IN p_cor VARCHAR(100),
IN p_numeroVendas INT
)
BEGIN
	INSERT INTO tb_carro (
    id_carro, marca, modelo, ano, valor, cor, nuemro_vendas
    ) VALUES (p_id_carro, p_marca, p_modelo, p_ano, p_valor, p_cor, p_numeroVendas);
END $$

CALL InserirCarro('6', 'Honda', 'Civic Type R' , '2008', '320000' ,'Laranja', '17000' );