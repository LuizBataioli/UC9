CREATE DATABASE loja;

CREATE TABLE vendedor(
nrvendedor INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
nomevendedor VARCHAR(30),
idade TINYINT,
salario DECIMAL(6,2) 
);

CREATE TABLE cliente(
nrcliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nomecliente VARCHAR(30),
cidade VARCHAR (50),
tipo VARCHAR(50)
);

CREATE TABLE pedido(
nr_pedido INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nrvendedor INT, 
nrcliente INT NOT NULL,
quantidade_itens INT NOT NULL,
valor_total DECIMAL(6,2) NOT NULL,
FOREIGN KEY (nrvendedor) REFERENCES vendedor(nrvendedor),
FOREIGN KEY (nrcliente) REFERENCES cliente(nrcliente)
);

-- Preencher a tabela vendedor com 10 itens
INSERT INTO vendedor (nomevendedor, idade, salario) VALUES
('João', 35, 2500.00),
('Maria', 28, 2200.00),
('Carlos', 40, 2800.00),
('Ana', 33, 2600.00),
('Pedro', 45, 3000.00),
('Mariana', 29, 2300.00),
('Paulo', 38, 2700.00),
('Fernanda', 31, 2400.00),
('Lucas', 42, 3200.00),
('Juliana', 27, 2100.00);

-- Preencher a tabela cliente com 10 itens
INSERT INTO cliente (nomecliente, cidade, tipo) VALUES
('Sthil', 'São Paulo', 'Industria'),
('Ambev', 'Rio de Janeiro', 'Industria'),
('Sony', 'Belo Horizonte', 'Empresa'),
('Microsoft', 'Porto Alegre', 'Empresa'),
('Lenovo', 'Brasília', 'Empresa'),
('Aurelio', 'Salvador', 'Pessoa Física'),
('Pedro', 'Curitiba', 'Pessoa Física'),
('Felype', 'Recife', 'Pessoa Física'),
('Marecelo', 'Fortaleza', 'Pessoa Física'),
('Augusto', 'Manaus', 'Pessoa Física');

-- Preencher a tabela pedido com 10 itens
INSERT INTO pedido (nrvendedor, nrcliente, quantidade_itens, valor_total) VALUES
(1, 1, 5, 5500.00),
(2, 2, 8, 2000.00),
(3, 3, 3, 900.00),
(4, 4, 6, 1800.00),
(5, 5, 4, 1200.00),
(6, 6, 2, 5300.00);

SELECT nomevendedor FROM vendedor;

SELECT nrvendedor FROM pedido;

SELECT * FROM vendedor LEFT JOIN pedido 
ON vendedor.nrvendedor = pedido.nrvendedor
WHERE nr_pedido IS NULL;

SELECT * FROM cliente INNER JOIN pedido ON cliente.nrcliente = pedido.nrcliente
INNER JOIN vendedor ON pedido.nrvendedor = vendedor.nrvendedor
WHERE cliente.tipo = 'Industria';

SELECT * FROM cliente INNER JOIN pedido ON cliente.nrcliente = pedido.nrcliente
INNER JOIN vendedor ON pedido.nrvendedor = vendedor.nrvendedor
WHERE vendedor.nomevendedor = "João";

SELECT * FROM cliente INNER JOIN pedido 
ON cliente.nrcliente = pedido.nrcliente
WHERE valor_total > 5000;
