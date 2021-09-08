--<DS_SCRIPT>
-- DESCRIO...: CRIANDO A ESTRUTURA PARA INTEGRAÇÃO DO ATENDIMENTO SOUL-MV COM O LABORATORIO COMPLAB
-- RESPONSAVEL.: FERNANDO GUARANY
-- DATA........: 24/04/2020
-- APLICAO...: REGULADOR
-- VERSAO......: 2020.0.0
--</DS_SCRIPT>
--<USUARIO=DBAMV>
create or replace TRIGGER dbamv.trg_comp_insert AFTER
    INSERT OR DELETE OR UPDATE ON dbamv.atendime
    REFERENCING
            NEW AS new
            OLD AS old
    FOR EACH ROW
DECLARE
    v_atendime   dbamv.atendime%rowtype;
    v_paciente   dbamv.paciente%rowtype;
    v_existe     NUMBER;
    v_ds_acao    VARCHAR2(20);
BEGIN
    v_atendime.cd_atendimento := :new.cd_atendimento;
    v_atendime.cd_ori_ate := :new.cd_ori_ate;
    v_atendime.cd_paciente := :new.cd_paciente;
    v_atendime.cd_convenio := :new.cd_convenio;
    v_atendime.cd_pro_int := :new.cd_pro_int;
    v_atendime.cd_pro_int_procedimento_entrad := :new.cd_pro_int_procedimento_entrad;
    v_atendime.dt_atendimento := :new.dt_atendimento;
    v_atendime.hr_atendimento := :new.hr_atendimento;
    v_atendime.tp_atendimento := :new.tp_atendimento;
    v_atendime.cd_prestador := :new.cd_prestador;
    v_atendime.cd_leito := :new.cd_leito;
    v_atendime.cd_loc_trans := :new.cd_loc_trans;
    v_atendime.cd_mot_alt := :new.cd_mot_alt;
    v_atendime.cd_cid := :new.cd_cid;
    v_atendime.cd_servico := :new.cd_servico;
    v_atendime.ds_atendimento := :new.ds_atendimento;
    v_atendime.dt_diag := :new.dt_diag;
    v_atendime.dt_alta := :new.dt_alta;
    v_atendime.ds_obs_alta := :new.ds_obs_alta;
    v_atendime.dt_entrada_same := :new.dt_entrada_same;
    v_atendime.dt_prevista_alta := :new.dt_prevista_alta;
    v_atendime.cd_tip_res := :new.cd_tip_res;
    v_atendime.cd_tip_acom := :new.cd_tip_acom;
    v_atendime.dt_val_guia := :new.dt_val_guia;
    v_atendime.nr_guia := :new.nr_guia;
    v_atendime.hr_alta := :new.hr_alta;
    v_atendime.cd_ser_dis := :new.cd_ser_dis;
    v_atendime.cd_des_ate := :new.cd_des_ate;
    v_atendime.ds_ate_oco := :new.ds_ate_oco;
    v_atendime.cd_ultimo_mov_int := :new.cd_ultimo_mov_int;
    v_atendime.cd_casos_atd := :new.cd_casos_atd;
    v_atendime.ds_destino_transferencia := :new.ds_destino_transferencia;
    v_atendime.nm_usuario := :new.nm_usuario;
    v_atendime.cd_con_pla := :new.cd_con_pla;
    v_atendime.nm_usuario_alta := :new.nm_usuario_alta;
    v_atendime.cd_tipo_internacao := :new.cd_tipo_internacao;
    v_atendime.cd_log_export_atendime := :new.cd_log_export_atendime;
    v_atendime.cd_loc_proced := :new.cd_loc_proced;
    v_atendime.cd_log_export_alta := :new.cd_log_export_alta;
    v_atendime.sn_acompanhante := :new.sn_acompanhante;
    v_atendime.sn_infeccao := :new.sn_infeccao;
    v_atendime.sn_retorno := :new.sn_retorno;
    v_atendime.cd_ssm_cih := :new.cd_ssm_cih;
    v_atendime.cd_convenio_secundario := :new.cd_convenio_secundario;
    v_atendime.cd_con_pla_secundario := :new.cd_con_pla_secundario;
    v_atendime.cd_multi_empresa := :new.cd_multi_empresa;
    v_atendime.cd_especialid := :new.cd_especialid;
    v_atendime.cd_tip_mar := :new.cd_tip_mar;
    v_atendime.dt_revisao := :new.dt_revisao;
    v_atendime.dt_retorno := :new.dt_retorno;
    v_atendime.cd_atendimento_pai := :new.cd_atendimento_pai;
    v_atendime.qt_sessoes := :new.qt_sessoes;
    v_atendime.dt_alta_medica := :new.dt_alta_medica;
    v_atendime.nm_usuario_alta_medica := :new.nm_usuario_alta_medica;
    v_atendime.hr_alta_medica := :new.hr_alta_medica;
    v_atendime.cd_servico_saida := :new.cd_servico_saida;
    v_atendime.cd_especialid_saida := :new.cd_especialid_saida;
    v_atendime.cd_loc_trans_saida := :new.cd_loc_trans_saida;
    v_atendime.cd_mot_trans_saida := :new.cd_mot_trans_saida;
    v_atendime.ds_obs_psih := :new.ds_obs_psih;
    v_atendime.dt_aviso_medico := :new.dt_aviso_medico;
    v_atendime.hr_aviso_medico := :new.hr_aviso_medico;
    v_atendime.ds_aviso_tp_contato := :new.ds_aviso_tp_contato;
    v_atendime.ds_aviso_obs := :new.ds_aviso_obs;
    v_atendime.nm_aviso_usuario := :new.nm_aviso_usuario;
    v_atendime.tp_programa_alta_unidade := :new.tp_programa_alta_unidade;
    v_atendime.ds_programa_alta := :new.ds_programa_alta;
    v_atendime.dt_programa_alta := :new.dt_programa_alta;
    v_atendime.nm_usuario_prog_alta := :new.nm_usuario_prog_alta;
    v_atendime.dt_liberacao := :new.dt_liberacao;
    v_atendime.sn_importa_auto := :new.sn_importa_auto;
    v_atendime.cd_sub_plano := :new.cd_sub_plano;
    v_atendime.sn_busca_ativa := :new.sn_busca_ativa;
    v_atendime.tp_busca_ativa := :new.tp_busca_ativa;
    v_atendime.sn_obito := :new.sn_obito;
    v_atendime.sn_em_atendimento := :new.sn_em_atendimento;
    v_atendime.cd_tip_situacao := :new.cd_tip_situacao;
    v_atendime.tp_prioridade := :new.tp_prioridade;
    v_atendime.cd_ssm_sia := :new.cd_ssm_sia;
    v_atendime.cd_gru_ate := :new.cd_gru_ate;
    v_atendime.sn_consulta_siasus := :new.sn_consulta_siasus;
    v_atendime.nm_usuario_retorno := :new.nm_usuario_retorno;
    v_atendime.dt_usuario_retorno := :new.dt_usuario_retorno;
    v_atendime.sn_recebe_visita := :new.sn_recebe_visita;
    v_atendime.nr_chamada_painel := :new.nr_chamada_painel;
    v_atendime.nr_laudo := :new.nr_laudo;
    v_atendime.nr_laudo_alto_custo := :new.nr_laudo_alto_custo;
    v_atendime.cd_usuario_diag := :new.cd_usuario_diag;
    v_atendime.cd_usuario_upd_diag := :new.cd_usuario_upd_diag;
    v_atendime.dt_ultima_upd_diag := :new.dt_ultima_upd_diag;
    v_atendime.nr_pedido_laudo := :new.nr_pedido_laudo;
    v_atendime.cd_escala_dia := :new.cd_escala_dia;
    v_atendime.hr_agenda := :new.hr_agenda;
    v_atendime.cd_tip_acom_cobertura := :new.cd_tip_acom_cobertura;
    v_atendime.cd_setor_obito := :new.cd_setor_obito;
    v_atendime.dt_solic_medica := :new.dt_solic_medica;
    v_atendime.nr_seq_preimpre := :new.nr_seq_preimpre;
    v_atendime.sn_atendimento_apac := :new.sn_atendimento_apac;
    v_atendime.sn_obito_infec := :new.sn_obito_infec;
    v_atendime.dt_chegada_paciente := :new.dt_chegada_paciente;
    v_atendime.nr_carteira := :new.nr_carteira;
    v_atendime.dt_validade := :new.dt_validade;
    v_atendime.nm_empresa := :new.nm_empresa;
    v_atendime.nr_carteira_acoplamento := :new.nr_carteira_acoplamento;
    v_atendime.dt_validade_acoplamento := :new.dt_validade_acoplamento;
    v_atendime.nm_empresa_acoplamento := :new.nm_empresa_acoplamento;
    v_atendime.nr_declaracao_obito := :new.nr_declaracao_obito;
    v_atendime.senha_sus := :new.senha_sus;
    v_atendime.hr_atendimento_medico := :new.hr_atendimento_medico;
    v_atendime.cd_seq_integra := :new.cd_seq_integra;
    v_atendime.dt_integra := :new.dt_integra;
    v_atendime.sn_paciente_paga_dif_diaria := :new.sn_paciente_paga_dif_diaria;
    v_atendime.cd_guia := :new.cd_guia;
    v_atendime.cd_laudo_apac := :new.cd_laudo_apac;
    v_atendime.tp_doenca := :new.tp_doenca;
    v_atendime.nr_tempo_doenca := :new.nr_tempo_doenca;
    v_atendime.tp_tempo_doenca := :new.tp_tempo_doenca;
    v_atendime.tp_carater_internacao := :new.tp_carater_internacao;
    v_atendime.tp_obito_mulher := :new.tp_obito_mulher;
    v_atendime.tp_acidente_tiss := :new.tp_acidente_tiss;
    v_atendime.cd_atendimento_sus_vinculado := :new.cd_atendimento_sus_vinculado;
    v_atendime.tp_atendimento_tiss := :new.tp_atendimento_tiss;
    v_atendime.sn_gestacao_tiss := :new.sn_gestacao_tiss;
    v_atendime.sn_aborto_tiss := :new.sn_aborto_tiss;
    v_atendime.sn_transtorno_tiss := :new.sn_transtorno_tiss;
    v_atendime.sn_complicacao_tiss := :new.sn_complicacao_tiss;
    v_atendime.sn_atend_neo_tiss := :new.sn_atend_neo_tiss;
    v_atendime.sn_complicacao_neo_tiss := :new.sn_complicacao_neo_tiss;
    v_atendime.sn_baixo_peso_tiss := :new.sn_baixo_peso_tiss;
    v_atendime.sn_cesario_tiss := :new.sn_cesario_tiss;
    v_atendime.sn_recem_nato := :new.sn_recem_nato;
    v_atendime.sn_notificar_policia := :new.sn_notificar_policia;
    v_atendime.sn_custodia_policial := :new.sn_custodia_policial;
    v_atendime.cd_cid_obito := :new.cd_cid_obito;
    v_atendime.sn_normal_tiss := :new.sn_normal_tiss;
    v_atendime.sn_paga_acompanhante := :new.sn_paga_acompanhante;
    v_atendime.cd_setor_local_fscc := :new.cd_setor_local_fscc;
    v_atendime.sn_pacote := :new.sn_pacote;
    v_atendime.sn_pacote_day_clinic := :new.sn_pacote_day_clinic;
    v_atendime.nr_guia_envio_principal := :new.nr_guia_envio_principal;
    v_atendime.cd_procedimento := :new.cd_procedimento;
    v_atendime.cd_cbo_prestador := :new.cd_cbo_prestador;
    v_atendime.cd_carater_atendimento := :new.cd_carater_atendimento;
    v_atendime.cd_atendimento_integra := :new.cd_atendimento_integra;
    v_atendime.cd_procedimento_alta := :new.cd_procedimento_alta;
    v_atendime.cd_prestador_em_atendimento := :new.cd_prestador_em_atendimento;
    v_atendime.sn_relacao_trabalho := :new.sn_relacao_trabalho;
    v_atendime.sn_suspeita_epidemia := :new.sn_suspeita_epidemia;
    v_atendime.sn_reavaliacao := :new.sn_reavaliacao;
    v_atendime.nr_tag_atendimento := :new.nr_tag_atendimento;
    v_atendime.sn_internado := :new.sn_internado;
    v_atendime.nr_pre_natal := :new.nr_pre_natal;
    v_atendime.nr_autorizacao_gestor := :new.nr_autorizacao_gestor;
    v_atendime.tp_encaminhamento_obito := :new.tp_encaminhamento_obito;
    v_atendime.cd_protocolo := :new.cd_protocolo;
    v_atendime.cd_sintoma_avaliacao := :new.cd_sintoma_avaliacao;
    v_atendime.vl_escore := :new.vl_escore;
    v_atendime.cd_cor_referencia := :new.cd_cor_referencia;
    v_atendime.cd_res_lei_regulacao := :new.cd_res_lei_regulacao;
    v_atendime.cd_meio_transporte := :new.cd_meio_transporte;
    v_atendime.dh_alta_medica_lancada := :new.dh_alta_medica_lancada;
    v_atendime.dh_alta_lancada := :new.dh_alta_lancada;
    v_atendime.nm_usuario_autorizador := :new.nm_usuario_autorizador;
    v_atendime.cd_atendimento_original := :new.cd_atendimento_original;
    v_atendime.sn_seguro_complementar := :new.sn_seguro_complementar;
    v_atendime.sn_retencao_judicial := :new.sn_retencao_judicial;
    v_atendime.cd_sistema := :new.cd_sistema;
    v_atendime.cd_prestador_indicacao := :new.cd_prestador_indicacao;
    v_atendime.cd_senha_autorizacao := :new.cd_senha_autorizacao;
    --
    -- verifica se o atendimento já existe na tabela dbamv.complab
    BEGIN
        SELECT
            COUNT(*)
        INTO v_existe
        FROM
            mvintegra.complab c
        WHERE
            c.cd_atendimento = v_atendime.cd_atendimento;

    EXCEPTION
        WHEN OTHERS THEN
            v_existe := 0;
    END;
    --

    -- busca pelo paciente

    BEGIN
        SELECT
            p.*
        INTO v_paciente
        FROM
            dbamv.paciente p
        WHERE
            p.cd_paciente = v_atendime.cd_paciente;

    EXCEPTION
        WHEN OTHERS THEN
            dbamvfor.prc_insert_log_integracao(v_atendime.cd_atendimento, 'ATENDIME', 'ATENDIME', 'MVINTEGRA', v_ds_acao,
                                               substr(sqlerrm, 1, 190), 'Não foi possível encontrar o paciente');

            raise_application_error(-20000, sqlerrm);
    END;
    --

    IF inserting AND v_existe = 0 THEN
        BEGIN
            INSERT INTO mvintegra.complab (
                id_mvintegra,
                cd_ori_ate,
                cd_atendimento,
                cd_multi_empresa,
                dt_atendimento,
                hr_atendimento,
                cd_tip_situacao,
     --NM_CPF_TUTOR,
                cd_paciente,
                nm_paciente,
                tp_sexo,
                dt_nascimento_tutor,
                cd_cidadania,
                nr_cpf,
                cd_estado,
                cd_cidade,
                cd_naturalidade,
                ds_endereco,
                ds_complemento,
                nr_cep,
                nr_fone,
                nr_fone_comercial,
                tp_estado_civil,
                nm_pai,
                nm_mae,
                cd_profissao,
                escolaridade,
                flg_first_subs,
                record_date,
                flg_alert,
                dt_alert,
                flg_complab,
                dt_complab,
                setor_classificacao
            ) VALUES (
                mvintegra.seq_complab.nextval,
                v_atendime.cd_ori_ate,
                v_atendime.cd_atendimento,
                v_atendime.cd_multi_empresa,
                v_atendime.dt_atendimento,
                sysdate,
                v_atendime.cd_tip_situacao,
--a.nr_cpf_tutor,
                v_paciente.cd_paciente,
                v_paciente.nm_paciente,
                v_paciente.tp_sexo,
                v_paciente.dt_nascimento_tutor,
                v_paciente.cd_cidadania,
                v_paciente.nr_cpf,
                v_paciente.cd_naturalidade,
                v_paciente.cd_cidade,
                v_paciente.cd_naturalidade,
                v_paciente.ds_endereco,
                v_paciente.ds_complemento,
                v_paciente.nr_cep,
                v_paciente.nr_fone,
                v_paciente.nr_fone_comercial,
                v_paciente.tp_estado_civil,
                v_paciente.nm_pai,
                v_paciente.nm_mae,
                v_paciente.cd_profissao,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL,
                NULL
            );

        EXCEPTION
            WHEN OTHERS THEN
                dbamvfor.prc_insert_log_integracao(v_atendime.cd_atendimento, 'ATENDIME', 'ATENDIME', 'MVINTEGRA', v_ds_acao,
                                                   substr(sqlerrm, 1, 190), 'Erro ao inserir na tabela mvintegra.complab');
        END;
    END IF;
    --

    IF updating AND v_existe = 1 THEN
        BEGIN
            UPDATE mvintegra.complab c
            SET
                cd_ori_ate = v_atendime.cd_ori_ate,
                cd_multi_empresa = v_atendime.cd_multi_empresa,
                dt_atendimento = v_atendime.dt_atendimento,
                hr_atendimento = sysdate,
                cd_tip_situacao = v_atendime.cd_tip_situacao,
     --NM_CPF_TUTOR	=	--a.nr_cpf_tutor	,
                nm_paciente = v_paciente.nm_paciente,
                tp_sexo = v_paciente.tp_sexo,
                dt_nascimento_tutor = v_paciente.dt_nascimento_tutor,
                cd_cidadania = v_paciente.cd_cidadania,
                nr_cpf = v_paciente.nr_cpf,
                cd_estado = v_paciente.cd_naturalidade,
                cd_cidade = v_paciente.cd_cidade,
                cd_naturalidade = v_paciente.cd_naturalidade,
                ds_endereco = v_paciente.ds_endereco,
                ds_complemento = v_paciente.ds_complemento,
                nr_cep = v_paciente.nr_cep,
                nr_fone = v_paciente.nr_fone,
                nr_fone_comercial = v_paciente.nr_fone_comercial,
                tp_estado_civil = v_paciente.tp_estado_civil,
                nm_pai = v_paciente.nm_pai,
                nm_mae = v_paciente.nm_mae,
                cd_profissao = v_paciente.cd_profissao,
                escolaridade = NULL,
                flg_first_subs = NULL,
                record_date = NULL,
                flg_alert = NULL,
                dt_alert = NULL,
                flg_complab = NULL,
                dt_complab = NULL,
                setor_classificacao = NULL
            WHERE
                cd_atendimento = v_atendime.cd_atendimento
                AND cd_atendimento = v_atendime.cd_atendimento;

        EXCEPTION
            WHEN OTHERS THEN
                dbamvfor.prc_insert_log_integracao(v_atendime.cd_atendimento, 'ATENDIME', 'ATENDIME', 'MVINTEGRA', v_ds_acao,
                                                   substr(sqlerrm, 1, 190), 'Erro ao editar na tabela mvintegra.complab');
        END;
    END IF;
    --

EXCEPTION
    WHEN OTHERS THEN
        --
        IF inserting THEN
            v_ds_acao := 'INSERT';
        ELSIF updating THEN
            v_ds_acao := 'UPDATE';
        END IF;
        --
        dbamvfor.prc_insert_log_integracao(v_atendime.cd_atendimento, 'ATENDIME', 'ATENDIME', 'MVINTEGRA', v_ds_acao,
                                           substr(sqlerrm, 1, 190), 'Erro ao executar dbamv.trg_complab_insert');

END;