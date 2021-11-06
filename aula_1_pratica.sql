*/comandos mysql

SHOW DATABASES;
CREATE DATABASES aula1; criar database
CREATE DATABASES IF NOT EXISTS aula1; 
USE nome_da_tabela; entra na base de dados
DROP DATABASES nome_da_base; apagar base de dados
SHOW TABLES;    visualizar tavelas
DESC nome_da_tabela; - descreve a tabela
CHAR 
*/
*/
INT - NUMEROS INTEIROS
VARCHAR - 
CHAR - CARACTERE FIXO
FLOAT - NUMEROS COM VIRGULAS
DECIMAL - 
DATE  - PADRAO AMERICANO
*/

CREATE TABLE pessoa(
	id      INT,
	CPF     CHAR(11),
	nome    VARCHAR(60),
	altura  FLOAT,
	salario DECIMAL(10,2), 
	nasc    DATE,
	
	PRIMARY KEY(id)
);	

DROP TABLE pessoa;
DESC pessoa;
ALTER TABLE pessoa ADD sexo CHAR(1);
ALTER TABLE pessoa DROP COLUMN sexo; 
ALTER TABLE pessoa MODIFY altura INT;
ALTER TABLE pessoa CHANGE altura tamanho FLOAT;

*/ IMPORTAR ARQUIVO NO SQL 
SORCE LOCAL DO ARQUIVO HR.SQL
EXPORTAR O BANCO sai do sql 
mysqldump -u root -p nome_da_base_dados > nome.sql
*/

INSERT INTO pessoa VALUES
(1,'12345678901','Emanuel',1.45,1200,99,'1900-01-01');
SELECT * FROM pessoa;
