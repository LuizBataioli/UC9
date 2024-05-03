CREATE DATABASE Turma_TDS231N;

USE Turma_TDS231N;

CREATE TABLE Pessoa (
idPessoa INT AUTO_INCREMENT PRIMARY KEY,
Nome VARCHAR(100),
Salario DOUBLE(10,2),
DataNascimento DATE,
Sexo CHAR(1)
)ENGINE = INNODB;

INSERT INTO Pessoa (Nome, Salario, DataNascimento, Sexo) VALUES
('Maria', 2500.00, '1990-03-15', 'F'),
('João', 3000.50, '1985-08-20', 'M'),
('Ana', 3200.75, '1978-12-10', 'F'),
('Pedro', 2800.00, '1995-05-25', 'M'),
('Carla', 2700.80, '1982-09-30', 'F'),
('Lucas', 3500.25, '1992-11-18', 'M'),
('Juliana', 2900.50, '1987-04-05', 'F'),
('Rafael', 3100.00, '1980-07-12', 'M'),
('Patrícia', 2600.75, '1998-02-28', 'F'),
('Fernando', 3300.80, '1975-10-22', 'M');