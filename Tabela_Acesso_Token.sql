------------------------------------------ ORACLE ------------------------------------------
--<DS_SCRIPT>
-- DESCRICAO...: Adicionando nova tabela referente ao admpac
-- RESPONSAVEL.: Fernando Guarany
-- DATA........: 19/10/2020
-- APLICAO...: SOUL - PROJETO BH
-- VERSAO......: A PARTIR DA VERSÃO 2020.0.0
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE TABLE dbamv.ACESSO_TOKEN(
CD_ACESSO_TOKEN NUMBER,
DS_ACESSO_TOKEN VARCHAR2(4000), 
DS_REFRESH_TOKEN VARCHAR2(4000), 
DH_ACESSO DATE,
DH_ACESSO_REFRESH_TOKEN DATE,
NR_EXPIRE_TOKEN NUMBER,
NR_EXPIRE_REFRESH_TOKEN NUMBER
);
/

ALTER TABLE dbamv.ACESSO_TOKEN ADD CONSTRAINT CNT_ACESSO_TOKEN_PK
PRIMARY KEY (CD_ACESSO_TOKEN);
    
CREATE PUBLIC SYNONYM ACESSO_TOKEN FOR dbamv.ACESSO_TOKEN;
/

GRANT ALL ON dbamv.ACESSO_TOKEN TO dbamvfor, mv2000, sigsaudej;
/

create sequence dbamv.SEQ_ACESSO_TOKEN
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocache
cycle;
/

COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.CD_ACESSO_TOKEN IS 'Sequence da tabela';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.DS_ACESSO_TOKEN IS 'Campo recebe o codigo do token';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.DS_REFRESH_TOKEN IS 'Campo armazena o refresh token para consulta';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.DH_ACESSO IS 'Campo armazena a data e a hora do acesso token para checar a validade do mesmo';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.DH_ACESSO_REFRASH_TOKEN IS 'Campo armazena a data e a hora do refresh token para checar a validade do mesmo';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.NR_EXPIRE_TOKEN IS 'Campo armazena o numero de dias de expiração do token';
/
COMMENT ON COLUMN DBAMV.ACESSO_TOKEN.NR_EXPIRE_REFRESH_TOKEN IS 'Campo armazena o numero de dias de expiração do refresh token';
/