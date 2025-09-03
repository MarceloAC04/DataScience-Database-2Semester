USE db_carro;

SELECT @@autocommit;

SET @@autocommit = OFF;

SELECT * FROM tb_proprietario;

INSERT INTO tb_proprietario VALUES (
'5',
'Juscelino',
'5',
'54'
);

ROLLBACK;

START TRANSACTION;
INSERT INTO tb_proprietario VALUES (
'5',
'Juscelino',
'5',
'54'
);

COMMIT;

SELECT * FROM tb_proprietario;

START TRANSACTION;
	DELETE FROM tb_proprietario WHERE id_proprietario = '5';

COMMIT;



