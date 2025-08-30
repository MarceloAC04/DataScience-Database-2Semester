USE db_veterinaria;

-- 1. INNER JOIN
-- 1. Liste o nome do pet, o nome do cliente e o telefone do cliente para todos
-- os pets cadastrados.
SELECT p.nome, c.nome, telefone FROM tb_pets AS P
INNER JOIN tb_clientes AS C
ON P.id_cliente = C.id_cliente;

-- 2. Liste a data, a descrição do atendimento, o nome do pet e o nome do
-- veterinário responsável.
SELECT data_atendimento, P.nome, V.nome FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P
ON A.id_pet = P.id_pet
INNER JOIN tb_veterinarios AS V
on A.id_veterinario = V.id_veterinario;

-- 3. Liste o nome do veterinário e todos os pets que ele já atendeu.
SELECT V.nome, P.nome, data_atendimento  FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V ON A.id_veterinario = V.id_veterinario 
INNER JOIN tb_pets AS P ON A.id_pet = P.id_pet
WHERE A.id_veterinario = '3';

-- 4. Mostre o nome do cliente, o nome do pet e a especialidade do
-- veterinário para cada atendimento realizado.
SELECT data_atendimento, C.nome as 'Dono', P.nome, V.especialidade FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON A.id_pet = P.id_pet
INNER JOIN tb_clientes AS C ON P.id_cliente = C.id_cliente
INNER JOIN tb_veterinarios AS V ON A.id_veterinario = V.id_veterinario;

-- 2 LEFT JOIN
-- 5. Liste todos os clientes e, caso existam, seus respectivos pets (mesmo
-- que não tenham atendimento registrado).
SELECT * FROM tb_clientes AS C 
LEFT JOIN tb_pets AS P
ON C.id_cliente = P.id_cliente;

-- 6. Liste todos os veterinários e, caso existam, os atendimentos realizados por eles.
SELECT * FROM tb_veterinarios AS V
LEFT JOIN tb_atendimentos AS A
ON V.id_veterinario = A.id_veterinario;

-- 3 RIGHT JOIN
-- 7. Liste todos os pets e, caso existam, seus respectivos donos (mesmo que
-- alguns registros de clientes não existam).
SELECT id_pet, P.nome, tipo, raca, C.nome AS 'Dono ', endereco, telefone FROM tb_pets AS P 
RIGHT JOIN tb_clientes AS C ON P.id_cliente = C.id_cliente;

-- 8. Liste todos os atendimentos, mesmo que algum veterinário não esteja
-- cadastrado na tabela.
SELECT descricao, data_atendimento, nome, especialidade, telefone FROM tb_atendimentos AS A
RIGHT JOIN tb_veterinarios AS V ON A.id_veterinario = V.id_veterinario;
