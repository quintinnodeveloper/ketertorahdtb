/*
    Demanda: KETER20241129174051DTB
    Objetivo: Criar modelagem das tabelas do módulo gerenciador de pessoas
*/

drop table if exists tb_pessoa cascade;
create table if not exists tb_pessoa (
	code int auto_increment not null,
	descricao_tipo_pessoa enum("pessoa_fisica", "pessoa_juridica") not null,
	id_pais_nascimento int null,
    id_cor_raca int null,
    id_tipo_sanguineo int null,
    id_estado_civil int null,
    nome_completo varchar(200) not null,
    data_nascimento date null,
    e_ativo boolean not null,
	constraint pk_pessoa_code primary key (code)
);