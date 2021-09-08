--RELATORIO COMPLAB
select c.cd_paciente, c.ds_endereco||','||p.nr_endereco||','||p.ds_complemento ENDERECO, p.nm_bairro, ci.nm_cidade, c.* 
from mvintegra.complab c, dbamv.paciente p, 
dbamv.atendime a, dbamv.cidade ci 
where a.cd_paciente = p.cd_paciente
AND p.cd_cidade = ci.cd_cidade
AND c.cd_atendimento = a.cd_atendimento
AND a.cd_multi_empresa IN (1921, 1919, 1922)
AND a.dt_atendimento between '01/01/2021' and '12/01/2021';