INSERT INTO tb_cursos (nome_curso, duracao_anos) VALUES 
('Ciência de Dados', 2),
('Ciência da Computação', 4),
('Engenharia de Software', 5),
('Letras', 3),
('Engeharia Elétrica', 4);

INSERT INTO tb_professores (nome, departamento, ano_admissao) VALUES 
('Jéssica Franzon', 'T.I', '2024-04-03'),
('Carlos Augusto', 'T.I', '2016-05-23'),
('Igor Cavalera', 'Ciência Exatas', '2010-07-19'),
('Nair Silva', 'Humanas', '2009-10-31'),
('Fernando Noronha', 'Ciência Exatas', '1999-03-03');

INSERT INTO tb_disciplinas (
disciplina,
id_curso,
id_professor)
VALUES 
('Banco de Dados', 1, 1),
('Calculo II', 3, 2),
('Redação', 4, 4),
('Sistemas Elétricos', 5, 5),
('Arquitetura de Computadores', 2 ,3);


INSERT INTO tb_estudantes (
nome_estudante,
email,
data_nascimento ,
data_matricula,
id_curso
) VALUES 
('Chuck Schuldiner', 'chuckdiner@gmail.com', '2001-02-05', '2025-01-15', 1),
('Andreas Kisser', 'andreaskisser@gmail.com', '2000-12-05', '2021-02-25', 3),
('Max Cavalera', 'cavalera85@gmail.com', '1996-02-05', '2022-06-02',2),
('Wilson Azevedo', 'wilson98@gmail.com', '2003-02-05', '2020-02-12', 4),
('John Petrucci', 'petrucci@gmail.com', '2002-08-08', '2023-01-20', 5);

SELECT * FROM tb_estudantes;

INSERT INTO tb_matriculas (
data_matricula,
id_estudante,
id_disciplina
) VALUES
( '2020-02-12', 4,  4),
( '2021-02-25', 2, 3),
( '2022-06-02', 3, 2),
( '2023-01-20', 5, 5),
( '2025-01-15', 1, 1);

INSERT INTO tb_notas (
data_lancamento,
nota,
id_matricula
) VALUES
( '2025-06-17', 9.8,  5),
( '2025-04-14', 3.7, 1),
( '2025-05-12', 8.8, 3),
( '2025-10-20', 7.9, 4),
( '2025-04-24', 6.8, 2);


