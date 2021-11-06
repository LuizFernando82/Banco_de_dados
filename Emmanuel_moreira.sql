DROP DATABASE IF EXISTS locadora;
CREATE DATABASE IF NOT EXISTS locadora;
USE locadora;

DROP TABLE IF EXISTS categoria;
CREATE TABLE IF NOT EXISTS categoria (
	id   INT AUTO_INCREMENT,
	nome VARCHAR(30) NOT NULL,
	
	PRIMARY KEY (id)
);
INSERT INTO categoria (nome) VALUES 
('drama'),
('policial'),
('ação'),
('suspense'),
('comedia');


DROP TABLE IF EXISTS filme;
CREATE TABLE IF NOT EXISTS filme (
	id      INT AUTO_INCREMENT,
	ano     DATE        NOT NULL,
	titulo  VARCHAR(60) NOT NULL,
	diretor VARCHAR(60) NOT NULL,
	
	id_cat  INT         NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_cat) REFERENCES categoria(id)
);

INSERT INTO filme (ano,titulo,diretor,id_cat)VALUES 
('1995-02-05', 'Um Sonho de Liberdade','Frank Darabont',1),
('2019-12-01', 'Milagre na cela 7'    ,'Mehmet Ada Öztekin',2),
('2000-12-01', 'A Espera de um Milagre','Frank Darabont',1),
('1995-05-05', 'os Suspeitos','Bryan Singer',2),
('1984-01-01', 'Loucademia de Policia','Marroni',5 );




DROP TABLE IF EXISTS ator;
CREATE TABLE IF NOT EXISTS ator (
	id      INT AUTO_INCREMENT,
	nome    VARCHAR(60) NOT NULL,
	estrela CHAR(1)     NOT NULL COMMENT 's=estrela n=não é estrela',
	
	PRIMARY KEY (id)
	
);

INSERT INTO ator (nome, estrela) VALUES
('Kevin Spacey','s'),
('Gabriel Byrne','n'),
('Pete Postlethwaitea','n'),
('Morgan Freeman','s'),
('Tim Robbins','s'),
('Bob Gunton','n'),
('Michael Clarke Duncan','n'),
('Tom Hanks','s'),
('Sam Rockwell','n'),
('Steve Guttenberg','s'),
('David Graf','n'),
('Aras Bulut İynemli','s'),
('Nisa Sofiya Aksongur','n');



CREATE TABLE ator_filme(
	id INT AUTO_INCREMENT,
	id_filme INT NOT NULL,
	id_ator  INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_filme) REFERENCES filme(id),
	FOREIGN KEY (id_ator) REFERENCES ator(id),
	UNIQUE (id_filme,id_ator)
);
INSERT INTO ator_filme (id_filme, id_ator) VALUES
(1,5),
(1,6),
(1,4),
(2,12),
(2,13),
(3,7),
(3,8),
(3,9),
(4,1),
(4,2),
(4,3),
(5,10),
(5,11);

SELECT 
	filme.titulo AS "Titulo",
	ator.nome    AS "Ator"  
FROM ator_filme 
JOIN filme ON (ator_filme.id_filme=filme.id)
JOIN ator  ON (ator_filme.id_ator=ator.id)



CREATE TABLE dvd (
	id       INT AUTO_INCREMENT,
	id_filme INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_filme) REFERENCES filme(id)
);
INSERT INTO DVD (id_filme) VALUES
('5'),
('4'),
('3'),
('2'),
('1'),
('5'),
('4'),
('3'),
('4'),
('3'),
('2'),
('1'),
('5');
CREATE TABLE cliente (
	id INT AUTO_INCREMENT,
	nome VARCHAR(60) ,
	CPF CHAR(11),
	tel CHAR(11),
	
	PRIMARY KEY (id),
	UNIQUE(CPF),
	UNIQUE(tel),
	CHECK (LENGTH(nome)>3)
);
INSERT INTO cliente (nome,cpf,tel) VALUES
('Vargas','12345874211','51998745123'),
('William','33345874211','51988745155'),
('Stefano','44445994258','51995745258'),
('Jonatas','66645874254','51993745877');

CREATE TABLE cliente_dvd(
	id INT AUTO_INCREMENT,
	
	id_cli  INT NOT NULL,
	id_dvd  INT NOT NULL,
	locacao DATE,
	
	PRIMARY KEY(id)
);
INSERT INTO cliente_DVD (id_dvd,id_cli,locacao) VALUES
(1,4,'2021-01-06'),
(2,4,'2021-01-06'),
(1,1,'2020-12-25'),
(2,1,'2020-12-25'),
(3,3,'2020-11-02'),
(4,2,'2020-10-12');

SELECT
	cliente.nome,	
	cliente_DVD.locacao,
	dvd.id
FROM cliente_DVD
JOIN cliente ON (cliente_DVD.id_cli=cliente.id)
JOIN dvd     ON (cliente_DVD.id_dvd=dvd.id)






