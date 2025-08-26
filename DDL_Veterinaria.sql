-- Ex 1. Criação do Banco de Dados
CREATE DATABASE db_veterinaria;
USE db_veterinaria;

-- Ex 2. Criação das Tabelas
CREATE TABLE tb_veterinarios (
id_veterinario INT(10) NOT NULL,
nome VARCHAR(100),
especialidade VARCHAR(100),
telefone VARCHAR(20),
PRIMARY KEY(id_veterinario)
);

SELECT * FROM tb_veterinarios;

CREATE TABLE tb_clientes (
id_cliente INT(10) NOT NULL,
nome VARCHAR(100),
endereco VARCHAR(100),
telefone VARCHAR(20),
PRIMARY KEY(id_cliente)
);

SELECT * FROM tb_clientes;

CREATE TABLE tb_pets (
id_pet INT(10) NOT NULL,
nome VARCHAR(100),
tipo VARCHAR(100),
raca VARCHAR(20),
data_nascimento DATE,
id_cliente INT(10) NOT NULL,
PRIMARY KEY(id_pet),
FOREIGN KEY (id_cliente) REFERENCES tb_clientes(id_cliente)
);

SELECT * FROM tb_pets;

CREATE TABLE tb_atendimentos (
id_atendimento INT(10) NOT NULL,
descricao VARCHAR(100),
data_atendimento DATE,
id_pet INT(10) NOT NULL,
id_veterinario INT(10) NOT NULL,
PRIMARY KEY(id_atendimento),
FOREIGN KEY (id_pet) REFERENCES tb_pets(id_pet),
FOREIGN KEY (id_veterinario) REFERENCES tb_veterinarios(id_veterinario)
);

SELECT * FROM tb_atendimentos;
