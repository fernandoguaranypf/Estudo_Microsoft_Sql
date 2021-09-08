select *  from Dbamv.Configuracao where chave = 'SN_INTEGRA_PRONTUARIO_CIDADAO';

update Dbamv.Configuracao set valor = 'N' where chave = 'SN_INTEGRA_PRONTUARIO_CIDADAO';
