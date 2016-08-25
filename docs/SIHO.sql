CREATE TABLE curso (
  cursoid INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  cursonome VARCHAR(50) NOT NULL,
  cargahoraria VARCHAR(20) NOT NULL,
  ementa VARCHAR(150) NOT NULL,
  bibliografia VARCHAR(200) NULL,
  modocurso VARCHAR(20) NULL,
  origemcurso VARCHAR(50) NULL,
  situacao BOOLEAN NULL,
  PRIMARY KEY(cursoid)
);

CREATE TABLE disciplina (
  disciplinaid INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(80) NOT NULL,
  professor VARCHAR(60) NOT NULL,
  cargahoraria VARCHAR(20) NULL,
  datacadastro DATE NOT NULL,
  conceito VARCHAR(100) NULL,
  ementa VARCHAR(80) NULL,
  datainicio DATE NOT NULL,
  situacaodisciplina BOOLEAN NOT NULL,
  universidade VARCHAR(50) NULL,
  modalidade VARCHAR(50) NULL,
  PRIMARY KEY(disciplinaid)
);

CREATE TABLE turma (
  turmaid INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  turmanome VARCHAR(60) NULL,
  PRIMARY KEY(turmaid)
);

CREATE TABLE colaborador (
  idcolaborador INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NULL,
  senha VARCHAR(30) NULL,
  datacadastro DATE NULL,
  ultimoacesso TIME NULL,
  PRIMARY KEY(idcolaborador)
);

CREATE TABLE aluno (
  idaluno INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  senha VARCHAR(45) NULL,
  datacadastro DATE NULL,
  ultimoacesso TIME NULL,
  PRIMARY KEY(idaluno)
);

CREATE TABLE colaboradordisciplina (
  colaborador_idcolaborador INTEGER UNSIGNED NOT NULL,
  disciplina_disciplinaid INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(colaborador_idcolaborador, disciplina_disciplinaid),
  INDEX colaborador_has_disciplina_FKIndex1(colaborador_idcolaborador),
  INDEX colaborador_has_disciplina_FKIndex2(disciplina_disciplinaid)
);

CREATE TABLE auditoria (
  idlog INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  colaborador_idcolaborador INTEGER UNSIGNED NOT NULL,
  aluno_idaluno INTEGER UNSIGNED NOT NULL,
  loghora TIME NOT NULL,
  logdata DATE NOT NULL,
  logtexto VARCHAR(500) NOT NULL,
  PRIMARY KEY(idlog),
  INDEX auditoria_FKIndex1(aluno_idaluno),
  INDEX auditoria_FKIndex2(colaborador_idcolaborador)
);

CREATE TABLE pessoa (
  pessoaid INTEGER UNSIGNED NOT NULL,
  turma_turmaid INTEGER UNSIGNED NOT NULL,
  colaborador_idcolaborador INTEGER UNSIGNED NOT NULL,
  aluno_idaluno INTEGER UNSIGNED NOT NULL,
  nome VARCHAR(60) NOT NULL,
  cpf VARCHAR(20) NOT NULL,
  rg VARCHAR(14) NOT NULL,
  endereco VARCHAR(70) NULL,
  email VARCHAR(70) NULL,
  cidade VARCHAR(35) NULL,
  bairro VARCHAR(45) NULL,
  estado VARCHAR(2) NULL,
  telefone VARCHAR(20) NULL,
  celular VARCHAR(20) NULL,
  cep VARCHAR(10) NULL,
  estadocivil VARCHAR(20) NULL,
  datacadastro DATE NULL,
  grauescolaridade VARCHAR(50) NULL,
  disciplinaextra BOOLEAN NULL,
  naturalidade VARCHAR(40) NULL,
  matricula VARCHAR(20) NULL,
  PRIMARY KEY(pessoaid, turma_turmaid),
  INDEX Table_02_FKIndex3(turma_turmaid),
  INDEX pessoa_FKIndex2(aluno_idaluno),
  INDEX pessoa_FKIndex3(colaborador_idcolaborador)
);

CREATE TABLE grade (
  gradeid INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  curso_cursoid INTEGER UNSIGNED NOT NULL,
  pessoa_turma_turmaid INTEGER UNSIGNED NOT NULL,
  usuario_Alunoid INTEGER UNSIGNED NOT NULL,
  alunoid INTEGER UNSIGNED NULL,
  cursoid INTEGER UNSIGNED NULL,
  semestreano VARCHAR(50) NULL,
  cargahoraria VARCHAR(20) NULL,
  diasemana VARCHAR(20) NULL,
  disciplinaid INTEGER UNSIGNED NULL,
  datavalidade DATE NULL,
  datacadastro DATE NULL,
  PRIMARY KEY(gradeid),
  INDEX Grade_FKIndex1(usuario_Alunoid, pessoa_turma_turmaid),
  INDEX Grade_FKIndex2(curso_cursoid)
);

CREATE TABLE gradedisciplina (
  Grade_gradeid INTEGER UNSIGNED NOT NULL,
  disciplina_disciplinaid INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(Grade_gradeid, disciplina_disciplinaid),
  INDEX Grade_has_disciplina_FKIndex1(Grade_gradeid),
  INDEX Grade_has_disciplina_FKIndex2(disciplina_disciplinaid)
);

CREATE TABLE alunocurso (
  curso_cursoid INTEGER UNSIGNED NOT NULL,
  pessoa_turma_turmaid INTEGER UNSIGNED NOT NULL,
  pessoa_Alunoid INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(curso_cursoid, pessoa_turma_turmaid, pessoa_Alunoid),
  INDEX curso_has_Table_02_FKIndex1(curso_cursoid),
  INDEX curso_has_Table_02_FKIndex2(pessoa_Alunoid, pessoa_turma_turmaid)
);


