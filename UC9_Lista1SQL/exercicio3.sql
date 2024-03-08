CREATE DATABASE empresa;

CREATE TABLE gerente(
id_gerente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_ger VARCHAR(50)
);

ALTER TABLE gerente ADD COLUMN identidade INT;
ALTER TABLE gerente ADD COLUMN enedereco_ger VARCHAR(50);
ALTER TABLE gerente ADD COLUMN aniversario_ger DATE;

CREATE TABLE empregado (
id_emp INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_emp VARCHAR(30) NOT NULL,
aniversario_emp DATE NOT NULL ,
endereco_emp VARCHAR(50) NOT NULL,
sexo_emp VARCHAR(10),
salario_emp DECIMAL (8.2),
nr_dep INT,
FOREIGN KEY (nr_dep) REFERENCES departamento(nr_dep)
);

CREATE TABLE departamento (
nr_dep INT NOT NULL PRIMARY KEY,
nome_dep VARCHAR(30),
id_gerente INT,
horario TIME,
FOREIGN KEY (id_gerente) REFERENCES gerente(id_gerente)
);

CREATE TABLE localizacao(
localizacao VARCHAR(50) NOT NULL,
nr_dep INT,
FOREIGN KEY (nr_dep) REFERENCES departamento(nr_dep)
);

CREATE TABLE trabalha_em (
id_emp INT,
nr_proj INT,
horas TIME,
FOREIGN KEY(id_emp) REFERENCES empregado(id_emp),
FOREIGN KEY(nr_proj) REFERENCES projeto(nr_proj)
);

CREATE TABLE projeto(
nr_proj INT NOT NULL PRIMARY KEY,
nome_proj VARCHAR(50),
nr_dep INT,
FOREIGN KEY(nr_dep) REFERENCES departamento(nr_dep)
);

CREATE TABLE dependente(
id_depende INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_emp INT,
nome_dep VARCHAR(50),
sexo_dep VARCHAR(10),
aniversario_dep DATE,
parentesco VARCHAR(20),
FOREIGN KEY(id_emp) REFERENCES empregado(id_emp)
);


-- Inserindo dados na tabela 'gerente'
INSERT INTO gerente (nome_ger, identidade, enedereco_ger, aniversario_ger) 
VALUES ('Carlos', 123456789, 'Rua A, 123', '1980-05-15'),
       ('Ana', 987654321, 'Rua B, 456', '1975-10-20'),
       ('Mariana', 456789123, 'Rua C, 789', '1990-03-25'),
       ('Pedro', 789123456, 'Rua D, 321', '1988-07-10'),
       ('Isabela', 654321987, 'Rua E, 654', '1983-12-03'),
       ('Lucas', 321654987, 'Rua F, 987', '1978-09-17'),
       ('Camila', 159753468, 'Rua G, 321', '1995-02-28'),
       ('Fernando', 753159852, 'Rua H, 654', '1986-11-09'),
       ('Juliana', 852369741, 'Rua I, 987', '1992-08-14'),
       ('Ricardo', 369852147, 'Rua J, 654', '1970-04-05');

-- Inserindo dados na tabela 'empregado'
INSERT INTO empregado (nome_emp, aniversario_emp, endereco_emp, sexo_emp, salario_emp, nr_dep)
VALUES ('João', '1982-08-10', 'Rua X, 123', 'M', 5000, 1),
       ('Maria', '1990-06-20', 'Rua Y, 456', 'F', 4000, 2),
       ('Pedro', '1985-03-15', 'Rua Z, 789', 'M', 4500, 3),
       ('Ana', '1988-11-25', 'Rua W, 321', 'F', 4800, 4),
       ('Fernanda', '1993-09-30', 'Rua V, 654', 'F', 4300, 5),
       ('Gustavo', '1976-07-12', 'Rua U, 987', 'M', 5500, 6),
       ('Carla', '1983-02-28', 'Rua T, 123', 'F', 4200, 7),
       ('Marcos', '1979-05-10', 'Rua S, 456', 'M', 5100, 8),
       ('Luciana', '1991-08-14', 'Rua R, 789', 'F', 4700, 9),
       ('Rodrigo', '1980-12-05', 'Rua Q, 321', 'M', 4900, 10);

-- Inserindo dados na tabela 'departamento'
INSERT INTO departamento (nr_dep, nome_dep, id_gerente, horario)
VALUES (1, 'Compras', 1, '08:00:00'),
       (2, 'Vendas', 2, '09:00:00'),
       (3, 'RH', 3, '08:30:00'),
       (4, 'Financeiro', 4, '09:30:00'),
       (5, 'Marketing', 5, '08:00:00'),
       (6, 'TI', 6, '09:00:00'),
       (7, 'Logística', 7, '08:30:00'),
       (8, 'Produção', 8, '09:30:00'),
       (9, 'Qualidade', 9, '08:00:00'),
       (10, 'Jurídico', 10, '09:00:00');

-- Inserindo dados na tabela 'localizacao'
INSERT INTO localizacao (localizacao, nr_dep)
VALUES ('Rio de Janeiro', 1),
       ('São Paulo', 2),
       ('Belo Horizonte', 3),
       ('Brasília', 4),
       ('Curitiba', 5),
       ('Porto Alegre', 6),
       ('Recife', 7),
       ('Salvador', 8),
       ('Fortaleza', 9),
       ('Manaus', 10);

-- Inserindo dados na tabela 'trabalha_em'
INSERT INTO trabalha_em (id_emp, nr_proj, horas)
VALUES (11, 1, '40:00:00'),
       (12, 2, '35:00:00'),
       (13, 3, '38:00:00'),
       (14, 4, '42:00:00'),
       (15, 5, '37:00:00'),
       (16, 6, '40:00:00'),
       (17, 7, '36:00:00'),
       (18, 8, '39:00:00'),
       (19, 9, '40:00:00'),
       (20, 10, '35:00:00');

-- Inserindo dados na tabela 'projeto'
INSERT INTO projeto (nr_proj, nome_proj, nr_dep)
VALUES (1, 'Projeto A', 1),
       (2, 'Projeto B', 2),
       (3, 'Projeto C', 3),
       (4, 'Projeto D', 4),
       (5, 'Projeto E', 5),
       (6, 'Projeto F', 6),
       (7, 'Projeto G', 7),
       (8, 'Projeto H', 8),
       (9, 'Projeto I', 9),
       (10, 'Projeto J', 10);

-- Inserindo dados na tabela 'dependente'
INSERT INTO dependente (id_emp, nome_dep, sexo_dep, aniversario_dep, parentesco)
VALUES (11, 'Ana', 'F', '2005-03-10', 'Filha'),
       (12, 'Pedro Jr', 'M', '2010-07-15', 'Filho'),
       (13, 'Mariana', 'F', '2008-01-20', 'Filha'),
       (14, 'Lucas', 'M', '2012-09-25', 'Filho'),
       (15, 'Laura', 'F', '2009-11-30', 'Filha'),
       (16, 'Rafael', 'M', '2015-06-12', 'Filho'),
       (17, 'Sophia', 'F', '2018-02-28', 'Filha'),
       (18, 'Mateus', 'M', '2016-05-10', 'Filho'),
       (19, 'Júlia', 'F', '2013-08-14', 'Filha'),
       (20, 'Gabriel', 'M', '2014-12-05', 'Filho');


-- 1. Recuperar o nome e o endereço de todos os empregados que trabalham para o departamento de Compras.
SELECT nome_emp, endereco_emp FROM empregado INNER JOIN departamento
ON empregado.nr_dep = departamento.nr_dep
WHERE nome_dep = 'Compras';

-- 2. Para cada projeto localizado no ‘Rio de Janeiro’, exibir o número do projeto, o número do departamento 
-- que o controla e a identidade de seu gerente, seu endereço e a data de seu aniversário.
SELECT projeto.nr_proj, departamento.nr_dep, gerente.nome_ger, gerente.identidade, gerente.enedereco_ger, gerente.aniversario_ger 
FROM projeto INNER JOIN localizacao ON projeto.nr_dep = localizacao.nr_dep
INNER JOIN departamento ON projeto.nr_dep = departamento.nr_dep
INNER JOIN gerente ON gerente.id_gerente = departamento.id_gerente
WHERE localizacao = 'Rio de Janeiro';


-- 3. Descobrir os nomes dos projetos onde trabalham empregados com o nome ‘João’.
SELECT empregado.nome_emp, projeto.nome_proj FROM empregado INNER JOIN trabalha_em
ON empregado.id_emp = trabalha_em.id_emp
INNER JOIN projeto ON trabalha_em.nr_proj = projeto.nr_proj
WHERE nome_emp = 'João';

