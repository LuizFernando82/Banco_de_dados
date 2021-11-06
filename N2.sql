DROP DATABASE IF EXISTS luiz_fernando_silveira_da_silva;
CREATE DATABASE luiz_fernando_silveira_da_silva;
USE luiz_fernando_silveira_da_silva;

DROP TABLE IF EXISTS local_edição;
CREATE TABLE local_edição(
	id     INT AUTO_INCREMENT,
	uf     CHAR(2)     NOT NULL,
	cidade VARCHAR(30) NOT NULL,
	rua    VARCHAR(60) NOT NULL,
	
	PRIMARY KEY (id)	
);

INSERT INTO local_edição (uf,cidade,rua) VALUES
('rj','rio_de_janeiro','ouvidor'),
('rs','porto_alegre','borges_de_medeiros'),
('es','vitoria','dante_micheline'),
('sp','são_paulo','paulista'),
('sp','são_paulo','imigrantes'),
('sp','campinas','getulio_vargas');

DROP TABLE IF EXISTS editora;
CREATE TABLE editora(
	id     INT AUTO_INCREMENT,
	cnpj   CHAR(14)    NOT NULL,
	nome   VARCHAR(60) NOT NULL,
	id_edi INT         NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_edi) REFERENCES local_edição (id),
	UNIQUE (cnpj)
);

INSERT INTO editora (cnpj,nome,id_edi) VALUES
('23615820001092','monte_cristo','1'),
('4648488000187','l&pm','2'),
('4638488000163','recordes','3'),
('4648488000188','martin_claret','4'),
('6748488000187','lisboa','5'),
('7848488000190','iluminuras','6');

DROP TABLE IF EXISTS livro;
CREATE TABLE livro(
	id       INT AUTO_INCREMENT,
	titulo   VARCHAR(60) NOT NULL,
	isbn     INT         NOT NULL,
		
	PRIMARY KEY (id)
);

INSERT INTO livro (titulo,isbn) VALUES
('dom_quixote_de_la_mancha','16'),
('o_processo','2','kafka'),
('cem_anos_de_solidão','98456'),
('o_senhor_dos_aneis','19256',),
('por_quem_os_sinos_dobram','63756'),
('hamlet','34456');

DROP TABLE IF EXISTS keywords;
CREATE TABLE livro(
	id          INT AUTO_INCREMENT,
	chave_1     VARCHAR(60) NOT NULL,
	chave_2     VARCHAR(60) NOT NULL,
	chave_3     VARCHAR(60) NOT NULL,	
	id_livro_1  INT         NOT NULL,
	
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_livro_1) REFERENCES livro (id)
);

INSERT INTO keywords(chave_1,chave_2,chave_3,id_livro_1) VALUES
('sancho','livro_romantico','classico','1'),
('kafka','livro_direito','liberdade','2'),
('nobel','realismo','solidão','3'),
('magia','anéis','elfos','4'),
('romance','americano','heminway','5'),
('shakespere','livro_ingles','ofelia','6');

DROP TABLE IF EXISTS exemplares;
CREATE TABLE exemplares(
	id       INT AUTO_INCREMENT,
	id_livro INT,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_livro) REFERENCES livro (id)
);

INSERT INTO exemplares (id_livro) VALUES
('1'),
('3'),
('5'),
('3'),
('6'),
('4'),
('2'),
('1');

DROP TABLE IF EXISTS autor;
CREATE TABLE autor(
	id       INT AUTO_INCREMENT,
	nome     VARCHAR(60) NOT NULL,
	
	PRIMARY KEY (id)
);

INSERT INTO autor (nome) VALUES
('JORGE_AMADO'),
('MACHADO_DE_ASSIS'),
('WILLIAM_SHAKESPEARE'),
('ERNEST_HEMINGWAY'),
('JOSÉ_SARAMAGO'),
('J.R.R_TOLKIEN'),
('GABRIEL_GARCIA_MARQUES'),
('FRANZ_KAFKA'),
('MIGUEL_CERVANTES');

DROP TABLE IF EXISTS associados;
CREATE TABLE associados(
	id       INT AUTO_INCREMENT,
	nome     VARCHAR(60) NOT NULL,
	rua      VARCHAR(60) NOT NULL,
	num      INT         NOT NULL,
	cidade   VARCHAR(60) NOT NULL,
	
	PRIMARY KEY (id)
);

INSERT INTO associados (nome,rua,num,cidade) VALUES
('abidal','marechal_floriano','359','porto_alegre'),
('jose','borges_de_medeiros','1245','porto_alegre'),
('maria','dona_alzira','695','porto_alegre'),
('ana','getulio_vargas','4752','alvorada'),
('valquira','mariante','76','porto_alegre'),
('william','joão_alberto','45','porto_alegre'),
('roberval','protassio_alves','1359','porto_alegre'),
('sarafim','santos_dumom','103','canoas');

DROP TABLE IF EXISTS editora_livro;
CREATE TABLE editora_livro(
	id         INT AUTO_INCREMENT,
	id_livro   INT NOT NULL,
	id_editora INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_livro)   REFERENCES livro (id),
	FOREIGN KEY (id_editora) REFERENCES editora (id)
);

INSERT INTO editora_livro (id_livro,id_editora) VALUES
('1','3'),
('2','2'),
('3','1'),
('4','6'),
('5','4'),
('6','5');

DROP TABLE IF EXISTS livro_autor;
CREATE TABLE livro_autor(
	id       INT AUTO_INCREMENT,
	id_liv   INT NOT NULL,
	id_autor INT NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_liv)   REFERENCES livro (id),
	FOREIGN KEY (id_autor) REFERENCES autor (id)
	
);

INSERT INTO livro_autor (id_liv,id_autor) VALUES
('1','9'),
('2','8'),
('3','7'),
('4','6'),
('5','4'),
('6','3');

DROP TABLE IF EXISTS retirada_livro;
CREATE TABLE retirada_livro(
	id       INT  AUTO_INCREMENT,
	id_exp   INT NOT NULL,
	id_ass   INT NOT NULL,
	retirada DATE NOT NULL,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_ass) REFERENCES associados (id),
	FOREIGN KEY (id_exp) REFERENCES exemplares (id)	
	
);

INSERT INTO retirada_livro (id_exp,id_ass,retirada) VALUES
('2','5','2021-06-02'),
('1','3','2021-05-22'),
('3','1','2021-06-10'),
('5','6','2021-05-12'),
('4','4','2021-06-05');

SELECT * FROM local_edição
WHERE id=4;

SELECT * FROM editora
WHERE id=6;

SELECT * FROM autor
WHERE id=2;

SELECT * FROM livro
WHERE id=4;

SELECT * FROM exemplares
WHERE id=4;

SELECT * FROM associados
WHERE id=3;

SELECT * FROM editora_livro
WHERE id=1;

SELECT * FROM retirada_livro
WHERE id=5;

SELECT * FROM livro_autor
WHERE id=1;

DELETE FROM keywords
WHERE id=6;

DELETE FROM editora_livro
WHERE id=6;

DELETE FROM livro_autor
WHERE id=6;

DELETE FROM retirada_livro
WHERE id=4;

DELETE FROM exemplares
WHERE id=5;

DELETE FROM livro
WHERE id=6;


SELECT * FROM editora
WHERE id=5;

UPDATE editora SET
	cnpj='23723438000102',
	nome='abril'
WHERE id=5;



