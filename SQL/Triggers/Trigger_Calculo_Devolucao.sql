CREATE DEFINER = CURRENT_USER TRIGGER `Calculo Devolução` BEFORE INSERT ON `tb_emprestimos` FOR EACH ROW
BEGIN
	-- Ao inserir um novo empréstimo, a data limite de devolução é de 15 dias
    SET NEW.data_devolucao = DATE_ADD(NEW.data_devolucao, INTERVAL 14 DAY);
END
