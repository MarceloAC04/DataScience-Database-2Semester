SELECT * FROM tb_autores;

INSERT INTO tb_autores (id_autor, nome, data_nascimento) VALUES 
('1', 'JRR Tolkien', '1892-04-05'),
('2', 'HP Lovercraft', '1890-06-02'),
('3', 'Machado de Asis', '1892-02-11'),
('4', 'George Orwell', '1903-12-12'),
('5', 'Dante Alighieri', '1265-01-20');

SELECT * FROM tb_livros;

INSERT INTO tb_livros (id_livro, titulo, ano_publicacao, id_autor) VALUES 
('1', 'O Silmallirion', '1977-07-15', '1'),
('2', 'O Chamado de Chutulhu', '1928-02-02', '2'),
('3', 'Quincas Borbas', '1891-04-11', '3'),
('4', '1984', '1949-06-08', '4'),
('5', 'A Divina Comedia', '1321-10-20', '5');

SELECT * FROM tb_membros;

INSERT INTO tb_membros (id_membro, nome, data_adesao) VALUES 
('1', 'Socrates', '2022-04-05'),
('2', 'Jimmy Page', '2016-06-02'),
('3', 'Nando Moura', '2021-02-11'),
('4', 'Riquelme', '2023-12-12'),
('5', 'Gustavo Lima', '2024-01-20');

SELECT * FROM tb_emprestimos;

INSERT INTO tb_emprestimos (id_emprestimo, data_emprestimo, data_devolucao, id_livro, id_membro) VALUES 
('1', '2021-04-05', '2021-05-05', '1', '3'),
('2', '2020-02-05', '2020-02-28', '2', '2'),
('3', '2022-07-25', '2022-08-02', '4', '1'),
('4', '2024-02-11', '2024-03-05', '3', '5'),
('5', '2024-11-25', '2024-12-12', '5', '4');

UPDATE tb_autores SET nome = 'J.R.R Tolkien', data_nascimento = '1892-01-03' WHERE id_autor = '1';
UPDATE tb_livros SET titulo = 'O Senhor dos Anéis', ano_publicacao = '1954-07-29' WHERE id_livro = '1';
UPDATE tb_membros SET nome = 'Snoop Dog', data_adesao = '2019-07-29' WHERE id_membro = '4';
UPDATE tb_membros SET nome = 'Snoopy', data_adesao = '2019-07-28' WHERE id_membro = '3';

SELECT id_emprestimo, titulo, data_emprestimo, data_devolucao, nome FROM tb_emprestimos 
LEFT JOIN tb_membros on tb_emprestimos.id_membro = tb_membros.id_membro 
RIGHT JOIN tb_livros on tb_emprestimos.id_livro = tb_livros.id_livro;