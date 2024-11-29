/*
    Demanda: KETER20241129174051DTB
    Objetivo: Criar modelagem das tabelas do módulo gerenciador de pessoas
*/

drop table if exists tb_pais;
drop table if exists tb_cor_raca;
drop table if exists tb_tipo_sanguineo;
drop table if exists tb_estado_civil;
drop table if exists tb_pessoa cascade;

create table if not exists tb_pais (
    code int auto_increment not null,
    nome varchar(100) not null,
    sigla varchar(2) not null,
    constraint pk_pais_code primary key (code)
);

create table if not exists tb_cor_raca (
    code int auto_increment not null,
    descricao varchar(100) not null,
    constraint pk_cor_raca_code primary key (code)
);

create table if not exists tb_tipo_sanguineo (
    code int auto_increment not null,
    descricao varchar(100) not null,
    constraint pk_tipo_sanguineo_code primary key (code)
);

create table if not exists tb_estado_civil (
    code int auto_increment not null,
    descricao varchar(100) not null,
    constraint pk_estado_civil_code primary key (code)
);

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
	constraint pk_pessoa_code primary key (code),
    constraint fk_pessoa_id_pais_nascimento foreign key (id_pais_nascimento) references tb_pais (code),
    constraint fk_pessoa_id_cor_raca foreign key (id_cor_raca) references tb_cor_raca (code),
    constraint fk_pessoa_id_tipo_sanguineo foreign key (id_tipo_sanguineo) references tb_tipo_sanguineo (code),
    constraint fk_pessoa_id_estado_civil foreign key (id_estado_civil) references tb_estado_civil (code)
);