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
