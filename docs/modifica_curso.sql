DELIMITER $$

CREATE TRIGGER modifica_curso AFTER UPDATE
ON curso
FOR EACH ROW
BEGIN
	DECLARE texto varchar(500); #Variavel texto que receberá as mnodificações da tabela
    DECLARE situacaoDoCurso varchar(10); #Nova situação do curso
    DECLARE situacaoDoCursoaAntiga varchar(10); #Antiga situação do curso
    
	IF OLD.situacao = TRUE THEN
		SET situacaoDoCursoaAntiga = 'Ativo';
	ELSEIF OLD.situacao = FALSE THEN
		SET situacaoDoCursoaAntiga = 'Inativo';
	ELSEIF NEW.situacaoDoCurso = TRUE  THEN
		SET situacaoDoCurso = 'Ativa';
	ELSE
		SET situacaoDoCurso = 'Inativa';
		
    If OLD.cursonome <> NEW.cursonome THEN
		SET texto := CONCAT('Nome do curso atualizado de ', OLD.cursonome, ' para ', NEW.cursonome);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If;

    If OLD.cargahoraria <> NEW.cargahoraria THEN
		SET texto := CONCAT('Carga Horária atualizada de ', OLD.cargahoraria, ' para ', NEW.cargahoraria);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If;

    If OLD.ementa <> NEW.ementa THEN
		SET texto := CONCAT('Ementa atualizada de ', OLD.ementa, ' para ', NEW.ementa);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If; 

    If OLD.bibliografia <> NEW.bibliografia THEN
		SET texto := CONCAT('Bibliografia atualizada de ', OLD.bibliografia, ' para ', NEW.bibliografia);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    ENd IF;

    If OLD.modocurso <> NEW.modocurso THEN #Presencial ou Distancia
		SET texto := CONCAT('Modo do Curso atualizado de ', OLD.modocurso, ' para ', NEW.modocurso);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If;

    If OLD.origemcurso <> NEW.origemcurso THEN
		SET texto := CONCAT('Origem do Curso atualizada de ', OLD.origemcurso, ' para ', NEW.origemcurso);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto); 
    End If;

    If OLD.situacao <> NEW.situacao THEN
		SET texto := CONCAT('Situação do Curso atualizado de ', situacaoDoCursoAntiga , ' para ', situacaoDoCurso );
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);                
    END IF;        
END $$

