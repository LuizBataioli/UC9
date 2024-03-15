CREATE TABLE notas;

CREATE TABLE `alunos` (
  `id_aluno` int NOT NULL AUTO_INCREMENT,
  `nome_aluno` varchar(50) DEFAULT NULL,
  `id_turma` int DEFAULT NULL,
  PRIMARY KEY (`id_aluno`),
  KEY `id_turma` (`id_turma`),
  CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`id_turma`) REFERENCES `turmas` (`id_turma`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `disciplinas` (
  `id_disciplina` int NOT NULL AUTO_INCREMENT,
  `nome_disciplina` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `provas` (
  `id_aluno` int DEFAULT NULL,
  `id_disciplina` int DEFAULT NULL,
  `data_prova` date DEFAULT NULL,
  `nota` decimal(4,2) DEFAULT NULL,
  KEY `id_aluno` (`id_aluno`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `provas_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id_aluno`),
  CONSTRAINT `provas_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `turmas` (
  `id_turma` int NOT NULL AUTO_INCREMENT,
  `sigla_turma` varchar(20) DEFAULT NULL,
  `ano_semestre` varchar(10) DEFAULT NULL,
  `id_disciplina` int DEFAULT NULL,
  PRIMARY KEY (`id_turma`),
  KEY `id_disciplina` (`id_disciplina`),
  CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id_disciplina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
