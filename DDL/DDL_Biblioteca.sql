CREATE DATABASE db_biblioteca;

USE db_biblioteca;

CREATE TABLE tb_autores (
id_autor int(10) not null UNIQUE,
nome VARCHAR(100),
data_nascimento DATE,
PRIMARY KEY (id_autor)
);

SELECT * FROM tb_autores;

CREATE TABLE tb_livros (
id_livro int(10) not null UNIQUE,
titulo VARCHAR(100),
ano_publicacao DATE,
id_autor int(10) not null,
PRIMARY KEY (id_livro),
FOREIGN KEY (id_autor) REFERENCES tb_autores(id_autor)
);

SELECT * FROM tb_livros;

CREATE TABLE tb_membros (
id_membro int(10) not null UNIQUE,
nome VARCHAR(100),
data_adesao DATE,
PRIMARY KEY (id_membro)
);

SELECT * FROM tb_membros;

CREATE TABLE tb_emprestimos (
id_emprestimo int(10) not null UNIQUE,
data_emprestimo DATE,
data_devolucao DATE,
id_livro int(10) not null,
id_membro int(10) not null,
PRIMARY KEY (id_emprestimo),
FOREIGN KEY (id_livro) REFERENCES tb_livros(id_livro),
FOREIGN KEY (id_membro) REFERENCES tb_membros(id_membro)
);

SELECT * FROM tb_emprestimos;