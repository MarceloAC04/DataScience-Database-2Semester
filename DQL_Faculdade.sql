-- Exercício 1: Liste todos os estudantes cadastrados na tabela estudantes que pertencem ao curso de Ciência de Dados e foram matriculados em 2024.
SELECT * FROM tb_estudantes WHERE id_curso = 1 AND YEAR( data_matricula) = '2024';

-- Exercício 2: Liste todos os professores que pertencem ao departamento de Ciência
-- da Computação e possuem mais de 5 anos de experiência.
SELECT * FROM tb_professores WHERE departamento = 'T.I' AND TIMESTAMPDIFF(YEAR, ano_admissao, CURDATE()) >= 5;

-- Exercício 3: Liste os nomes dos estudantes e suas notas nas disciplinas, ordenados pela nota em ordem decrescente e, em caso de empate, pelo nome do estudante em ordem alfabética.
SELECT nome_estudante, nota FROM tb_notas AS N
INNER JOIN tb_matriculas AS M ON N.id_matricula = M.id_matricula
INNER JOIN tb_estudantes AS E ON M.id_estudante = E.id_estudante
ORDER BY nota DESC, nome_estudante ASC;

-- Exercício 4: Encontre a média das notas dos estudantes no curso de Engenharia de Software.
SELECT AVG(nota) FROM tb_notas AS N
INNER JOIN tb_matriculas AS M ON N.id_matricula = M.id_matricula
INNER JOIN tb_disciplinas AS D ON M.id_disciplina = D.id_disciplina
INNER JOIN tb_cursos AS C ON D.id_curso = C.id_curso WHERE C.id_curso = 3;

-- Exercício 5: Liste os cursos que possuem mais de 5 estudantes matriculados. Exiba o nome do curso e o total de estudantes matriculados.
SELECT nome_curso, COUNT(id_estudante) AS total_estudantes
FROM tb_cursos AS C
LEFT JOIN tb_estudantes AS E ON C.id_curso = E.id_curso
GROUP BY nome_curso
HAVING COUNT(id_estudante) > 5;