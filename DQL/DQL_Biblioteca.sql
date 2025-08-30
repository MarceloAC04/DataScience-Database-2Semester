USE db_Biblioteca;

-- a. O livro com a data de publicação mais antigo
SELECT titulo, ano_publicacao FROM tb_livros ORDER BY ano_publicacao ASC LIMIT 1;

-- b. O livro com a data de publicação mais recente
SELECT titulo, ano_publicacao FROM tb_livros ORDER BY ano_publicacao DESC LIMIT 1;

-- c. A quantidade de livros cadastrados no banco de dados
SELECT COUNT(id_livro) AS 'Livros cadastrados' FROM tb_livros;

-- d. Consulten apenas o livros que possuam data de devolução em '18-07-2024'
SELECT titulo as 'Livro Emprestado', data_devolucao FROM tb_emprestimos INNER JOIN tb_livros on tb_emprestimos.id_livro = tb_livros.id_livro
WHERE data_devolucao = '2024-03-05';

-- e. Ordene o nome dos autores em ordem crescente
SELECT * FROM tb_autores ORDER BY nome;

-- f. Ordene o nome dos livros em ordem decrescente
SELECT * FROM tb_livros ORDER BY titulo DESC;
