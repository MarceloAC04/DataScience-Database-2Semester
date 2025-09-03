
-- Exercício 1: Crie uma procedure chamada insere_professor que insere um professor na tabela professores e retorna o ID gerado.
DELIMITER $$
CREATE PROCEDURE inserirProfessor(
IN p_nome VARCHAR(100),
IN p_departamnto VARCHAR(100),
IN p_ano_admissao DATE
)
BEGIN
	INSERT INTO tb_professores (nome, departamento, ano_admissao) VALUES
    (p_nome, p_departamnto, p_ano_admissao);
    
    SELECT LAST_INSERT_ID();
END $$

CALL inserirProfessor('Regis Tadeu', 'Biologicas', '2006-07-19') $$

-- Exercício 2: Crie uma procedure chamada atualiza_disciplina que recebe o ID de uma disciplina e atualiza o nome dessa disciplina.
DELIMITER $$
CREATE PROCEDURE atualizaDisciplina(
IN p_id_disciplina INT,
IN p_disciplina VARCHAR(100)
)
BEGIN
	UPDATE tb_disciplinas SET disciplina = p_disciplina 
    WHERE id_disciplina = p_id_disciplina;
END $$

SELECT * FROM tb_disciplinas $$

CALL atualizaDisciplina(2, 'Calculo III') $$

-- Exercício 3: Crie uma procedure chamada remove_estudante que remove um estudante da tabela estudantes com base no ID passado como parâmetro.
DELIMITER $$
CREATE PROCEDURE remove_estudante(
IN p_id_estudante INT
)
BEGIN
	DELETE FROM tb_estudantes WHERE id_estudante = p_id_estudante;
END $$

CALL remove_estudante(7) $$

-- Exercício 4: Crie uma procedure chamada consulta_professor que retorna o nome e departamento de um professor com base no ID passado.
DELIMITER $$
CREATE PROCEDURE consultaProfessor(
IN p_id_professor INT
)
BEGIN
	SELECT nome, departamento FROM tb_professores WHERE id_professor = p_id_professor;
END $$

CALL consultaProfessor(1) $$

-- Exercício 5: Crie uma procedure chamada atualiza_nota que atualiza a nota de um
-- estudante para uma disciplina específica, com base no ID da matrícula.
DELIMITER $$
CREATE PROCEDURE atualizaNota(
IN p_nota DECIMAL(5,2),
IN p_id_matricula INT
)
BEGIN
	UPDATE tb_notas
    SET nota = p_nota
    WHERE id_matricula = p_id_matricula;
END $$

CALL atualizaNota(9.5, 5) $$