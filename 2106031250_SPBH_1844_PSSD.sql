------------------------------------------ ORACLE ------------------------------------------
--<DS_SCRIPT>
-- DESCRICAO...: Tabela de Perfil de exames PSSD
-- RESPONSAVEL.: Fernando Guarany
-- DATA........: 03/06/2021 12:50
-- APLICAO...: SOUL - PROJETO BH
-- VERSAO......: A PARTIR DA VERSÃO 2020.7.0
--</DS_SCRIPT>
--<USUARIO=DBAMV>

CREATE TABLE dbamv.PERFIL_EXAMES_PSSD(
CD_ID number(4,0),
DS_DESCRICAO_PERFIL VARCHAR2(120),
CD_EXA_LAB NUMBER(4,0),
NM_EXA_LAB VARCHAR2(200)
);
/

ALTER TABLE dbamv.PERFIL_EXAMES_PSSD ADD CONSTRAINT PK_PERF_EXA_PSSD
PRIMARY KEY (CD_ID);
/

ALTER TABLE dbamv.PERFIL_EXAMES_PSSD ADD CONSTRAINT FK_PERF_EXA_LAB_PSSD
FOREIGN KEY (CD_EXA_LAB)
REFERENCES DBAMV.EXA_LAB(CD_EXA_LAB);
/

CREATE PUBLIC SYNONYM PERFIL_EXAMES_PSSD FOR dbamv.PERFIL_EXAMES_PSSD;
/

GRANT ALL ON dbamv.PERFIL_EXAMES_PSSD TO dbamv, dbamvfor, sigsaudej, mv2000, mvintegra;
/

create sequence dbamv.SEQ_PERFIL_EXAMES_PSSD
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
nocache
cycle;
/

COMMENT ON COLUMN dbamv.PERFIL_EXAMES_PSSD.CD_ID IS 'Sequence da tabela';

COMMENT ON COLUMN dbamv.PERFIL_EXAMES_PSSD.DS_DESCRICAO_PERFIL IS 'Campo para informar a descrição do perfil criado';

COMMENT ON COLUMN dbamv.PERFIL_EXAMES_PSSD.CD_EXA_LAB IS 'Campo chave estrangeira da tabela DBAMV.EXA_LAB';

COMMENT ON COLUMN dbamv.PERFIL_EXAMES_PSSD.NM_EXA_LAB IS 'Campo chave estrangeira da tabela DBAMV.EXA_LAB';

