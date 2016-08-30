DELIMITER $$

CREATE TRIGGER modifica_Pessoa AFTER UPDATE
ON pessoa
FOR EACH ROW
BEGIN
	DECLARE texto varchar(500); #Variavel texto que receberá as mnodificações da tabela
        
	If OLD.nome <> NEW.nome THEN
		SET texto := CONCAT('Nome atualizado de ', OLD.nome, ' para ', NEW.nome);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.turma_turmaid <> NEW.turma_turmaid THEN
		SET texto = CONCAT('Turma atualizada de ', OLD.turma_turmaid ,' para ' , NEW.turma_turmaid);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.colaborador_idcolaborador <> NEW.colaborador_idcolaborador THEN
		SET texto = CONCAT('Colaborador autalizado de ', OLD.colaborador_idcolaborador ,' para ' , NEW.colaborador_idcolaborador);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);    
	End If;

	If OLD.cpf <> NEW.cpf THEN
		SET texto = CONCAT('CPF atualizado de ', OLD.cpf ,' para ' , NEW.cpf);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.rg <> NEW.rg THEN
		SET texto = CONCAT('RG atualizado de ', OLD.rg ,' para ' , NEW.rg);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.endereco <> NEW.endereco THEN
		SET texto = CONCAT('Endereço atualizado de ', OLD.endereco ,' para ' , NEW.endereco);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME,texto);
	End If;

	If OLD.email <> NEW.email THEN
		SET texto = CONCAT('Email atualizado de ', OLD.email ,' para ' , NEW.email);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
            VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.cidade <> NEW.cidade THEN
		SET texto = CONCAT('Cidade atualizada de ', OLD.cidade ,' para ' , NEW.cidade);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.bairro <> NEW.bairro THEN
		SET texto = CONCAT('Bairro atualizado de ', OLD.bairro ,' para ' , NEW.bairro);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);  
	End If;

	If OLD.estado <> NEW.estado THEN
		SET texto = CONCAT('Estado atualizado de ', OLD.estado ,' para ' , NEW.estado);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);      
	End If;

	If OLD.telefone <> NEW.telefone THEN
		SET texto = CONCAT('Telefone atualizado de ', OLD.telefone ,' para ' , NEW.telefone);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);
	End If;

	If OLD.celular <> NEW.celular THEN
		SET texto = CONCAT('Celular atualizado de ', OLD.celular ,' para ' , NEW.celular);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);         
	End If;

	If OLD.cep <> NEW.cep THEN
		SET texto = CONCAT('CEP atualizado de ', OLD.cep ,' para ' , NEW.cep);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);           
	End If;

	If OLD.estadocivil <> NEW.estadocivil THEN
		SET texto = CONCAT('Estado Civil atualizado de ', OLD.estadocivil ,' para ' , NEW.estadocivil);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);          
	ENd If;

	If OLD.grauescolaridade <> NEW.grauescolaridade THEN
		SET texto = CONCAT('Grau  Escolaridade atualizado de ', OLD.grauescolaridade ,' para ' , NEW.grauescolaridade);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);               
	End If;

	If OLD.disciplinaextra <> NEW.disciplinaextra THEN
		SET texto = CONCAT('Disciplina Extra atualizada de ', OLD.disciplinaextra ,' para ' , NEW.disciplinaextra);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);                   
	End If;

	If OLD.naturalidade <> NEW.naturalidade THEN
		SET texto = CONCAT('Naturalidade atualizada de ', OLD.naturalidade ,' para ' , NEW.naturalidade);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto)
			VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);                   
	End If;

	If (OLD.matricula <> NEW.matricula) THEN
		SET texto = CONCAT('Matricula atualizada de ', OLD.matricula, ' para ', NEW.matricula);
		INSERT INTO auditoria(colaborador_idcolaborador, aluno_idaluno, logdata, loghora, logtexto) 
	        VALUES(1, 1, CURRENT_DATE, CURRENT_TIME, texto);                   
	END IF;   
END $$