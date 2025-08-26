USE db_biblioteca;

-- 1. INNER JOIN 
-- 1. Liste o título do livro e o nome do autor.
SELECT titulo, nome FROM tb_livros AS L
INNER JOIN tb_autores AS A
ON L.id_autor = A.id_autor;

-- 2. Liste o título do livro, o nome do autor e o ano de publicação.
SELECT titulo, nome, ano_publicacao FROM tb_livros AS L
INNER JOIN tb_autores AS A
ON L.id_autor = A.id_autor;

-- 3. Liste o nome do membro, o título do livro e a data de empréstimo.
SELECT nome, titulo, data_emprestimo FROM tb_emprestimos AS E
INNER JOIN tb_membros  AS M ON E.id_membro = M.id_membro
INNER JOIN tb_livros  AS L ON E.id_livro = L.id_livro;

-- 4. Liste todos os empréstimos com o nome do membro, 
-- título do livro, nome do autor e data de devolução.
SELECT M.nome, titulo, A.nome AS 'autor', data_devolucao FROM tb_emprestimos AS E
INNER JOIN tb_membros AS M ON E.id_membro = M.id_membro
INNER JOIN tb_livros AS L ON E.id_livro = L.id_livro
INNER JOIN tb_autores AS A on A.id_autor =  L.id_autor;

-- 2. LEFT JOIN
-- 5. Liste todos os membros e, caso existam, os livros que eles já emprestaram.
SELECT nome, titulo, data_emprestimo FROM tb_membros AS M
LEFT JOIN tb_emprestimos AS E ON M.id_membro = E.id_membro 
LEFT JOIN tb_livros AS L ON E.id_livro = L.id_livro;

-- 6. Liste todos os autores e os livros que eles escreveram (mesmo que algum
-- autor ainda não tenha livros cadastrados).
SELECT nome, titulo, ano_publicacao FROM tb_autores AS A
LEFT JOIN tb_livros AS L
ON A.id_autor = L.id_autor;

-- 3. RIGHT JOIN
-- 7. Liste todos os livros e, caso tenham, o nome do autor correspondente.
SELECT titulo, nome,  ano_publicacao FROM tb_livros AS L
RIGHT JOIN tb_autores AS A
ON L.id_autor = A.id_autor;

-- 8 Liste todos os livros e, caso tenham, os membros que os emprestaram.
SELECT 
    titulo, nome, data_emprestimo
FROM
    tb_livros AS L
        RIGHT JOIN
    tb_emprestimos AS E ON L.id_livro = E.id_livro
        RIGHT JOIN
    tb_membros AS M ON M.id_membro = E.id_membro;
