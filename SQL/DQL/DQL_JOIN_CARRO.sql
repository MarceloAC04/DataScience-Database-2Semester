USE db_carro;

-- INNER JOIN
SELECT * FROM tb_proprietario AS P
INNER JOIN tb_carro AS C
ON P.id_CarroF = C.id_carro;

SELECT * FROM tb_proprietario AS P
LEFT JOIN tb_carro AS C
ON P.id_CarroF = C.id_carro;