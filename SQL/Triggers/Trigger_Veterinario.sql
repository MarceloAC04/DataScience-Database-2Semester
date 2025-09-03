USE db_veterinaria;

SELECT * FROM tb_pets; 

ALTER TABLE tb_pets
ADD idade INTEGER;

 INSERT INTO tb_pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente ,idade) VALUES
 ('6', 'Lila', 'Gato', 'Vira-lata', '2018-02-15', '3', null);