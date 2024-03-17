CREATE DATABASE professor;

CREATE TABLE professores(
id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cpf VARCHAR(15),
nome_professor VARCHAR(50),
data_nasc_prof DATE,
titulacao VARCHAR(30),
telefone VARCHAR(11)
); 

CREATE TABLE alunos(
id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_aluno VARCHAR(50),
endereco VARCHAR(100),
telefone VARCHAR(11),
data_nasc_aluno DATE,
altura DECIMAL(4,2),
peso DECIMAL(5,2)
);

CREATE TABLE matriculas(
id_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_aluno INT,
data_matricula DATE,
ausencias INT,
FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE turmas(
id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantidade_alunos INT, 
horario_aula TIME,
duracao_aula TIME,
data_inicial DATE,
data_final DATE,
tipo_curso VARCHAR(30),
aluno_monitor INT,
id_professor INT,
id_matricula INT,
FOREIGN KEY (aluno_monitor) REFERENCES alunos(id_aluno),
FOREIGN KEY (id_professor) REFERENCES professores(id_professor),
FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);



-- Populando a tabela professores
INSERT INTO professores (cpf, nome_professor, data_nasc_prof, titulacao, telefone) VALUES
('123.456.789-00', 'João Silva', '1980-05-15', 'Doutorado', '999999999'),
('987.654.321-00', 'Maria Souza', '1975-10-20', 'Mestrado', '888888888'),
('111.222.333-44', 'Carlos Santos', '1990-03-25', 'Especialização', '777777777'),
('555.666.777-88', 'Ana Oliveira', '1988-12-10', 'Graduação', '666666666'),
('999.888.777-66', 'Pedro Rocha', '1985-07-08', 'Doutorado', '555555555'),
('444.333.222-11', 'Mariana Costa', '1972-09-18', 'Mestrado', '444444444'),
('222.111.444-55', 'Lucas Fernandes', '1983-04-30', 'Especialização', '333333333'),
('777.888.999-00', 'Juliana Lima', '1978-06-12', 'Graduação', '222222222'),
('666.555.444-33', 'Rafaela Almeida', '1995-11-05', 'Doutorado', '111111111'),
('333.222.111-44', 'Fernando Santos', '1982-08-23', 'Mestrado', '000000000');

-- Populando a tabela alunos
INSERT INTO alunos (nome_aluno, endereco, telefone, data_nasc_aluno, altura, peso) VALUES
('Lucas Oliveira', 'Rua A, 123', '999999990', '2000-01-10', 1.75, 70.5),
('Maria Silva', 'Rua B, 456', '888888880', '1999-05-20', 1.65, 60.2),
('Ana Santos', 'Rua C, 789', '777777770', '2001-11-15', 1.70, 65.8),
('Pedro Almeida', 'Rua D, 321', '666666660', '2002-03-05', 1.80, 75.3),
('Juliana Souza', 'Rua E, 654', '555555550', '2003-07-30', 1.68, 62.7),
('Rafael Lima', 'Rua F, 987', '444444440', '2000-09-25', 1.72, 68.1),
('Fernanda Costa', 'Rua G, 210', '333333330', '2002-12-12', 1.63, 58.9),
('Gustavo Fernandes', 'Rua H, 753', '222222220', '2001-04-18', 1.79, 74.6),
('Carolina Rocha', 'Rua I, 159', '111111110', '2003-06-08', 1.66, 63.5),
('Marcelo Oliveira', 'Rua J, 852', '000000000', '2002-10-30', 1.75, 71.8);

-- Populando a tabela matriculas
INSERT INTO matriculas (id_aluno, data_matricula, ausencias) VALUES
(1, '2023-02-01', 2),
(2, '2023-02-03', 1),
(3, '2023-02-05', 0),
(4, '2023-02-07', 3),
(5, '2023-02-09', 0),
(6, '2023-02-11', 4),
(7, '2023-02-13', 2),
(8, '2023-02-15', 1),
(9, '2023-02-17', 0),
(10, '2023-02-19', 3);

-- Populando a tabela turmas
INSERT INTO turmas (quantidade_alunos, horario_aula, duracao_aula, data_inicial, data_final, tipo_curso, aluno_monitor, id_professor, id_matricula) VALUES
(20, '08:00:00', '01:30:00', '2023-03-01', '2023-07-01', 'Inglês Avançado', 1, 1, 1),
(15, '10:00:00', '02:00:00', '2023-04-01', '2023-08-01', 'Francês Intermediário', 2, 2, 2),
(18, '14:00:00', '01:45:00', '2023-05-01', '2023-09-01', 'Espanhol Básico', 3, 3, 3),
(22, '16:00:00', '01:45:00', '2023-06-01', '2023-10-01', 'Alemão Intermediário', 4, 4, 4),
(25, '09:00:00', '02:15:00', '2023-07-01', '2023-11-01', 'Italiano Avançado', 5, 5, 5),
(17, '11:00:00', '01:30:00', '2023-08-01', '2023-12-01', 'Mandarim Básico', 6, 6, 6),
(19, '13:00:00', '02:00:00', '2023-09-01', '2024-01-01', 'Japonês Intermediário', 7, 7, 7),
(16, '15:00:00', '01:45:00', '2023-10-01', '2024-02-01', 'Coreano Avançado', 8, 8, 8),
(21, '10:00:00', '02:30:00', '2023-11-01', '2024-03-01', 'Russo Básico', 9, 9, 9),
(23, '12:00:00', '02:15:00', '2023-12-01', '2024-04-01', 'Árabe Intermediário', 10, 10, 10),
(20, '14:00:00', '01:45:00', '2024-01-01', '2024-05-01', 'Hindi Avançado', 1, 1, 2),
(15, '16:00:00', '02:00:00', '2024-02-01', '2024-06-01', 'Sueco Básico', 2, 2, 3),
(18, '08:00:00', '01:45:00', '2024-03-01', '2024-07-01', 'Hebraico Intermediário', 3, 3, 4),
(22, '10:00:00', '02:15:00', '2024-04-01', '2024-08-01', 'Finlandês Avançado', 4, 4, 5),
(25, '12:00:00', '01:30:00', '2024-05-01', '2024-09-01', 'Polonês Básico', 5, 5, 6);


#2.1) Listar os dados dos alunos
SELECT * FROM alunos;

#2.2) Listar os dados dos alunos e as turmas que eles estão matriculados;
SELECT alunos.*, turmas.`id_turma` FROM alunos LEFT JOIN matriculas
ON alunos.id_aluno = matriculas.id_aluno
LEFT JOIN turmas ON matriculas.id_matricula = turmas.id_matricula;

#2.3) Listar os alunos que não possuem faltas;
SELECT alunos.`nome_aluno`, matriculas.`ausencias` FROM alunos INNER JOIN matriculas
ON alunos.`id_aluno` = matriculas.`id_aluno`
WHERE ausencias = 0;

#2.4) Listar os professores e a quantidade de turmas que cada um leciona;
SELECT professores.`nome_professor`, COUNT(turmas.id_turma)
FROM professores INNER JOIN turmas ON professores.`id_professor` = turmas.`id_professor`
GROUP BY professores.`nome_professor`;


