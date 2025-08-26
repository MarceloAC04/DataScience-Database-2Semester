USE db_carro;

ALTER TABLE tb_historico_preco
MODIFY id_historico INT AUTO_INCREMENT;

SELECT * FROM tb_carro;

UPDATE tb_carro SET valor = 69000 WHERE id_carro = 4;

SELECT * FROM tb_historico_preco;

UPDATE tb_carro SET valor = 500 WHERE id_carro = 4;

SELECT * FROM tb_historico_preco;

SELECT * FROM tb_proprietario;

ALTER TABLE tb_proprietario
ADD data_nascimento DATE;

ALTER TABLE tb_proprietario
ADD idade INTEGER;

INSERT INTO tb_proprietario
VALUES ('7', 'teste', '1',  null, '2000/01/01');

DELETE FROM tb_carro WHERE id_carro = '2';