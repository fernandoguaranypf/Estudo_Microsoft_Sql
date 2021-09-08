--Selecionar o usuario com problema
SELECT * from DBASGU.USUARIOS where UPPER(CD_USUARIO) IN ('PRPS012591', 'PRPS009861');

--Selecionar o usuario na tabela de log, verificando quantas senhas existem e se foram alteradas
select * from DBASGU.log_senha where CD_USUARIO IN ('PRPS012591', 'PRPS009861');

--Fazer o update pegando a primeira senha 
update DBASGU.USUARIOS set cd_senha = 'SWW\;>AFLFgkkpORUZ`Zvxz|~¿¿¿¿¿' where UPPER(CD_USUARIO)=UPPER('PRPS012591');

GRANT connect, resource TO PRPS012591 WITH admin OPTION;
GRANT mv2000 TO PRPS012591 WITH admin OPTION;


