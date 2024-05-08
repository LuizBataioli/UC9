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


CREATE TABLE tarefas (
idTarefa INT AUTO_INCREMENT PRIMARY KEY,
tarefa VARCHAR(200),
dataCriacao DATE,
dataConclusao DATE,
dataVencimento DATE,
prioridade VARCHAR(15),
statuss VARCHAR(20),
notas VARCHAR(1000)
);

INSERT INTO tarefas (tarefa, dataCriacao, dataConclusao, dataVencimento, prioridade, statuss, notas) VALUES
('Fazer compras', '2024-05-07', NULL, '2024-05-10', 'Alta', 'Pendente', 'Comprar leite, pão e ovos'),
('Estudar para o exame', '2024-05-06', NULL, '2024-05-15', 'Média', 'Pendente', 'Revisar capítulos 5 a 10'),
('Enviar relatório', '2024-05-05', NULL, '2024-05-08', 'Alta', 'Pendente', 'Relatório do trimestre'),
('Marcar reunião', '2024-05-04', NULL, '2024-05-09', 'Baixa', 'Pendente', 'Com equipe de projeto'),
('Consertar o vazamento', '2024-05-03', NULL, '2024-05-12', 'Alta', 'Pendente', 'Chamar encanador');

INSERT INTO tarefas (tarefa, dataCriacao, dataConclusao, dataVencimento, prioridade, statuss, notas) VALUES
('Teste inserçôes', '2024-05-07', '2024-05-08', '2024-05-10', 'Alta', 'Concluida', 'teste teste teste');