--<DS_SCRIPT>
-- DESCRICAO...: Adicionando nova chave no modulo global para MGES
-- RESPONSAVEL.: Fernando Guarany
-- DATA........: 19/01/2021
-- APLICAO...: SOUL - PROJETO BH
-- VERSAO......: A PARTIR DA VERSÃO 2020.03.15
--</DS_SCRIPT>
--<USUARIO=DBAMV>

--Inserindo primeira chave na tabela. Não é marcado o campo multi empresa para que a configuração va para todas as empresas
INSERT INTO dbamv.configuracao (
    cd_sistema,
    chave,
    valor,
    sn_somente_leitura,
    cd_configuracao,
    cd_configuracao_processo,
    ds_configuracao
    
) VALUES (
    'MGES',
    'SN_EXIBE_NOTA_SAIDA',
    'S',
    'N',
    DBAMV.SEQ_CONFIGURACAO.NEXTVAL ,
    NULL,
    'CHAVE PARA LIBERAR BOTÃO DE NOTA FISCAL DE SAÍDA.'
    
);
/
COMMIT;
/

--Inserindo segunda chave na tabela. Não é marcado o campo multi empresa para que a configuração va para todas as empresas
INSERT INTO dbamv.configuracao (
    cd_sistema,
    chave,
    valor,
    sn_somente_leitura,
    cd_configuracao,
    cd_configuracao_processo,
    ds_configuracao
    
) VALUES (
    'MGES',
    'SN_VINCULA_MOTORISTA',
    'S',
    'N',
    DBAMV.SEQ_CONFIGURACAO.NEXTVAL ,
    NULL,
    'CHAVE PARA LIBERAR BOTÃO PARA VINCULAR MOTORISTA DE TRANSPORTE DE MERCADORIA'
    
);
/
COMMIT;
/