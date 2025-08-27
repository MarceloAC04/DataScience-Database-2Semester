USE db_veterinaria;

select * from tb_veterinarios;
SELECT * FROM tb_atendimentos;

DROP PROCEDURE InserirAtendimento;

-- EXERCICIO 1. Crie uma stored procedure que adicione um novo veterinário na tabela Veterinarios.
DELIMITER $$
CREATE PROCEDURE InserirVeterinario(
IN p_id_veterinario INT,
IN p_nome VARCHAR(100),
IN p_especialidade VARCHAR(100),
IN p_telefone VARCHAR(100)
)
BEGIN
	INSERT INTO tb_veterinarios (id_veterinario, nome, especialidade, telefone)
    VALUES (p_id_veterinario, p_nome, p_especialidade, p_telefone);
END $$

CALL InserirVeterinario('6', 'Rogerio Águas', 'Oftamologista', '45678735');


-- EXERCICIO 2. Crie uma stored procedure para atualizar os dados de um cliente, como nome, endereço e telefone.
DELIMITER $$
CREATE PROCEDURE AtualizarVeterinario(
IN p_id_veterinario INT,
IN p_nome VARCHAR(100),
IN p_especialidade VARCHAR(100),
IN p_telefone VARCHAR(100)
)
BEGIN
	Update tb_veterinarios SET nome = p_nome, 
    especialidade = p_especialidade,
    telefone = p_telefone
    WHERE id_veterinario = p_id_veterinario;
END $$

CALL AtualizarVeterinario('1', 'Tamires Souza', 'Ortopedista', '12368756');

-- EXERCICIO 3. Crie uma stored procedure que registre um novo atendimento de um pet, verificando se o veterinário e o pet existem.

DELIMITER $$
CREATE PROCEDURE InserirAtendimento(
IN p_id_atendimento INT,
IN p_descricao VARCHAR(100),
IN p_data_atendimento DATE,
IN p_id_pet INT,
IN p_id_veterinario INT
)
BEGIN
 IF NOT EXISTS (
        SELECT 1 FROM tb_pets WHERE id_pet = p_id_pet
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ID do pet não existe.';
    END IF;
    
     IF NOT EXISTS (
        SELECT 1 FROM tb_veterinarios WHERE id_veterinario = p_id_veterinario
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ID do veterinario não existe.';
    END IF;
	INSERT INTO tb_atendimentos (id_atendimento, descricao, data_atendimento, id_pet,			id_veterinario)
	VALUES (p_id_atendimento, p_descricao, p_data_atendimento, p_id_pet, p_id_veterinario);
END $$

CALL InserirAtendimento('4', 'tudo joinha', '2025-08-25', '3', '1') $$
CALL InserirAtendimento('5', 'tudo joinha', '2025-08-25', '7', '7') $$
CALL InserirAtendimento('6', 'tudo joinha', '2025-08-25', '3', '7') $$

