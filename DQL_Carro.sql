USE db_carro;

SELECT * from tb_carro;
SELECT modelo, cor from tb_carro;

SELECT * FROM tb_carro WHERE cor = 'branco';
SELECT * FROM tb_carro WHERE modelo = 'M3';

SELECT min(valor) FROM tb_carro;
SELECT max(valor) FROM tb_carro;

SELECT max(ano) FROM tb_carro;

SELECT COUNT(id_carro) FROM tb_carro;

SELECT SUM(valor) FROM tb_carro;

SELECT * FROM tb_carro ORDER BY modelo ASC;
SELECT * FROM tb_carro ORDER BY marca DESC;

SELECT marca, COUNT(id_carro) AS 'Total Registros' FROM tb_carro 
WHERE ano BETWEEN '1999' AND '2007' 
GROUP BY Marca;

SELECT marca, COUNT(id_carro) AS 'Total Registros' FROM tb_carro 
WHERE ano like '2007' 
GROUP BY Marca;