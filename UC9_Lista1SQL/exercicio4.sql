CREATE DATABASE notas;

CREATE TABLE disciplinas (
id_disciplina INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_disciplina VARCHAR (30)
);

CREATE TABLE turmas (
id_turma INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sigla_turma VARCHAR(20),
ano_semestre VARCHAR(10),
id_disciplina INT,
FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);

CREATE TABLE alunos(
id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome_aluno VARCHAR(50),
id_turma INT,
FOREIGN KEY (id_turma) REFERENCES turmas(id_turma)
);

CREATE TABLE provas (
id_aluno INT,
id_disciplina INT,
data_prova DATE,
nota DECIMAL(4,2),
FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
FOREIGN KEY (id_disciplina) REFERENCES disciplinas(id_disciplina)
);