create database call_center;
go
 
use call_center;
go
 
create table dim_cliente (
  id_cliente      		int primary key identity,
  nome_completo   	varchar(200) not null,
  email           		varchar(50) not null,
  endereco        	varchar(200) not null,
  ddd_telefone    	int not null,
  num_telefone    	int not null,
  cidade          		varchar(100) not null,
  estado          		varchar(50) not null,
  data_nascimento	date not null,
  nome_mae        	varchar(200) not null,
  num_documento	varchar(20) not null,
)
 
create table dim_atendente (
  id_atendente      	int primary key identity,
  nome_atendente    	varchar(200) not null,
  num_documento     	varchar(20) not null,
  data_nascimento   	date not null,
  endereco          	varchar(200) not null,
  cidade            		varchar(50) not null,
  estado            		varchar(50) not null,
  data_contratacao 	date not null,
  data_desligamento	date,
  nivel_treinamento	varchar(50) not null,
)
 
create table dim_produto (
  id_produto        	int primary key identity,
  descricao_produto	varchar(20) not null,
)
 
create table dim_data (
  id_data         		int primary key identity,
  data_hora       	datetime not null,
  dia             		varchar(2) not null,
  mes             		varchar(2) not null,
  ano             		varchar(4) not null,
  dia_mes_ano		datetime not null,
  nome_dia_semana	varchar(6) not null,
  nome_mes        	varchar(20) not null,
  dia_util        		varchar(1) not null,
  semestre        	varchar(8) not null,
  trimestre		varchar(10)
)
 
create table dim_nps (
  id_nps	int primary key identity,
  desc_nps 	varchar(20) not null
)
 
create table dim_sla (
  id_sla            		int primary key identity,
  duracao		int not null,
  descricao_duracao 	varchar(20) not null
)
 
create table fato_ligacao (
  protocolo		varchar(10) primary key,
  id_data		int references dim_data(id_data) not null,
  id_data_fim     	int references dim_data(id_data) not null,
  id_cliente        	int references dim_cliente(id_cliente) not null,
  id_atendente 	int references dim_atendente(id_atendente) not null,
  id_nps            		int references dim_nps(id_nps) not null,
  id_produto        	int references dim_produto(id_produto) not null,
  id_sla            		int references dim_sla(id_sla) not null,
  status           		bit default 0,
  duracao_ligacao 	int not null
)
