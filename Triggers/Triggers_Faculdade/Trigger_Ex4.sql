CREATE DEFINER=`root`@`localhost` TRIGGER `impede_deletar_disciplina` BEFORE DELETE ON `tb_disciplinas` FOR EACH ROW BEGIN
	IF OLD.id_disciplina IN (SELECT id_disciplina FROM tb_matriculas) THEN
	  SIGNAL SQLSTATE '45000'
     SET MESSAGE_TEXT = 'Não é possível excluir uma disciplina com aluno associado.';
	END IF;
END