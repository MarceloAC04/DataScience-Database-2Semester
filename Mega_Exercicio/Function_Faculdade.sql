USE db_faculdade;
-- Exercício 1: Crie uma função chamada idade_estudante que receba a data de nascimento de um estudante e retorne à idade.
DELIMITER $$
CREATE FUNCTION idade_estudante(nascimento DATE)
RETURNS INT
READS SQL DATA
BEGIN
	RETURN (TIMESTAMPDIFF(YEAR, nascimento, CURDATE()));
END $$

SELECT idade_estudante('1996-02-05') AS 'Idade do estudante' $$

-- Exercício 2: Crie uma função chamada total_estudantes_disciplina que receba o ID de uma disciplina e retorne o número de estudantes matriculados nela.
DELIMITER $$
CREATE FUNCTION total_estudantes_disciplina(idDisciplina INT)
RETURNS INT 
READS SQL DATA
BEGIN
	RETURN ( SELECT COUNT(id_disciplina) FROM tb_matriculas WHERE id_disciplina = idDisciplina);
END $$

SELECT total_estudantes_disciplina(2) AS 'Total de Estudantes' $$

-- Exercício 3: Crie uma função chamada nota_maxima que retorne a maior nota registrada na tabela notas.
DELIMITER $$
CREATE FUNCTION nota_maxima()
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
	RETURN (SELECT MAX(nota) FROM tb_notas);
END $$

SELECT nota_maxima() AS 'Maior nota' $$

-- Exercício 4: Crie uma função chamada disciplina_do_curso que receba o ID de um curso e retorne o nome da disciplina associada.
DELIMITER $$
CREATE FUNCTION disciplina_do_curso(idCurso INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	RETURN (SELECT disciplina FROM tb_disciplinas WHERE id_curso = idCurso);
END $$

SELECT disciplina_do_curso(1) $$

-- Exercício 5: Crie uma função chamada media_notas_curso que receba o ID de um curso e retorne a média das notas dos estudantes matriculados nesse curso.
DELIMITER $$
CREATE FUNCTION medias_notas_curso(idCurso INT)
RETURNS DECIMAL(5,2)
READS SQL DATA
BEGIN
	RETURN ( SELECT AVG(n.nota)
    FROM tb_notas AS N
    LEFT JOIN tb_matriculas M ON N.id_matricula = M.id_matricula
    LEFT JOIN tb_disciplinas AS D ON M.id_disciplina = D.id_disciplina
    WHERE D.id_curso = idCurso);
END $$

SELECT medias_notas_curso(1) $$