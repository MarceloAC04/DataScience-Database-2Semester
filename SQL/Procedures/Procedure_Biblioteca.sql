USE db_biblioteca;

-- EXERCICIO 1. Crie uma stored procedure que insira um novo autor na tabela Autores.
DELIMITER $$
CREATE PROCEDURE InserirAutor (
IN p_id_autor INT,
IN p_nome VARCHAR(100),
IN p_data_nascimento DATE
)
BEGIN
	INSERT INTO tb_autores (
    id_autor, nome, data_nascimento
    ) VALUES (p_id_autor, p_nome, p_data_nascimento);
END $$

CALL InserirAutor('6', 'Liev Tostoi', '1828-09-28');

-- EXERCICIO 2. Crie uma stored procedure para atualizar a data de devolução de um empréstimo já registrado.
DELIMITER $$
CREATE PROCEDURE AtualizarDevolucao (
IN p_id_emprestimo INT,
IN p_data_devolucao DATE
)
BEGIN
	UPDATE tb_emprestimos SET data_devolucao = p_data_devolucao WHERE id_emprestimo = p_id_emprestimo;
END $$

CALL AtualizarDevolucao('3', '2022-08-06');

-- EXERCICIO 3. Crie uma stored procedure que consulte todos os livros emprestados por um determinado membro, retornando os títulos dos livros e as datas de empréstimo.
DELIMITER $$
CREATE PROCEDURE ConsultaLivros (
IN p_id_membro INT
)
BEGIN
	SELECT titulo, data_emprestimo, data_devolucao, nome AS Membro
    FROM tb_emprestimos AS E
    INNER JOIN tb_livros AS L
    ON E.id_livro = L.id_livro
    INNER JOIN tb_membros AS M
    ON E.id_membro = M.id_membro
    WHERE E.id_membro = p_id_membro;
END $$

CALL ConsultaLivros('2');