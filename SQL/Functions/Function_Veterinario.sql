USE db_veterinaria;

SELECT * FROM tb_pets;
SELECT * FROM tb_atendimentos;

DROP FUNCTION ultimoAtendimento;

-- Exercicio 1. Crie uma função que receba o id_cliente e retorne a quantidade de pets que esse cliente possui.
DELIMITER $$
CREATE FUNCTION calcularPets(f_idDono INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE totalPets INT;
	SELECT COUNT(id_pet) INTO totalPets FROM tb_pets WHERE id_cliente = f_idDono;
    RETURN totalPets;
END $$

SELECT calcularPets('3') AS 'Total de Pets' $$

-- Exercicio 2. Crie uma função que recebe o id_pet e retorna a data da última consulta do pet.
DELIMITER $$
CREATE FUNCTION ultimoAtendimento(f_idPet INT)
RETURNS DATE
READS SQL DATA
BEGIN
	RETURN ( SELECT data_atendimento FROM tb_atendimentos WHERE id_pet = f_idPet);
END $$

SELECT ultimoAtendimento('1') AS 'Último atendimento' $$
 
 -- Exercicio 3. Crie uma função que receba o id_veterinario e retorne o número total de atendimentos feitos por ele.
 DELIMITER $$
CREATE FUNCTION calcularAtendimentos(f_idVeterinario INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE totalAtendimento INT;
	SELECT COUNT(id_atendimento) INTO totalAtendimento FROM tb_atendimentos WHERE id_veterinario = f_idVeterinario;
    RETURN totalAtendimento;
END $$

SELECT calcularAtendimentos('1') AS 'Nº Atendimentos' $$

    
