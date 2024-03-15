CREATE DATABASE curso;


CREATE TABLE alunos (
id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_aluno VARCHAR(50),
data_nasciemnto_aluno DATE,
telefone VARCHAR(9),
altura DECIMAL(3,2),
peso DECIMAL(5,2),
endereco_aluno VARCHAR(100)
);

CREATE TABLE professores (
id_professor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_professor VARCHAR(50),
cpf VARCHAR(15),
data_nascimento_prof DATE,
titulacao VARCHAR(30),
telefone VARCHAR(9)
);

CREATE TABLE cursos (
id_curso INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_curso VARCHAR(59)
);

CREATE TABLE turmas (
id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
quantidade_alunos INT,
horario_aula TIME,
data_inicial DATE,
data_final DATE,
aluno_monitor INT,
id_curso INT,
id_professor INT,
FOREIGN KEY (aluno_monitor) REFERENCES alunos(id_aluno),
FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
FOREIGN KEY (id_professor) REFERENCES professores(id_professor)
);

CREATE TABLE matriculas (
codigo_matricula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_matricula DATE,
id_turma INT,
id_aluno INT,
FOREIGN KEY (id_turma) REFERENCES turmas(id_turma),
FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);