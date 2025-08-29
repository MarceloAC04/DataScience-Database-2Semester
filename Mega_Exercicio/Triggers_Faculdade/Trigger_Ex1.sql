-- Exercício 1: Crie um trigger chamado verifica_nota_maxima que impede a inserção de uma nota superior a 10.
CREATE DEFINER=`root`@`localhost` TRIGGER `verifica_nota_maxima` BEFORE INSERT ON `tb_notas` FOR EACH ROW BEGIN
	IF NEW.nota > 10 THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'A nota não pode ser maior que 10';
    END IF;
END