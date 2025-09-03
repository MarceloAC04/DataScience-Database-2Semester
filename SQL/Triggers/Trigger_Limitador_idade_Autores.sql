CREATE DEFINER=`root`@`localhost` TRIGGER `Limitador Idade` BEFORE INSERT ON `tb_autores` FOR EACH ROW BEGIN
	IF (TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE())) < 18 THEN
			SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'O autor possui menos de 18 anos';
		END IF;
END