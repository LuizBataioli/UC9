

CREATE TABLE `aluno` (
  `aluno_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) DEFAULT NULL,
  `curso` VARCHAR(100) DEFAULT NULL,
  `nivel` VARCHAR(50) DEFAULT NULL,
  `idade` INT DEFAULT NULL,
  PRIMARY KEY (`aluno_id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



INSERT  INTO `aluno`(`aluno_id`,`nome`,`curso`,`nivel`,`idade`) VALUES 
(1,'João','Engenharia Civil','Graduação',22),
(2,'Maria','Medicina','Graduação',24),
(3,'Pedro','Direito','Graduação',23),
(4,'Ana','Psicologia','Graduação',21),
(5,'Luiza','Engenharia de Computação','Graduação',20),
(6,'Dick Vigarista','Administração','Graduação',25),
(7,'Mariana','Arquitetura','Graduação',22),
(8,'Paulo','Economia','Graduação',23),
(9,'Juliana','Ciência da Computação','Graduação',21),
(10,'Fernando','Medicina','Pós-graduação',27);


CREATE TABLE `matricula` (
  `matricula_id` INT NOT NULL AUTO_INCREMENT,
  `aluno_id` INT DEFAULT NULL,
  `turma_id` INT DEFAULT NULL,
  `nota_1` TINYINT DEFAULT NULL,
  `nota_2` TINYINT DEFAULT NULL,
  `nota_3` TINYINT DEFAULT NULL,
  `nota_final` TINYINT DEFAULT NULL,
  `nr_faltas` INT DEFAULT NULL,
  PRIMARY KEY (`matricula_id`),
  KEY `aluno_id` (`aluno_id`),
  KEY `turma_id` (`turma_id`),
  CONSTRAINT `matricula_ibfk_1` FOREIGN KEY (`aluno_id`) REFERENCES `aluno` (`aluno_id`),
  CONSTRAINT `matricula_ibfk_2` FOREIGN KEY (`turma_id`) REFERENCES `turma` (`turma_id`)
) ENGINE=INNODB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT  INTO `matricula`(`matricula_id`,`aluno_id`,`turma_id`,`nota_1`,`nota_2`,`nota_3`,`nota_final`,`nr_faltas`) VALUES 
(11,1,NULL,8,7,6,7,2),
(12,2,NULL,9,8,9,8,1),
(13,3,3,7,6,8,7,3),
(14,4,4,6,7,8,7,2),
(15,5,5,8,9,9,8,1),
(16,6,6,7,8,7,7,2),
(17,7,7,9,9,8,9,0),
(18,8,8,9,7,8,8,3),
(19,9,9,10,10,10,10,0),
(20,10,10,9,9,9,9,0);


CREATE TABLE `turma` (
  `turma_id` INT NOT NULL AUTO_INCREMENT,
  `nrturma` INT DEFAULT NULL,
  `sala` INT DEFAULT NULL,
  `horario` TIME DEFAULT NULL,
  PRIMARY KEY (`turma_id`)
) ENGINE=INNODB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT  INTO `turma`(`turma_id`,`nrturma`,`sala`,`horario`) VALUES 
(1,101,1,'08:00:00'),
(2,102,2,'10:00:00'),
(3,103,3,'13:00:00'),
(4,104,4,'15:00:00'),
(5,30,5,'09:00:00'),
(6,106,6,'11:00:00'),
(7,107,7,'14:00:00'),
(8,108,8,'16:00:00'),
(9,109,9,'10:30:00'),
(10,110,10,'12:30:00');

-- 1. Quais os nomes de todos os alunos?
SELECT nome FROM aluno;

-- 2. Quais os números das matrículas dos alunos?
SELECT nome, matricula_id FROM matricula INNER JOIN aluno
ON aluno.aluno_id = matricula.`aluno_id`;

-- 3. Quais os números das matrículas dos alunos que não estão matriculados em uma turma?
SELECT matricula_id, nome FROM matricula INNER JOIN aluno
ON aluno.aluno_id = matricula.`aluno_id`
WHERE turma_id IS NULL;

-- 4. Quais os números dos alunos matriculados em uma turma de número '30'?
SELECT aluno.aluno_id FROM matricula INNER JOIN aluno
ON aluno.aluno_id = matricula.`aluno_id`
INNER JOIN turma ON turma.`turma_id` = matricula.`turma_id`
WHERE nrturma = '30';

-- 5. Qual o horário da turma do aluno 'Dick Vigarista'?
SELECT nome, horario FROM aluno INNER JOIN matricula
ON matricula.`aluno_id` = aluno.`aluno_id`
INNER JOIN turma ON matricula.`turma_id` = turma.`turma_id`
WHERE nome = 'Dick Vigarista';

-- 6. Quais os nomes dos alunos matriculados em uma turma de número '30'?
SELECT nome, nrturma FROM matricula INNER JOIN aluno
ON aluno.aluno_id = matricula.`aluno_id`
INNER JOIN turma ON turma.`turma_id` = matricula.`turma_id`
WHERE nrturma = '30';

-- 7. Quais os nomes dos alunos que não estão matriculados na turma de número '30'?
SELECT nome, nrturma FROM matricula INNER JOIN aluno
ON aluno.aluno_id = matricula.`aluno_id`
INNER JOIN turma ON turma.`turma_id` = matricula.`turma_id`
WHERE nrturma <> '30';

-- 8. Quais os nomes das turmas com alunos com nota final maior que 8?
SELECT nome, nota_final FROM aluno INNER JOIN matricula
ON aluno.`aluno_id` = matricula.`aluno_id`
WHERE nota_final > 8;
