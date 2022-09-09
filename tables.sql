SHOW databases;

USE callcenter; 



CREATE TABLE callcenter.dim_cliente (
    id_cliente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nome_completo VARCHAR(200) NOT NULL,
    email VARCHAR(50),
    endereco VARCHAR(100),
    ddd_telefone INT(2),
    num_telefone INT,
    cidade VARCHAR(200),
    estado VARCHAR(50),
    data_nascimento DATE,
    nome_mae VARCHAR(200),
    num_documento VARCHAR(20)
);



CREATE TABLE callcenter.dim_nps (
	id_nps INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    desc_nps VARCHAR(20)
);

CREATE TABLE callcenter.dim_produto (
	id_produto INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    desc_produto VARCHAR(20)
);


CREATE TABLE callcenter.dim_sla (
	id_sla INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    duracao_minutos INT,
    descricao_duracao VARCHAR(20)
);

CREATE TABLE callcenter.dim_atendente (
    id_atendente INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
	nome_atendente VARCHAR(200) NOT NULL,
    num_documento VARCHAR(20),
    data_nascimento DATE,
    endereco VARCHAR(100),
    estado VARCHAR(50),
    data_contratacao DATE,
    data_desligamento DATE,
    nivel_treinamento VARCHAR(50)
);

create table callcenter.dim_calendario (
  id_data         int UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  data_hora       datetime not null,
  data            DATE not null,
  hora            varchar(2) not null,
  minuto		  varchar(2) not null,
  dia             varchar(2) not null,
  mes             varchar(2) not null,
  ano             varchar(4) not null
  
);

create table callcenter.fato_ligacao (
  protocolo         int(20) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  id_data_inicio    int UNSIGNED,
  id_cliente        int UNSIGNED,
  id_atendente      int UNSIGNED,
  id_nps            int UNSIGNED,
  id_produto        int UNSIGNED,
  id_sla            int UNSIGNED,
  status            bit default 0,
  FOREIGN KEY (id_data_inicio) REFERENCES callcenter.dim_calendario(id_data),
  FOREIGN KEY (id_cliente) REFERENCES callcenter.dim_cliente(id_cliente),
  FOREIGN KEY (id_atendente) REFERENCES callcenter.dim_atendente(id_atendente),
  FOREIGN KEY (id_nps) REFERENCES callcenter.dim_nps(id_nps),
  FOREIGN KEY (id_produto) REFERENCES callcenter.dim_produto(id_produto),
  FOREIGN KEY (id_sla) REFERENCES callcenter.dim_sla(id_sla)
  );
