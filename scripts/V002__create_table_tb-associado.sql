/*
    Demanda: KETER20241129174051DTB
    Objetivo: Criar modelagem das tabelas do módulo gerenciador de associados
*/

drop table if exists tb_associado cascade;

create table if not exists tb_associado (
	code int auto_increment not null,
	id_pessoa int null,
    id_endereco int null,
    id_contato int null,
    id_documento int null,
    nome_completo varchar(200) not null,
    matricula date null,
    data_inicial_associacao date null default now(),
    data_final_associacao date null,
    e_ativo boolean not null,
	constraint pk_associado_code primary key (code)
);