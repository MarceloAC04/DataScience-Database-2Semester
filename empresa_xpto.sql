CREATE DATABASE empresa_xpto;

use empresa_xpto;

CREATE TABLE clientes(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    preferencias JSON
);

SELECT * FROM clientes;

INSERT INTO clientes (nome, email, preferencias)
VALUES
('Felipe', 'felipe@prof.com', 
'{"interesses": ["livros", "computação"], 
"notificacoes": true
}'),
('Nicole', 'nick@email.com', 
'{"interesses": ["programação", "C#"], 
"notificacoes": false
}');

SELECT nome , email FROM clientes
WHERE JSON_CONTAINS(preferencias ->'$.interesses', '"livros"');

SELECT JSON_VALID('{"interesses": ["livros", "computação"], 
"notificacoes": true
}');

SELECT nome FROM clientes
WHERE JSON_EXTRACT(preferencias -> '$.notificacoes') = false;

SELECT nome, JSON_EXTRACT(preferencias,'$.interesses') as interesses
FROM clientes
WHERE JSON_EXTRACT(preferencias,'$.notificacoes') = false;

SELECT nome, JSON_EXTRACT(preferencias,'$.interesses[0]') as interesses
FROM clientes
WHERE JSON_EXTRACT(preferencias,'$.notificacoes') = false;

SELECT nome, JSON_KEYS(preferencias) FROM clientes;
SELECT JSON_TYPE(preferencias->'$.interesses[0]') FROM clientes;

INSERT INTO clientes (nome, email, preferencias)
VALUES
('Viniccius', 'vini@email.com', 
'{}');

UPDATE clientes SET preferencias = JSON_INSERT(preferencias, '$.premium', true)
 WHERE id=3; -- Criar campo dentro do documento 
 -- JSON_SET( -- Atualiza um campo
 -- JSON_REMOVE(preferencias, '$.premium') -- remove um campo do documento
 SELECT * FROM clientes;
 
 
 -- Remove as Aspas
SELECT nome, 
JSON_UNQUOTE(preferencias ->'$.interesses[0]')as interesses1, 
JSON_UNQUOTE(preferencias ->'$.interesses[1]') as interesses2,
JSON_UNQUOTE(preferencias ->'$.interesses[2]') as interesses3
FROM clientes;

SELECT nome, 
preferencias ->>'$.interesses[0]'as interesses1,
preferencias ->>'$.interesses[1]' as interesses2,
preferencias ->>'$.interesses[2]'  as interesses3
FROM clientes;