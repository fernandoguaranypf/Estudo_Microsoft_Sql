--SELECT E DELETE DE CPF DUPLICADO NO SISTEMA

SELECT nr_cpf from dbamv.paciente where nr_cpf is not null and cd_paciente 
not in (select cd_paciente from dbamv.atendime)
and nr_cpf in (select nr_cpf from ( select nr_cpf, count(1) qtd from DBAMV.paciente 
where nr_cpf is not null group by nr_cpf HAVING count(1) >= 2))
AND cd_paciente in(select cd_paciente from dbamv.PW_DOCUMENTO_CLINICO);


delete from dbamv.paciente where nr_cpf is not null and cd_paciente 
not in (select cd_paciente from dbamv.atendime)
and nr_cpf in (select nr_cpf from ( select nr_cpf, count(1) qtd from DBAMV.paciente 
where nr_cpf is not null group by nr_cpf HAVING count(1) >= 2))
AND cd_paciente in(select cd_paciente from dbamv.PW_DOCUMENTO_CLINICO);