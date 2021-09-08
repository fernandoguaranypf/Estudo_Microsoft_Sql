--Insert para erros de integração de produtos

insert into mvintegra.config_mvintegra (CD_CONFIG_MVINTEGRA, CAMINHO_ARQUIVO_GERADO, CAMINHO_LEITURA_ARQUIVO, CD_FILIAL_INTEGRA, 
CD_MULTI_EMPRESA, UNIDADE_WINDOWS, TEMPO_ATUALIZACAO, CD_MOT_DEV, CD_TIP_DOC_FRETE, SN_ATIVA_INTEGRACAO_AGFA, 
CD_SETOR_PERDAS_CREDITO, CD_CONTA_PERDAS_CREDITO, CD_SETOR_PERDAS_DEBITO, CD_CONTA_PERDAS_DEBITO, CD_SETOR_INVENTARIO_CREDITO, 
CD_CONTA_INVENTARIO_CREDITO, CD_SETOR_INVENTARIO_DEBITO, CD_CONTA_INVENTARIO_DEBITO, CD_CEN_CUS_PERDAS_CREDITO, 
CD_CEN_CUS_PERDAS_DEBITO, CD_CEN_CUS_INVENTARIO_CREDITO, CD_CEN_CUS_INVENTARIO_DEBITO)
values (8, '', '', '1', 1, '', null, null, null, 'N', '', '', '', '', '', '', '', '', '', '', '', '');


------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE system.caught_errors (
  dt DATE NULL,
  username VARCHAR2(30) NULL,
  msg VARCHAR2(4000) NULL,
  stmt VARCHAR2(4000) NULL
)
/

CREATE OR REPLACE TRIGGER dbamv.catch_errors
  after servererror on database
declare
  sql_text ora_name_list_t;
  msg_ varchar2(2000) := null;
  stmt_ varchar2(2000) := null;
begin

  for depth in 1 .. ora_server_error_depth loop
  msg_ := msg_ || ora_server_error_msg(depth);
  end loop;

  for i in 1 .. ora_sql_txt(sql_text) loop
  stmt_ := stmt_ || sql_text(i);
  end loop;

  insert into
  caught_errors (dt , username ,msg ,stmt )
  values (sysdate, ora_login_user,msg_,stmt_);
end;
/

----------------------------------------------------------------------------------------------------------------------------------

SELECT * FROM ALL_source WHERE Upper(text) LIKE Upper('%No foi possvel encontrar as configuraes da integ%');

Select *
        From mvintegra.config_mvintegra
       Where config_mvintegra.cd_multi_empresa = 1;