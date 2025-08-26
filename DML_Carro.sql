USE db_carro;

SELECT * FROM tb_carro;

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, nuemro_vendas) VALUES (
'1',
'Renault',
'Kwid',
'2023',
'80000',
'branco',
'150000'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, nuemro_vendas) VALUES (
'2',
'Subaru',
'Imprenza WRX',
'2007',
'90000',
'azul',
'20000'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, nuemro_vendas) VALUES (
'3',
'Fiat',
'Uno',
'1997',
'30000',
'vinho',
'300000'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, nuemro_vendas) VALUES (
'4',
'Audi',
'A3',
'2003',
'75000',
'vermelha',
'150000'
);

INSERT INTO tb_carro (id_carro, marca, modelo, ano, valor, cor, nuemro_vendas) VALUES (
'5',
'Bmw',
'M3',
'2005',
'250000',
'cinza',
'450000'
);

SELECT * FROM tb_proprietario;

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
'1',
'Ronaldo',
'1',
'38'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
'2',
'Kanye West',
'2',
'48'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
'3',
'Wilson',
'3',
'38'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
'4',
'Memphis Depay',
'4',
'31'
);

INSERT INTO tb_proprietario (id_proprietario, nome, id_carroF, idade) VALUES (
'5',
'Tony Iomni',
'5',
'75'
);

/* ALTERAÇÔES */
SELECT * FROM tb_proprietario WHERE id_proprietario = '1';

UPDATE tb_proprietario SET idade = '43' WHERE id_proprietario = '1';

SELECT * FROM tb_carro WHERE id_carro = '1';

UPDATE tb_carro SET marca = 'Mitsubishi', modelo = 'Eclipse', ano = '1999' WHERE id_carro = '1';

SELECT * FROM tb_carro WHERE marca = 'Subaru';

UPDATE tb_carro SET modelo = 'Imprenza WRX STI' WHERE id_carro = '2';

SELECT * FROM tb_proprietario WHERE nome = 'Kanye West';

UPDATE tb_proprietario SET nome = 'Michael Jordan', idade = '62' WHERE id_proprietario = '2';

/* DELETE */
DELETE FROM tb_proprietario WHERE id_proprietario = '5';

SELECT * FROM tb_proprietario;