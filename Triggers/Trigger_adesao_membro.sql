CREATE DEFINER=`root`@`localhost` TRIGGER `Inserção Adesão` BEFORE INSERT ON `tb_membros` FOR EACH ROW BEGIN
	SET NEW.data_adesao = NOW();
END