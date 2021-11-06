/*
DML - Data Manipulation Language
INSERT
UPDATE
DELETE

DICA: COnfiguração padrão SQL no windows
SET @@SESSION.sql_mode ='TRADITIONAL';
*/



CREATE DATABASE teste;
USE teste;

DROP TABLE usuario;
CREATE TABLE usuario (
	id    INT AUTO_INCREMENT,
	email VARCHAR(80) NOT NULL,
	senha VARCHAR(10) NOT NULL,

	PRIMARY KEY (id)
);

--INSERT COMUM
INSERT INTO usuario (email,senha) VALUES ('a@a.com','123');
INSERT INTO usuario (email,senha) VALUES ('b@b.com','123');
INSERT INTO usuario (email,senha) VALUES ('c@c.com','123');
INSERT INTO usuario (email,senha) VALUES ('d@d.com','123');


--INSERT MAIS DE UMA LINHA
INSERT INTO usuario (email,senha) VALUES
('a@a.com','123'),
('b@b.com', '123'),
('c@c.com','123'),
('d@d.com','123');



--Sugestões ELISEO
INSERT INTO usuario(id) (SELECT MAX(ID)+1 FROM USUARIO);

ALTER TABLE usuario MODIFY id INT AUTO_INCREMENT;



--UPDATE
UPDATE usuario SET	
	email='c@c.com',
	senha='123456'
WHERE id=2;


--DELETE
DELETE FROM usuario
WHERE senha='123';


/*
RESTRIÇÔES
Chave Primária
NOT NULL
UNIQUE
CHECK
DEFAULT

Chave estrangeira ou secundária? :)
*/

CREATE TABLE cliente(
	id      INT AUTO_INCREMENT,
	nome    VARCHAR(60)   NOT NULL,
	cpf     CHAR(11)      NOT NULL,
	email   VARCHAR(60)   NOT NULL,
	senha   VARCHAR(8)    NOT NULL,
	nasc    DATE          NOT NULL DEFAULT '1900-01-01',
	salario DECIMAL(10,2) NOT NULL,
	
	
	PRIMARY KEY(id),
	UNIQUE (CPF),
	UNIQUE (email),
	CHECK  (LENGTH(nome)>=3),
	CHECK  (LENGTH(email)>=10)
);

INSERT INTO cliente (nome,cpf,email,senha,nasc,salario) VALUES
('Stefano','88','Stefano@Stefano.com','123456','1976-08-03','68587.48' );



CREATE TABLE dependente(
	id          INT AUTO_INCREMENT,
	nome        VARCHAR(60),
	email       VARCHAR(60),	
	id_cliente  INT,

	PRIMARY KEY (id),
	FOREIGN KEY (id_cliente) REFERENCES cliente(id),
	UNIQUE (email)
);

INSERT INTO dependente (nome,email,id_cliente) VALUES
('Lucas','lucas@lucas.com',5);



/*
======================================
EXERCICIO
======================================
CRIAR AS TABELAS 
	LIVRO (id, nome, ISBN, data_publicacao)
	AUTOR (id, nome)
	AUTOR_LIVRO (id,id_livro,id_autor)
INSERIR 5 linhas em cada uma.	

*/

CREATE TABLE livro(
	id   INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	ISBN VARCHAR(12) NOT NULL,
	pub  DATE        NOT NULL,
	
	PRIMARY KEY(id),
	UNIQUE(isbn)
);
INSERT INTO livro (nome,isbn,pub) VALUES
('livro 1', '123','2021-03-03'),
('livro 2', '1234','2020-03-03'),
('livro 3', '12345','2022-03-03');

CREATE TABLE autor(
	id   INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,

	PRIMARY KEY(id)
);
INSERT INTO autor (nome) VALUES
('autor1'),
('autor2'),
('autor3');

CREATE TABLE autor_livro(
	id   INT AUTO_INCREMENT,
	id_autor INT,
	id_livro INT,

	PRIMARY KEY(id),
	UNIQUE (id_autor,id_livro),
	FOREIGN KEY(id_autor) REFERENCES autor(id),
	FOREIGN KEY(id_livro) REFERENCES livro(id)
);

INSERT INTO autor_livro(id_autor,id_livro) VALUES
(1,3),
(2,1),
(1,1),
(2,2);

UPDATE livro SET
	nome='abc',
	isbn=isbn,
	pub=pub
WHERE id=1;











