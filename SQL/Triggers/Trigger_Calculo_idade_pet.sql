CREATE DEFINER=`root`@`localhost` TRIGGER `Calculo Idade` BEFORE INSERT ON `tb_pets` FOR EACH ROW BEGIN
	SET NEW.idade = TIMESTAMPDIFF(YEAR, NEW.data_nascimento, CURDATE());
END