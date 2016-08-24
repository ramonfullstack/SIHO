CREATE TABLE classeusuario (
  classeid SERIAL  NOT NULL ,
  classenome VARCHAR(45) NOT NULL,
  PRIMARY KEY(classeid)
);


CREATE TABLE turma (
  turmaid SERIAL  NOT NULL ,
  turmanome VARCHAR(60) NULL,
  PRIMARY KEY(turmaid)
);

CREATE TABLE modalidade (
  modalidade SERIAL  NOT NULL ,
  modalidadenome INTEGER  NULL,
  PRIMARY KEY(modalidade)
);

CREATE TABLE Login (
  usuarioid SERIAL  NOT NULL ,
  usuario VARCHAR NOT NULL,
  senha VARCHAR NOT NULL,
  PRIMARY KEY(usuarioid)
);


CREATE TABLE log (
  idlog SERIAL NOT NULL,
  usuarioid INTEGER NOT NULL,
  loghora TIME NOT NULL,
  logdata DATE NOT NULL,
  logtexto VARCHAR(500) NOT NULL,
  PRIMARY KEY(idlog)
); 

CREATE TABLE curso (
  cursoid SERIAL  NOT NULL ,
  cursonome VARCHAR(50) NOT NULL,
  cargahoraria VARCHAR(20) NOT NULL,
  ementa VARCHAR(150) NOT NULL,
  bibliografia VARCHAR(200) NULL,
  modocurso VARCHAR(20) NULL,
  origemcurso VARCHAR(50) NULL,
  situacao BOOL NULL,
  PRIMARY KEY(cursoid)
);

CREATE TABLE disciplina (
  disciplinaid SERIAL  NOT NULL ,
  turmaid INTEGER  NOT NULL,
  modalidadeid INTEGER  NOT NULL,
  nome VARCHAR(80) NOT NULL,
  professor VARCHAR(60) NOT NULL,
  cargahoraria VARCHAR(20) NULL,
  datacadastro DATE NOT NULL,
  conceito VARCHAR(100) NULL,
  ementa VARCHAR(80) NULL,
  datainicio DATE NOT NULL,
  situacaodisciplina BOOL NOT NULL,
  universidade VARCHAR(50) NULL,
  PRIMARY KEY(disciplinaid),
  CONSTRAINT disciplina_fkey_modalidade FOREIGN KEY(modalidadeid) REFERENCES modalidade(modalidade),
  CONSTRAINT disciplina_fkey_turma FOREIGN KEY(turmaid) REFERENCES turma(turmaid)
);


CREATE TABLE Grade (
  gradeid SERIAL  NOT NULL ,
  turmaid INTEGER  NOT NULL,
  usuarioid INTEGER  NOT NULL,
  alunoid INTEGER  NULL,
  cursoid INTEGER  NULL,
  semestreano VARCHAR(50) NULL,
  cargahoraria VARCHAR(20) NULL,
  diasemana VARCHAR(20) NULL,
  disciplinaid INTEGER  NULL,
  datavalidade DATE NULL,
  datacadastro DATE NULL,
  PRIMARY KEY(gradeid),
  CONSTRAINT grade_fkey_usuario FOREIGN KEY(usuarioid) REFERENCES login(usuarioid),
  CONSTRAINT grade_fkey_turma FOREIGN KEY(turmaid) REFERENCES turma(turmaid)
);






CREATE TABLE gradecurso (
  gradeid INTEGER,
  cursoid INTEGER NULL AUTO_INCREMENT,
  PRIMARY KEY(cursoid),
  CONSTRAINT gradecurso_fkey_grade FOREIGN KEY(gradeid) REFERENCES grade(gradeid),
  CONSTRAINT gradecurso_fkey_curso FOREIGN KEY(cursoid) REFERENCES curso(cursoid)
);

CREATE TABLE gradedisciplina (
  gradeid INTEGER,
  disciplinaid INTEGER NULL AUTO_INCREMENT,
  PRIMARY KEY(disciplinaid),
  CONSTRAINT gradedisciplina_fkey_grade FOREIGN KEY(gradeid) REFERENCES disciplina(disciplinaid),
  CONSTRAINT gradedisciplina_fkey_disciplina FOREIGN KEY(disciplinaid) REFERENCES disciplina(disciplinaid)
);

CREATE TABLE aluno (
  Alunoid INTEGER NULL AUTO_INCREMENT,
  turmaid INTEGER NULL,
  usuarioid INTEGER NULL,
  classeid INTEGER NULL,
  nome VARCHAR(60) NULL,
  cpf VARCHAR(20) NULL,
  rg VARCHAR(14)  NULL,
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
  PRIMARY KEY(Alunoid, turmaid),
  CONSTRAINT aluno_fkey_login FOREIGN KEY(usuarioid) REFERENCES login(usuarioid),
  CONSTRAINT aluno_fkey_classe FOREIGN KEY(classeid) REFERENCES classeusuario(classeid),
  CONSTRAINT aluno_fkey_turma FOREIGN KEY(turmaid) REFERENCES turma(turmaid)
);

--Indice da tabela Grade
CREATE INDEX  IDX_grade_usuario ON grade using btree (gradeid);
CREATE INDEX  IDX_disciplina_turma ON turma using btree (turmaid);

--Indice da tabela log
CREATE INDEX  log_usuario ON login using btree (usuarioid);

--Indices tabela disciplina
CREATE INDEX  IDX_disciplina_modalidade ON modalidade using btree (modalidade);

--Indices tabela GradeCurso
CREATE INDEX  Grade_has_Grade_FKIndex1 ON gradecurso using btree (gradeid);
CREATE INDEX  Grade_has_curso_FKIndex2 ON gradecurso using btree (cursoid);

--Indices tabela GradeDisciplina
CREATE INDEX  Grade_has_disciplina_FKIndex1 ON gradedisciplina using btree (gradeid);
CREATE INDEX  Grade_has_disciplina_FKIndex2 ON gradedisciplina using btree (disciplinaid);

--Indices da tabela Aluno
CREATE INDEX  aluno_Index ON aluno using btree (Alunoid);
CREATE INDEX  aluno_turma_index ON aluno using btree (turmaid);
CREATE INDEX  aluno_classe_index ON aluno using btree (classeid);



