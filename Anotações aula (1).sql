--DDL - Data Definition Language

--BASE DE DADOS
SHOW DATABASES;
CREATE DATABASE aula1;
CREATE DATABASE IF NOT EXISTS aula1;
USE nome_da_base;
DROP DATABASE nome_da_base;

/*TIPOS DE DADOS
INT          - inteiros 1,2,3 1000,50896...
VARCHAR(x)   - caractere variavel
FLOAT        - nro com virgula
DECIMAL(x,y) - monetária 
DATE         - Data formato americano
CHAR         - Caractere fixo 
*/
--TABELAS
SHOW TABLES;
CREATE TABLE pessoa(
	id      INT,  
	CPF     CHAR(11),  
	nome    VARCHAR(60),
	altura  FLOAT,
	salario DECIMAL(10,2),
	nasc    DATE,
	
	PRIMARY KEY(id)
);
INSERT INTO pessoa VALUES 
(1,'12546541478','Emmanuel',1.45,1200.99,'1900-01-01');



DROP TABLE pessoa;
DESC pessoa;

ALTER TABLE pessoa ADD sexo CHAR(3);
ALTER TABLE pessoa DROP COLUMN sexo;
ALTER TABLE pessoa MODIFY altura INT;
ALTER TABLE pessoa CHANGE altura tamanho FLOAT;









