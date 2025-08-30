CREATE DATABASE db_carro;

USE db_carro;

CREATE TABLE tb_carro (
id_carro int(10) not null UNIQUE,
marca VARCHAR(100),
modelo VARCHAR(100),
ano int(4),
valor DECIMAL(10,2),
cor VARCHAR(100),
nuemro_vendas int(10),
PRIMARY KEY (id_carro)
);

CREATE TABLE tb_proprietario (
id_proprietario int(10) not null UNIQUE,
nome VARCHAR(255),
id_carroF int(10) not null,
PRIMARY KEY (id_proprietario),
FOREIGN KEY (id_carroF) REFERENCES tb_carro(id_carro)
);

ALTER TABLE tb_proprietario ADD idade INT(3);


CREATE TABLE tb_historico_preco(
id_historico INT(10) NOT NULL UNIQUE,
data_modificacao DATETIME,
id_carroF int(10) NOT NULL,
valor_anterior DECIMAL(10, 2),
valor_novo DECIMAL(10,2),
PRIMARY KEY (id_historico),
FOREIGN KEY(id_carroF) REFERENCES tb_carro(id_carro)
);

ALTER TABLE tb_proprietario RENAME COLUMN nome to name; 

SELECT * FROM tb_historico_preco;
SELECT * FROM tb_proprietario;
SELECT * FROM tb_carro;