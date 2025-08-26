-- Ex 5. Realize as seguintes consultas:

-- a. O pet com a data de nascimento mais antigo
SELECT id_pet, nome, data_nascimento FROM tb_pets ORDER BY data_nascimento ASC LIMIT 1;

-- b. O pet com a data de nascimento mais recente
SELECT id_pet, nome, data_nascimento FROM tb_pets ORDER BY data_nascimento DESC LIMIT 1;

-- c. A quantidade de pets cadastrados no banco de dados
SELECT COUNT(id_pet) AS 'Pets Cadastrados' FROM tb_pets;

-- d. Ordene o nome dos pets em ordem crescente
SELECT id_pet, nome FROM tb_pets ORDER BY nome ASC;

-- e. Ordene o nome dos pets em ordem decrescente
SELECT id_pet, nome FROM tb_pets ORDER BY nome DESC;

-- f. Ordene o nome dos veterinários em ordem crescente
SELECT id_veterinario, nome FROM tb_veterinarios ORDER BY nome ASC;

-- g. Ordene o nome dos veterinários em ordem decrescente
SELECT id_veterinario, nome FROM tb_veterinarios ORDER BY nome DESC;

-- h. A data de atendimento mais antiga
SELECT id_atendimento, descricao data_atendimento FROM tb_atendimentos 
ORDER BY data_atendimento ASC LIMIT 1;

-- i. A data de atendimento mais recente
SELECT id_atendimento, descricao, data_atendimento FROM tb_atendimentos 
ORDER BY data_atendimento DESC LIMIT 1;