USE db_veterinaria;

-- 1. Liste o nome e a data de nascimento do pet mais antigo da clínica usando uma subquery.
SELECT * FROM tb_pets WHERE data_nascimento = (SELECT min(data_nascimento) FROM tb_pets);

-- 2. Liste o nome e a data de nascimento do pet mais novo usando uma subquery.
SELECT * FROM tb_pets WHERE data_nascimento = (SELECT max(data_nascimento) FROM tb_pets);

-- 3. Liste o nome de todos os veterinários que realizaram atendimentos na data
-- mais recente registrada.
SELECT nome FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario
WHERE data_atendimento = (SELECT max(data_atendimento) FROM tb_atendimentos);

-- 4. Liste os nomes dos clientes que possuem mais de um pet, utilizando uma
-- subquery para contar a quantidade.
SELECT nome FROM tb_clientes 
WHERE (SELECT id_cliente FROM tb_pets GROUP BY id_cliente HAVING COUNT(*) > 1);

-- 5. Liste o nome de todos os pets que ainda não passaram por atendimento,
-- utilizando uma subquery para verificar.
SELECT nome FROM tb_pets 
WHERE id_pet NOT IN ( SELECT id_pet FROM tb_atendimentos);

-- 6. Para cada cliente, mostre o nome e a quantidade de pets cadastrados,
-- utilizando uma subquery no SELECT.
SELECT C.nome, (SELECT COUNT(id_pet) 
FROM tb_pets WHERE id_cliente = C.id_cliente) AS 'Pets cadastrados'  
FROM tb_clientes AS C;

-- 7. Liste todos os atendimentos realizados pelo veterinário mais
-- recentemente cadastrado no sistema.
SELECT nome, especialidade, data_atendimento descricao, id_pet FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario
WHERE A.id_veterinario = 
( SELECT id_veterinario FROM tb_veterinarios 
	ORDER BY id_veterinario DESC LIMIT 1);

-- 8. Liste todas as informações do atendimento mais antigo registrado,
-- usando uma subquery para identificar a data.
SELECT nome, especialidade, data_atendimento, descricao, id_pet FROM tb_atendimentos AS A
INNER JOIN tb_veterinarios AS V
ON A.id_veterinario = V.id_veterinario
WHERE data_atendimento = ( SELECT MIN(data_atendimento) FROM tb_atendimentos);

-- 9. Liste os nomes dos clientes que já tiveram atendimentos com pelo
-- menos dois veterinários distintos, usando subquery.
SELECT C.nome AS Dono, P.nome AS P
FROM tb_atendimentos AS A
INNER JOIN tb_pets AS P ON A.id_pet = P.id_pet
INNER JOIN tb_clientes AS C ON P.id_cliente = C.id_cliente
GROUP BY C.id_cliente, P.id_pet
HAVING COUNT(DISTINCT A.id_veterinario) >= 2;
    

-- 10. Liste os nomes dos pets que foram atendidos pelo veterinário que mais
-- realizou atendimentos na clínica, usando subquery para identificar esse
-- veterinário.
SELECT P.nome, A.data_atendimento, A.descricao, id_veterinario FROM tb_atendimentos AS A
LEFT JOIN tb_pets AS P ON A.id_pet = P.id_pet
WHERE A.id_veterinario = ( SELECT id_veterinario FROM tb_atendimentos
	GROUP BY id_veterinario
    ORDER BY COUNT(*) DESC LIMIT 1);