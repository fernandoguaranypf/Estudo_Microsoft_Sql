create or replace TRIGGER dbamv.trg_subs_caracter_esp BEFORE
    UPDATE OR INSERT OR DELETE ON dbamv.endereco_paciente
    REFERENCING
            NEW AS new
            OLD AS old
    FOR EACH ROW
BEGIN
    :new.ds_endereco := translate(:new.ds_endereco, '.-!"''#¿$%().:[/]{}¨+?;ºª°§&*<>¿', 'NAEIOUAEIOUAEIOUAOAEIOUCnaeiouaeiouaeiouaoaeioucA');
    :new.ds_complemento := translate(:new.ds_complemento, '.-!"''#¿$%().:[/]{}¨+?;ºª°§&*<>¿', 'NAEIOUAEIOUAEIOUAOAEIOUCnaeiouaeiouaeiouaoaeioucA');
    :new.nm_bairro := translate(:new.nm_bairro, '.-!"''#¿$%().:[/]{}¨+?;ºª°§&*<>¿', 'NAEIOUAEIOUAEIOUAOAEIOUCnaeiouaeiouaeiouaoaeioucA');
END;
