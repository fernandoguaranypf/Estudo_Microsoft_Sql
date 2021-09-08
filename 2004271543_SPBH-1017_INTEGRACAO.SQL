--<DS_SCRIPT>
-- DESCRIO...: CRIANDO A ESTRUTURA PARA INTEGRAÇÃO DO ATENDIMENTO SOUL-MV COM O LABORATORIO COMPLAB
-- RESPONSAVEL.: FERNANDO GUARANY
-- DATA........: 20/04/2020
-- APLICAO...: REGULADOR
-- VERSAO......: 2020.0.0
--</DS_SCRIPT>
--<USUARIO=DBAMV>
CREATE TABLE mvintegra.complab(
ID_MVINTEGRA INT NOT NULL,
CD_ORI_ATE NUMBER(12) NOT NULL,
CD_ATENDIMENTO  NUMBER(10) NOT NULL,
CD_MULTI_EMPRESA  NUMBER(4) NOT NULL,
DT_ATENDIMENTO DATE NOT NULL,
HR_ATENDIMENTO DATE NOT NULL,
CD_TIP_SITUACAO NUMBER(3,0),
NM_CPF_TUTOR NUMBER,
CD_PACIENTE NUMBER(8),
NM_PACIENTE VARCHAR2(200),
TP_SEXO VARCHAR2(1),
DT_NASCIMENTO_TUTOR DATE, 
CD_CIDADANIA NUMBER(3),
NR_CPF NUMBER,
CD_ESTADO NUMBER,
CD_CIDADE NUMBER(12),
CD_NATURALIDADE NUMBER(12),
DS_ENDERECO VARCHAR2(100),
DS_COMPLEMENTO VARCHAR2(100),
NR_CEP VARCHAR2(8),
NR_FONE VARCHAR2(40),
NR_FONE_COMERCIAL VARCHAR2(40),
TP_ESTADO_CIVIL VARCHAR2(1),
NM_PAI VARCHAR2(200),
NM_MAE VARCHAR2(200),
CD_PROFISSAO NUMBER(4),
ESCOLARIDADE VARCHAR2(100),
FLG_FIRST_SUBS VARCHAR2(255),
RECORD_DATE DATE,
FLG_ALERT VARCHAR2(1) DEFAULT 'N', 
DT_ALERT DATE, 
FLG_COMPLAB VARCHAR2(1) DEFAULT 'N',
DT_COMPLAB DATE,
SETOR_CLASSIFICACAO VARCHAR2(255)
)
/
ALTER TABLE mvintegra.complab ADD CONSTRAINT CNT_complab_PK PRIMARY KEY (ID_MVINTEGRA) USING INDEX TABLESPACE TS_MVSISS_I COMPUTE STATISTICS
/
ALTER TABLE mvintegra.complab ADD CONSTRAINT CNT_complab_01_FK FOREIGN KEY (CD_ATENDIMENTO) REFERENCES DBAMV.ATENDIME (CD_ATENDIMENTO)
/
ALTER TABLE mvintegra.complab ADD CONSTRAINT CNT_complab_02_FK FOREIGN KEY (CD_MULTI_EMPRESA) REFERENCES DBAMV.ATENDIME (CD_MULTI_EMPRESA)
/
COMMENT ON TABLE mvintegra.complab IS 'Tabela que guarda as informações de atendimento e paciente para integracao com o COMPLAB'
/
COMMENT ON COLUMN mvintegra.complab.ID_MVINTEGRA IS 'Campo sequencial univoco'
/
COMMENT ON COLUMN mvintegra.complab.CD_ORI_ATE IS 'Campo referencia para atendimento de origem'
/
COMMENT ON COLUMN mvintegra.complab.CD_ATENDIMENTO IS 'Campo referencia para atendimento'
/
COMMENT ON COLUMN mvintegra.complab.CD_MULTI_EMPRESA IS 'Campo referencia para empresas da tabela multi_empresas'
/
COMMENT ON COLUMN mvintegra.complab.DT_ATENDIMENTO IS 'Campo referencia para data do atendimento ao paciente'
/
COMMENT ON COLUMN mvintegra.complab.HR_ATENDIMENTO IS 'Campo referencia para hora do atendimento do paciente'
/
COMMENT ON COLUMN mvintegra.complab.CD_TIP_SITUACAO IS 'Campo referencia para o tipo de atendimento'
/
COMMENT ON COLUMN mvintegra.complab.NM_CPF_TUTOR IS 'Campo referencia para CPF do acompanhante'
/
COMMENT ON COLUMN mvintegra.complab.CD_PACIENTE IS 'Campo referencia para codigo do paciente'
/
COMMENT ON COLUMN mvintegra.complab.NM_PACIENTE IS 'Campo referencia para nome do paciente'
/
COMMENT ON COLUMN mvintegra.complab.TP_SEXO IS 'Campo referencia para genero sexual'
/
COMMENT ON COLUMN mvintegra.complab.DT_NASCIMENTO IS 'Campo referencia para data de nascinemto'
/
COMMENT ON COLUMN mvintegra.complab.CD_CIDADANIA IS 'Campo referencia para NATURALIDADE'
/
COMMENT ON COLUMN mvintegra.complab.NR_CPF IS 'Campo referencia para cpf do paciente'
/
COMMENT ON COLUMN mvintegra.complab.CD_ESTADO IS 'Campo referencia para ESTADO DO PACIENTE'
/
COMMENT ON COLUMN mvintegra.complab.CD_CIDADE IS 'Campo referencia para CIDADE DO PACIENTE'
/
COMMENT ON COLUMN mvintegra.complab.CD_NATURALIDADE IS 'Campo referencia para complab que necessita da naturalidade do paciente'
/
COMMENT ON COLUMN mvintegra.complab.DS_ENDERECO IS 'Campo referencia para Endereço do paciente'
/
COMMENT ON COLUMN mvintegra.complab.DS_COMPLEMENTO IS 'Campo referencia para complemento do endereço'
/
COMMENT ON COLUMN mvintegra.complab.NR_CEP IS 'Campo referencia para aCEP DO PACIENTE'
/
COMMENT ON COLUMN mvintegra.complab.NR_FONE IS 'Campo referencia para telefone do paciente'
/
COMMENT ON COLUMN mvintegra.complab.NR_FONE_COMERCIAL IS 'Campo referencia para TELEFONE DO TRABALHO'
/
COMMENT ON COLUMN mvintegra.complab.TP_ESTADO_CIVIL IS 'Campo referencia para Estado civil do paciente'
/
COMMENT ON COLUMN mvintegra.complab.NM_PAI IS 'Campo referencia para NOME DO PAI'
/
COMMENT ON COLUMN mvintegra.complab.NM_MAE IS 'Campo referencia para NOME DA MAE'
/
COMMENT ON COLUMN mvintegra.complab.CD_PROFISSAO IS 'Campo referencia para profissao do paciente'
/
COMMENT ON COLUMN mvintegra.complab.ESCOLARIDADE IS 'Campo referencia para nivel de escolaridade do paciente'
/
COMMENT ON COLUMN mvintegra.complab.FLG_FIRST_SUBS IS 'Campo referencia para controle do complab'
/
COMMENT ON COLUMN mvintegra.complab.RECORD_DATE IS 'Campo referencia para controle do complab'
/
COMMENT ON COLUMN mvintegra.complab.FLG_ALERT IS 'Campo referencia para controle do complab'
/
COMMENT ON COLUMN mvintegra.complab.DT_COMPLAB IS 'Campo referencia para controle do complab'
/
COMMENT ON COLUMN mvintegra.complab.SETOR_CLASSIFICACAO IS 'Campo referencia para campo complab'
/
CREATE INDEX  MVINTEGRA.IND_complab_1_FK  ON mvintegra.complab(CD_ATENDIMENTO) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_2_FK  ON mvintegra.complab(CD_PACIENTE) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_3_FK  ON mvintegra.complab(NM_PACIENTE) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_4_FK  ON mvintegra.complab(TP_SEXO) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_5_FK  ON mvintegra.complab(DT_NASCIMENTO_TUTOR) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_6_FK  ON mvintegra.complab(NR_CPF) tablespace TS_MVSISS_D compute statistics
/
CREATE INDEX  MVINTEGRA.IND_complab_7_FK  ON mvintegra.complab(NR_CEP) tablespace TS_MVSISS_D compute statistics
/
CREATE SEQUENCE MVINTEGRA.seq_complab start with 1 increment by 1 nocache nocycle
/