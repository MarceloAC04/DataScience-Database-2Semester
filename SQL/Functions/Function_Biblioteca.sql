USE db_biblioteca;

SELECT * FROM tb_autores;

SELECT * FROM tb_emprestimos;

-- Exercicio 1. Crie uma função que recebe o id_autor e retorna a idade do autor com base na data de nascimento.
DELIMITER $$
CREATE FUNCTION calcularIdade(f_idAutor INT)
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE idadeAutor INT;
    SELECT TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) INTO idadeAutor FROM tb_autores WHERE id_autor = f_idAutor;
    RETURN idadeAutor;
END $$

SELECT calcularIdade('6') AS 'Idade do autor' $$

-- Exercicio 2. Crie uma função que recebe o id_autor e retorna a quantidade de livros escritos por esse autor.
DELIMITER $$
CREATE FUNCTION calcularLivros(f_idAutor INT) 
RETURNS INT
READS SQL DATA
BEGIN
	RETURN (SELECT COUNT(id_livro) FROM tb_livros WHERE id_autor = f_idAutor);
END $$

SELECT calcularLivros('1') AS 'Livros escritos' $$

-- Exercicio 3. Crie uma função que recebe duas datas e retorna o total de empréstimos realizados nesse período.
DELIMITER $$
CREATE FUNCTION emprestimoPorPeriodo(emprestimo DATE, devolucao DATE)
RETURNS INT
READS SQL DATA
BEGIN
	RETURN (SELECT COUNT(id_emprestimo) FROM tb_emprestimos
			WHERE data_emprestimo BETWEEN emprestimo AND devolucao);
END $$

SELECT emprestimoPorPeriodo('2020-01-05', '2024-12-12') $$

-- Exercicio 4. Crie uma função que retorna a média de dias em que os livros foram emprestados.
DELIMITER $$
CREATE FUNCTION mediaDiasEmprestimos()
RETURNS DECIMAL(10,2)
READS SQL DATA 
BEGIN
	RETURN ( SELECT AVG(TIMESTAMPDIFF(DAY, data_emprestimo, data_devolucao)) FROM tb_emprestimos);
END $$

SELECT mediaDiasEmprestimos() $$