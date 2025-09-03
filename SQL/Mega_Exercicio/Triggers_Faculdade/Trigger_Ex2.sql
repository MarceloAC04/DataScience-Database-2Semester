-- Exercício 2: Crie um trigger chamado atualiza_data_matricula que atualiza a data de matrícula para a data atual sempre que uma nova matrícula for inserida.
CREATE DEFINER=`root`@`localhost` TRIGGER `atualiza_data_matricula` BEFORE INSERT ON `tb_matriculas` FOR EACH ROW BEGIN
	SET NEW.data_matricula = CURDATE();
END