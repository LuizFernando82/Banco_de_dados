*/ aula DML
INSERT
UPDATE
DELETE

*/


CREATE DATABASE teste;
USE teste;
CREATE TABLE usuario (
	id    INT AUTO_INCREMENT,
	email VARCHAR(80) NOT NULL,
	senha VARCHAR(10) NOT NULL,
	

	PRIMARY KEY(id)

);
INSERT INTO usuario (id,email,senha) VALUES (1,'a@a.com','123');
SELECT * FROM usuario;
INSERT INTO usuario (email,senha) VALUES ('b@b.com','123');
INSERT INTO usuario (email,senha) VALUES ('c@c.com','123');

-- update

UPDATE usuario SET 
	email='a@a.com',
	senha='646456'
WHERE id=1;

--DELETE
DELETE FROM usuario
WHERE email='r@r.com';

DELETE FROM usuario
WHERE senha='123';

/*
RESTRIÇÕES
CHAVE PRIMARIA
UNIQUECHECK


CHAVE ESTRANGEIRA 
*/

CREATE TABLE cliente(
	id       INT AUTO_INCREMENT,
	nome     VARCHAR(60) NOT NULL,
	cpf      CHAR(11)    NOT NULL,
	email    VARCHAR(60) NOT NULL,
	senha 	 VARCHAR(8)  NOT NULL,
	nasc     DATE        NOT NULL DEFAULT '1900-01-01',
	salario  DECIMAL(10,2) NOT NULL,
	
	PRIMARY KEY(id),
	UNIQUE (cpf),
	UNIQUE (email)
	CHECK  (LENGTH (nome)>=3),
	CHECK  (LENGTH (nome)>=10)
);
INSERT INTO cliente VALUES (
'eliseu','12384639273',eliseu@eliseu.com','12345678','1987-09-02','679838.47');



(



);

(
'eliseu','12384639273',eliseu@eliseu.com','12345678','1987-09-02','679838.47'); CREATE TABLE depende

CREATE TABLE dependente(

	id 		INT AUTO_INCREMENT,
	nome 	VARCHAR(60),
	email 	VARCHAR(60)
	id_cliente INT,
	CREATE TABLE dependente(

	id 		INT AUTO_INCREMENT,
	nome 	VARCHAR(60),
	email 	VARCHAR(60)
	id_cliente INT,
	
);

CREATE TABLE livro(
	id INT AUTO_INCREMENT,
	nome VARCHAR(60),
	isbn INT,
	pub DATE,
	
	PRIMARY KEY (id),
	UNIQUE (isbn)
);
CREATE TABLE autor(
	id INT AUTO_INCREMENT,
	nome VARCHAR(60),
	
	
	PRIMARY KEY (id)
);

CREATE TABLE autor_livro(
	
	id INT AUTO_INCREMENT,
	id_livro INT,
	id_autor INT,
	
	PRIMARY KEY (id),
	UNIQUE (id_autor,id_livro),
	FOREIGN KEY (id_autor) REFERENCES autor(id),
	FOREIGN KEY (id_livro) REFERENCES livro(id)


);

INSERT INTO livro (nome,isbn,pub) VALUES ('livro','1','1970-02-23');
INSERT INTO livro (nome,isbn,pub) VALUES ('livro2','2','1980-05-20');
INSERT INTO livro (nome,isbn,pub) VALUES ('livro3','3','1990-06-12');

INSERT INTO autor (nome) VALUES ('leandro_karnal');
INSERT INTO autor (nome) VALUES ('joão_carlos');
INSERT INTO autor (nome) VALUES ('maria_jose');