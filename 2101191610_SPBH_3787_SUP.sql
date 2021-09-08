/*Estes scripts poderão auxiliar na busca para apontar os campos nas telas
envio cada um comentado para para onde aponta. Qualquer duvida pode me contatar.

Fernando Guarany - MV Fortaleza - fernando.guarany@mv.com.br*/

--Select abaixo para a nova tela a ser criada, este select traz as informações que a LOV da tela irá precisar
select cd_transportadora, nm_razao_social, nr_cgc_cpf from dbamv.transportadora_romaneio;

--Select abaixo para a nova tela a ser criada, este select traz as informações que a LOV da tela irá precisar
select cd_motorista, nm_motorista, nr_cpf_motorista from dbamv.motorista_romaneio;

--Select abaixo para a nova tela a ser criada, este select traz as informações que a LOV da tela irá precisar
select cd_veiculo, ds_modelo, ds_marca, ds_placa from dbamv.veiculo_romaneio;

--Select abaixo é mais voltado para a geração da nota de saida, mostrando o destino do transporte
select * from dbamv.destino_romaneio;

--Select para mostrar a origem do transporte
select * from dbamv.multi_empresas;