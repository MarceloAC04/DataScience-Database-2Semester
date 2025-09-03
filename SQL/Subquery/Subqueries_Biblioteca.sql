-- EXERCÍCIO 5. Utilize subqueries para realizar as seguintes consultas:
USE db_biblioteca;
-- a. Liste os autores que possuem livros com ano de publicação maior que a
-- média de anos de publicação de todos os livros cadastrados.

SELECT * FROM tb_autores AS A
INNER JOIN tb_livros AS L 
ON A.id_autor = L.id_autor
WHERE ano_publicacao > (SELECT AVG(ano_publicacao) FROM tb_livros);

-- b. Liste os livros que foram emprestados ao menos uma vez.
SELECT * FROM tb_emprestimos
WHERE id_livro IN (SELECT id_livro FROM tb_emprestimos);

-- c. Consulte os livros que ainda não foram emprestados.
SELECT * FROM tb_emprestimos
WHERE id_livro NOT IN (SELECT id_livro FROM tb_emprestimos);