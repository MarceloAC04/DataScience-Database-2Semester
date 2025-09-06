CREATE DATABASE eventos;

USE eventos;

-- 1- Crie a Tabela para armazenar os dados no MySQL.
CREATE TABLE evento(
id INT AUTO_INCREMENT UNIQUE,
titulo VARCHAR(100),
categoria VARCHAR(100),
detalhes JSON,
inscricoes JSON
);

-- 2- Adicione pelo menos 5 registros com os campos JSON preenchidos na tabela (Veja o exemplo acima).
INSERT INTO evento(titulo, categoria, detalhes, inscricoes)
VALUES
('Workshop de Python', 'Programação',
'{"local":"Sala 101","data":"2025-09-10","palestrantes":["Ana Silva","Carlos Souza"]}',
'[{"nome":"Felipe","email":"felipe@email.com","presente":true},
{"nome":"Maria","email":"maria@email.com","presente":false}]'),

('Workshop de Propaganda', 'Marketing',
'{"local":"Sala 67","data":"2025-09-15","palestrantes":["Ana Paula","Roberto Souza"]}',
'[{"nome":"Laura","email":"laura@email.com","presente":false},
{"nome":"João","email":"joao@email.com","presente":true}]'),

('Design de Capa de Álbuns', 'Design',
'{"local":"Sala 202","data":"2025-09-25","palestrantes":["Freddie Mercury","Brian May"]}',
'[{"nome":"Ana","email":"ana@email.com","presente":true},
{"nome":"Pedro","email":"pedro@email.com","presente":false}]'),

('História do Desenvolvimento Web', 'Programação',
'{"local":"303","data":"2025-12-01","palestrantes":["Robert Plant","Jimmy Page"]}',
'[{"nome":"Carla","email":"carla@email.com","presente":true},
{"nome":"Thiago","email":"thiago@email.com","presente":false}]'),

('Gerenciamento de Projetos', 'Marketing',
'{"local":"Auditório Central","data":"2025-10-20","palestrantes":["James Hetfield","Lars Ulrich"]}',
'[{"nome":"Rafael","email":"rafael@email.com","presente":true},
{"nome":"Marina","email":"marina@email.com","presente":true}]');


-- 3- Faça as queries:
-- a - Liste todos os eventos que têm um palestrante específico pelo nome (detalhes).
SELECT titulo, categoria, JSON_EXTRACT(detalhes, '$.palestrantes') as Palestrantes FROM evento WHERE JSON_CONTAINS(detalhes ->'$.palestrantes', '"Jimmy Page"');

-- b - Liste os participantes presentes de cada evento (inscricoes).
SELECT titulo, categoria, JSON_EXTRACT(detalhes, '$.palestrantes') AS Palestrantes,
JSON_EXTRACT(inscricoes, '$[*].nome') AS inscritos FROM evento;

-- c - Mostre o local e o nome do primeiro palestrante de cada evento.
SELECT titulo, categoria, JSON_EXTRACT(detalhes, '$.local') AS Local,
JSON_EXTRACT(detalhes, '$.palestrantes[0]') AS Palestrantes FROM evento;

-- d - Selecione eventos com participantes que ainda não estiveram presentes (presente = false).
SELECT titulo, categoria, JSON_EXTRACT(detalhes, '$.local') AS Local,
JSON_EXTRACT(detalhes, '$.palestrantes') AS Palestrantes FROM evento
WHERE JSON_CONTAINS(inscricoes ->'$[*].presente', 'false');