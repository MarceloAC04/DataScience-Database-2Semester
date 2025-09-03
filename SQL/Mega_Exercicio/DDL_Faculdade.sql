CREATE DATABASE db_faculdade;

USE db_faculdade;

CREATE TABLE tb_cursos (
id_curso INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(100) NOT NULL,
duracao_anos INT(10) NOT NULL
);

SELECT * FROM tb_cursos;

CREATE TABLE tb_professores (
id_professor INT UNIQUE AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
departamento VARCHAR(100) NOT NULL
);

SELECT * FROM tb_professores;

CREATE TABLE tb_disciplinas (
id_disciplina INT UNIQUE AUTO_INCREMENT,
disciplina VARCHAR(100) NOT NULL,
id_curso INT,
id_professor INT,
PRIMARY KEY(id_disciplina),
FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso),
FOREIGN KEY(id_professor) REFERENCES tb_professores(id_professor)
);

SELECT * FROM tb_disciplinas;

CREATE TABLE tb_estudantes (
id_estudante INT UNIQUE AUTO_INCREMENT,
nome_estudante VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
data_nascimento DATE,
data_matricula DATE NOT NULL,
id_curso INT,
PRIMARY KEY(id_estudante),
FOREIGN KEY(id_curso) REFERENCES tb_cursos(id_curso)
);

SELECT * FROM tb_estudantes;

CREATE TABLE tb_matriculas (
id_matricula INT UNIQUE AUTO_INCREMENT,
data_matricula DATE NOT NULL,
id_estudante INT,
id_disciplina INT,
PRIMARY KEY(id_estudante),
FOREIGN KEY(id_estudante) REFERENCES tb_estudantes(id_estudante),
FOREIGN KEY(id_disciplina) REFERENCES tb_disciplinas(id_disciplina)
);

SELECT * FROM tb_matriculas;

CREATE TABLE tb_notas (
id_nota INT UNIQUE AUTO_INCREMENT,
data_lancamento DATE NOT NULL,
nota DECIMAL(5,2),
id_matricula INT,
PRIMARY KEY(id_nota),
FOREIGN KEY(id_matricula) REFERENCES tb_matriculas(id_matricula)
);

SELECT * FROM tb_notas;

ALTER TABLE tb_professores ADD ano_admissao DATE;

