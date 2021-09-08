--Script para primeiro acesso ao MV PORTARIA

Insert into dbamv.pt_portaria (cd_portaria,ds_portaria, ds_maquina, cd_multi_empresa)
values ('2','Portaria Central','LAPTOP-4PG1LTB3', 1);

insert into dbamv.pt_portaria_maquina (cd_portaria,ds_maquina)
values ('1','LAPTOP-4PG1LTB3');

select * from dbamv.pt_portaria_maquina;

select * from dbamv.pt_portaria;

select * from multi_empresas;