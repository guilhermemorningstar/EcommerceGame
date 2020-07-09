CREATE DATABASE ecommercegame;
USE ecommercegame;

CREATE TABLE Tipo_Pessoa(
idTipoPessoa int primary key not null auto_increment,
Descricao_TipoPessoa varchar(20)

);

CREATE TABLE Pessoa(
idPessoa int primary key not null auto_increment,
nome text not null,
rg_cliente varchar(9)not null,
cpf_cliente VARCHAR(11)not null,
pessoa_idTipoPessoa int,
FKPessoa int,
foreign key (FKPessoa) references Tipo_Pessoa (idTipoPessoa)
);

CREATE TABLE Cliente(
id_cliente int primary key not null auto_increment,
nome text not null,
nome_do_pai text,
nome_da_mae text,
nick varchar(10),
senha int(7) not null,
FKPessoa integer,
FKTipoPessoa integer,
foreign key (FKTipoPessoa) references Tipo_pessoa (idTipoPessoa),
foreign key (FKPessoa) references Pessoa (idPessoa)
);

CREATE TABLE TipoLocal(
idTipoLocal int primary key not null auto_increment,
Descricao_TipoLocal varchar(30)
);

CREATE TABLE Contato(
idContato int primary key not null auto_increment,
telefone varchar(10) not null,
email varchar(30) not null,
FKTipoLocal int,
FKPessoa int,
foreign key (FKTipoLocal) references TipoLocal (idTipoLocal),
foreign key (FKPessoa) references Pessoa (idPessoa)
);

CREATE TABLE Endereco(
idEndereco int primary key not null auto_increment,
Logradouro_Endereco varchar(70),
Nuemro_Endereco integer,
Complemento_Endereco varchar(100),
Bairro_Endereco char,
CEP_Endereco varchar (9),
Cidade_Endereco varchar (30),
Estado_Endereco char(2),
FKTipoLocal int,
FKPessoa int,
foreign key (FKTipoLocal) references Tipolocal (idTipoLocal),
foreign key (FKPessoa) references Pessoa (idPessoa)
);

CREATE TABLE Jogos(
id_jogo int primary key not null auto_increment,
Nome_Jogo varchar(50) not NULL,
Descricao_Jogo text not null,
Genero_Jogo VARCHAR(30) not null,
Produtora_Jogo varchar(100) not null,
FKCliente int,
foreign key (FKCliente) references Cliente (id_cliente)
);

CREATE TABLE VideoGame(
id_video_game int primary key not null auto_increment,
Modelo_VideoGame varchar(30) not null,
NS_VideoGame varchar(24) not null
);

CREATE TABLE Funcionario(
id_funcionario int primary key not null auto_increment,
nome varchar(50) not null,
sexo char, 
nascimento date not null,
FKPessoa int,
foreign key (FKPessoa) references Pessoa(idPessoa)
);

CREATE TABLE Aluguel(
idAluguel int primary key not null auto_increment,
Valor_Aluguel Real,
Data_Aluguel Date,
FKFuncionario int,
FKCliente int,
FKJogos int,
FKVideoGame int,
foreign key (FKFuncionario) references Funcionario (id_Funcionario),
foreign key (FKCliente) references Cliente (id_cliente) ,
foreign key (FKJogos) references Jogos (id_Jogo),
foreign key (FKVideoGame) references VideoGame (id_video_game)
);

SHOW TABLES;
DESCRIBE Cliente;
DESCRIBE Jogos;
DESCRIBE VideoGame;
DESCRIBE Funcionario;
DESCRIBE Aluguel;
DESCRIBE Pessoa;
DESCRIBE Contato;
DESCRIBE Tipo_Pessoa;
DESCRIBE TipoLocal;
DESCRIBE Endereco;

