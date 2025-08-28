-- Exercício 1: Liste os cursos que possuem mais de 5 disciplinas associadas.
SELECT nome_curso
FROM tb_cursos AS C
WHERE (
    SELECT COUNT(id_disciplina)
    FROM tb_disciplinas AS D
    WHERE D.id_curso = C.id_curso
) > 5;

-- Exercício 2: Liste os estudantes que estão matriculados em mais disciplinas do que a média de disciplinas por estudante.
SELECT nome_estudante
FROM tb_estudantes AS E
INNER JOIN tb_matriculas AS M
ON E.id_estudante = M.id_estudante
GROUP BY nome_estudante
HAVING
    COUNT(M.id_disciplina) > (
        SELECT AVG(disciplinas_por_estudante)
        FROM (
            SELECT COUNT(id_disciplina) AS disciplinas_por_estudante
            FROM tb_matriculas
        ) AS disciplina_por_estudante
    );
    
-- Exercício 3: Encontre os professores que ministram disciplinas com a maior média de notas.
SELECT P.nome FROM tb_matriculas AS M
INNER JOIN tb_disciplinas AS D ON M.id_disciplina = D.id_disciplina
INNER JOIN tb_professores AS P ON D.id_professor = P.id_professor
WHERE M.id_disciplina IN (
SELECT MAX(avg_nota)
        FROM (
            SELECT AVG(nota) AS avg_nota
            FROM tb_notas
            GROUP BY M.id_disciplina
        ) AS medias
);

-- Exercício 4: Liste os estudantes que possuem pelo menos uma nota abaixo da média geral de notas.
SELECT nome_estudante
FROM tb_notas AS N
INNER JOIN tb_matriculas AS M
ON N.id_matricula = M.id_matricula
LEFT JOIN tb_estudantes AS E
ON M.id_estudante = E.id_estudante
WHERE N.nota < (
SELECT AVG(nota) FROM tb_notas
);

-- Exercício 5: Liste os professores que não possuem nenhuma disciplina com notas abaixo de 7.
SELECT P.nome FROM tb_matriculas AS M
INNER JOIN tb_disciplinas AS D ON M.id_disciplina = D.id_disciplina
INNER JOIN tb_professores AS P ON D.id_professor = P.id_professor
WHERE id_matricula IN (
SELECT id_matricula FROM tb_notas WHERE nota > 7.0
);
