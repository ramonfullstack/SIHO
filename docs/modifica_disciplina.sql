DELIMITER $$

CREATE TRIGGER modifica_disciplina AFTER UPDATE
ON disciplina
FOR EACH ROW
BEGIN
	DECLARE texto varchar(500); #Variavel texto que receberá as mnodificações da tabela
    DECLARE situacaoDaDisciplinaAntiga varchar(10);
    DECLARE situacaoDaDisciplina varchar(10);
    
    IF OLD.situacaodisciplina = TRUE THEN
		SET situacaoDaDisciplinaAntiga = 'Ativo';
	ELSEIF OLD.situacaodisciplina = FALSE THEN
		SET situacaoDaDisciplinaAntiga = 'Inativo';
	ELSEIF NEW.situacaodisciplina = TRUE  THEN
		SET situacaoDaDisciplina = 'Ativa';
	ELSE
		SET situacaoDaDisciplina = 'Inativa';
    End If;    
        
    If OLD.disciplinaid <> NEW.disciplinaid THEN
		SET texto := CONCAT('Código Disciplina atualizado de ', OLD.disciplinaid, ' para ', NEW.disciplinaid);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If;

    If OLD.nome <> NEW.nome THEN
		SET texto := CONCAT('Nome da Disciplina atualizado de ', OLD.nome, ' para ', NEW.nome);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);       
	End If;

	If OLD.professor <> NEW.professor THEN
		SET texto := CONCAT('Professor atualizado de ', OLD.disciplinaid, ' para ', NEW.disciplinaid);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
    End If;

    If OLD.cargahoraria <> NEW.cargahoraria THEN
		SET texto := CONCAT('carga horária atualizada de ', OLD.cargahoraria, ' para ', NEW.cargahoraria);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);      
    End If;

    If OLD.conceito <> NEW.conceito THEN
		SET texto := CONCAT('Conceito atualizado de ', OLD.cargahoraria, ' para ', NEW.cargahoraria);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);                
    End If;

    If OLD.ementa <> NEW.ementa THEN
		SET texto := CONCAT('Ementa da disciplina atualizada de ', OLD.ementa, ' para ', NEW.ementa);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);     
    End If;

    If OLD.datainicio <> NEW.datainicio THEN
		SET texto := CONCAT('Data Inicio da disciplina atualizada de ', OLD.datainicio, ' para ', NEW.datainicio);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);    
    End If;

    If OLD.situacaodisciplina <> NEW.situacaodisciplina THEN
		SET texto := CONCAT('Situação da disciplina atualizada de ', situacaoDaDisciplinaAntiga, ' para ', situacaoDaDisciplina);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);    
    End If;

    If OLD.universidade <> NEW.universidade THEN
		SET texto := CONCAT('Universidade da disciplina atualizada de ', OLD.universidade, ' para ', NEW.universidade);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);    
    End If;

    If OLD.modalidade <> NEW.modalidade THEN
		SET texto := CONCAT('Modalidade da disciplina atualizada de ', OLD.modalidade, ' para ', NEW.modalidade);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);    
	END IF;
END $$
     