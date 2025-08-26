 -- Ex 3. Inserir ao menos 3 valores em cada tabela
 INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone) VALUES
 ('1', 'Carlos Alberto', 'Geral', '23789328'),
 ('2', 'Alberto Torres', 'Cardiologista', '67446049'),
 ('3', 'Carlos Alberto', 'Dermatologista', '31759438');
 
INSERT INTO tb_clientes (id_cliente, nome, endereco, telefone) VALUES
 ('1', 'Carlos Alberto', 'Rua das Jamantas', '23789328'),
 ('2', 'Alberto Torres', 'Rua do Rock', '19385635'),
 ('3', 'Raquel Oliveira', 'Rua das Capivaras', '46789274');
 
 INSERT INTO tb_pets (id_pet, nome, tipo, raca, data_nascimento, id_cliente) VALUES
 ('1', 'Tito', 'Gato', 'Persa', '2017-01-25', '3'),
 ('2', 'Snoopy', 'Cachorro', 'Caramelo', '2019-03-21', '1'),
 ('3', 'Louro José', 'Ave', 'papagaio', '2020-04-04', '2');
  
INSERT INTO tb_atendimentos (id_atendimento, descricao, data_atendimento, id_pet, id_veterinario) VALUES
 ('1', 'Louro quer biscoito', '2024-08-12', '3', '2'),
 ('2', 'Perfeitamente peludo', '2025-03-21', '1', '3'),
 ('3', 'Caramelo', '2025-02-04', '2', '1');
 
 -- Ex 4. Realize ao menos 5 alterações (UPDATES)
UPDATE tb_veterinarios SET nome = 'Tamires Souza' WHERE id_veterinario = '1';
UPDATE tb_clientes SET nome = 'Heitor Gomes', endereco = 'Avenida Elefante' WHERE id_cliente = '2';
UPDATE tb_pets SET raca = 'Papagaio' WHERE id_pet = '3';
UPDATE tb_atendimentos SET descricao = 'Saúde em dia' WHERE id_atendimento = '3';
