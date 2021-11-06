CREATE DATABASE algebra;
USE algebra;

CREATE TABLE pintor(
	codp      INT NOT NULL AUTO_INCREMENT,
	nome    VARCHAR(20),
	status  CHAR(1),
	cidade  VARCHAR(20),

	PRIMARY KEY(codp)
);
INSERT INTO pintor(nome, status, cidade) VALUES
('Leonardo da Vinci' ,5,'Anchiano'),
('Edvard Munch'      ,2,'Adalsbruk'),
('Vincent Van Gogh'  ,5,'Zundert'),
('Sandro Botticelli' ,2,'Florença'),
('Pablo Picasso'     ,5,'Málaga'),
('Tarsila do amaral' ,2,'Capivari');


CREATE TABLE quadro(
	codq        INT NOT NULL AUTO_INCREMENT,
	nome      VARCHAR(20),
	cor 	  VARCHAR(20),
	cidade    VARCHAR(20),
	codp INT NOT NULL,
		
	PRIMARY KEY(codq)
);
INSERT INTO quadro(nome, cor, cidade,codp) VALUES
('Mona Lisa'              , 'verde'  , 'paris'    ,1),
('A ultima ceia'          , 'verde'  , 'Milão'    ,1),
('Homem Vitruviano'       , 'verde'  , 'Milão'    ,1),
('O Grito'                , 'amarelo', 'oslo'     ,2),
('A noite estrelada'      , 'azul'   , 'NY'       ,3),
('O Terraço do Café'      , 'amarelo', 'Amsterdã' ,3),
('Os Comedores de Batata' , 'azul'   , 'Amsterdã' ,3),
('O Nascimento de Vênus'  , 'verde'  , 'Florença' ,4),
('Guernica'               , 'azul'   , 'Malaga' ,5),
('A Mulher que Chora'     , 'azul'   , 'Madrid' ,5),
('Mulher no espelho'      , 'azul'   , 'Barcelona' ,5),
('Abaporu'                , 'amarelo', 'Rio de Janeiro' ,6),
('Antropofagia'           , 'amarelo', 'São Paulo' ,6);


 

CREATE TABLE galeria(
	codg      INT NOT NULL AUTO_INCREMENT,
	nome    VARCHAR(20),
	cidade  VARCHAR(20),

	PRIMARY KEY(codg)
);
INSERT INTO galeria (nome, cidade) VALUES
('Museu do Louvre'         					 , 'Paris'),
('Santa Maria delle Grazie'					 , 'Milão'),
('Galeria Nacional'        					 , 'Oslo'),
('Museu de Arte Moderna' 					 , 'NY'),
('Museu Kroller-Muller'    					 , 'Otterlo'),
('Museu Van Gogh'          					 , 'Amsterdã'),
('A Galleria degli Uffizi' 					 , 'Florença'),
('Museu Nacional Centro de Arte Reina Sofia' , 'Madrid'),
('Tate Gallery'                              , 'Londres'),
('Museu de Arte Latinoamericano'      		 , 'Buenos Aires'),
('Fundação José e Paulina Nemirovsky' 		 , 'São Paulo');



CREATE TABLE exposicao(
	id_exposicao           INT NOT NULL AUTO_INCREMENT,
	codg   INT NOT NULL,
	codq    INT NOT NULL,
	codp    INT NOT NULL,
	HorasE       INT NOT NULL,

	FOREIGN KEY(codg) REFERENCES galeria (codg),
	FOREIGN KEY(codq)  REFERENCES quadro  (codq),
	FOREIGN KEY(codp)  REFERENCES pintor  (codp),
	PRIMARY KEY(id_exposicao)
);
INSERT INTO exposicao (codg, codq, codp, HorasE) VALUES
(1,1,1,100),
(2,2,1,200),
(1,3,1,250),
(3,4,2,200),
(4,5,3,100),
(5,6,3,100),
(6,7,3,100),
(7,8,4,150),
(8,9,5,200),
(9,10,5,200),
(4,11,5,200),
(10,12,6,250),
(11,13,6,250);



