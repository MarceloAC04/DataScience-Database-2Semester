CREATE DEFINER=`root`@`localhost` TRIGGER `Limitador Autores` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
		IF EXISTS (SELECT 1 FROM tb_autores WHERE LOWER(nome) = LOWER(NEW.nome)) THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'O autor já está cadastrado no sistema';
		END IF;
END