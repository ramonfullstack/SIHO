DELIMITER $$

CREATE TRIGGER modifica_Pessoa AFTER UPDATE
ON pessoa
FOR EACH ROW
BEGIN
	DECLARE texto varchar(500)
        
  If OLD.nome <> NEW.nome THEN
		SET @texto := "Idade atualizada de " + OLD.nome + " para " + NEW.nome;
    INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.turma_turmaid <> NEW.turma_turmaid THEN
		SET @texto = 'Turma atualizada de '+ OLD.turma_turmaid +' para ' + NEW.turma_turmaid
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto, 1)
	Else If OLD.colaborador_idcolaborador <> NEW.colaborador_idcolaborador THEN
		SET @texto = 'Colaborador autalizado de '+ OLD.colaborador_idcolaborador +' para ' + NEW.colaborador_idcolaborador
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto, 1)    
	Else If OLD.cpf <> NEW.cpf THEN
		SET @texto = 'CPF atualizado de '+ OLD.cpf +' para ' + NEW.cpf
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.rg <> NEW.rg THEN
		SET @texto = 'RG atualizado de '+ OLD.rg +' para ' + NEW.rg
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.endereco <> NEW.endereco THEN
		SET @texto = 'Endereço atualizado de '+ OLD.endereco +' para ' + NEW.endereco
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME,@texto)
	Else If OLD.email <> NEW.email THEN
		SET @texto = 'Email atualizado de '+ OLD.email +' para ' + NEW.email
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.cidade <> NEW.cidade THEN
		SET @texto = 'Cidade atualizada de '+ OLD.cidade +' para ' + NEW.cidade
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.bairro <> NEW.bairro THEN
		SET @texto = 'Bairro atualizado de '+ OLD.bairro +' para ' + NEW.bairro
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)  
  Else If OLD.estado <> NEW.estado THEN
		SET @texto = 'Estado atualizado de '+ OLD.estado +' para ' + NEW.estado
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)      
  Else If OLD.telefone <> NEW.telefone THEN
		SET @texto = 'Telefone atualizado de '+ OLD.telefone +' para ' + NEW.telefone
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)
	Else If OLD.celular <> NEW.celular THEN
		SET @texto = 'Celular atualizado de '+ OLD.celular +' para ' + NEW.celular
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)         
	Else If OLD.cep <> NEW.cep THEN
		SET @texto = 'CEP atualizado de '+ OLD.cep +' para ' + NEW.cep
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)           
	Else If OLD.estadocivil <> NEW.estadocivil THEN
		SET @texto = 'Estado Civil atualizado de '+ OLD.estadocivil +' para ' + NEW.estadocivil
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)          
  Else If OLD.grauescolaridade <> NEW.grauescolaridade THEN
		SET @texto = 'Grau  Escolaridade atualizado de '+ OLD.grauescolaridade +' para ' + NEW.grauescolaridade
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)               
  Else If OLD.disciplinaextra <> NEW.disciplinaextra THEN
		SET @texto = 'Disciplina Extra atualizada de '+ OLD.disciplinaextra +' para ' + NEW.disciplinaextra
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)                   
	Else If OLD.naturalidade <> NEW.naturalidade THEN
		SET @texto = 'Naturalidade atualizada de '+ OLD.naturalidade +' para ' + NEW.naturalidade
		INSERT INTO auditoria( logdata, loghora, logtexto) 
			VALUES(CURRENT_DATE, CURRENT_TIME, @texto)                   
	Else If (OLD.matricula <> NEW.matricula) THEN
		SET @texto = CONCAT('Matricula atualizada de '.CONVERT(OLD.matricula, CHAR). ' para '. CONVERT(NEW.matricula, CHAR))
		INSERT INTO auditoria( logdata, loghora, logtexto) 
      VALUES(CURRENT_DATE, CURRENT_TIME, @texto)                   
    END IF   
END $$