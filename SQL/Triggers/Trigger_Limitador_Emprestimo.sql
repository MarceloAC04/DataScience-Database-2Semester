CREATE DEFINER=`root`@`localhost` TRIGGER `Limitador de Empréstimo` BEFORE INSERT ON `tb_emprestimos` FOR EACH ROW BEGIN
		-- Consulta da quantidade de emprestimos ativo
		DECLARE total_emprestimo INT;
		
		SELECT COUNT(*) INTO total_emprestimo FROM tb_emprestimos
		WHERE id_membro = NEW.id_membro AND data_devolucao IS NULL;
		
		-- Delimitador de emprestimo
		IF total_emprestimo >= 3 THEN 
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'O membro não pode ter mais de 3 empréstimos ativo';
		END IF;
END