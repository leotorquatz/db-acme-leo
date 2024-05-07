create database db_acme_leonardo;

use db_acme_leonardo;

create table tbl_classificacao(
id int not null auto_increment primary key,
faixa_etaria varchar(2) not null,
classificacao varchar(45)not null,
caracteristica varchar(100)not null,
icone varchar(45)not null
);

desc tbl_classificacao;

ALTER TABLE tbl_classificacao MODIFY icone VARCHAR(100) NOT NULL;


insert into tbl_classificacao( faixa_etaria, classificacao, caracteristica, icone) values
(
"L",
"Livre",
"Não expõe crianças a conteúdo potencialmente prejudiciais",
"https://logodownload.org/wp-content/uploads/2017/07/classificacao-livre-logo.png"
);



create table tbl_sexo(
id int not null auto_increment primary key,
sigla varchar(1) not null,
nome varchar(15) not null
);

insert into tbl_sexo(sigla, nome) values("M","masculino");
insert into tbl_sexo(sigla, nome) values("F","feminino");
insert into tbl_genero(nome) values("terror");

select * from tbl_genero;

create table tbl_genero(
id int not null auto_increment primary key,
nome varchar(45) not null
);

create table tbl_nacionalidade(
id int not null auto_increment primary key,
nome varchar(45)
);


create table tbl_filme(
id int not null auto_increment primary key,
nome varchar(80) not null,
sinopse text not null,
duracao time not null,
data_lancamento date not null,
data_relancamento date,
foto_capa varchar(200) not null,
valor_unitario float,
diponibilidade boolean,
tbl_classificacao_id int,

constraint FK_CLASSIFICACAO_FILME
foreign key(tbl_classificacao_id)
references tbl_classificacao(id),

unique key(id),
unique index(id)
);

create table tbl_ator(
id int not null auto_increment primary key,
nome varchar(100) not null,
nome_artistico varchar(100),
data_nascimento date not null,
data_falescimento date,
biografia text not null,
foto varchar(150),
id_sexo int,

constraint FK_SEXO_ATOR
foreign key (id_sexo)
references tbl_sexo (id)

);

create table tbl_diretor(
id int not null auto_increment primary key,
nome varchar(100) not null,
data_nascimento date not null,
data_falescimento date,
biografia text not null,
foto varchar(150),
id_sexo int,

constraint FK_SEXO_DIRETOR
foreign key (id_sexo)
references tbl_sexo (id)

);

create table tbl_filme_genero(
id int not null auto_increment primary key,
id_filme int,
id_genero int,

constraint FK_FILME_FILMEGENERO
foreign key (id_filme)
references tbl_filme (id),

constraint FK_GENERO_FILMEGENERO
foreign key (id_genero)
references tbl_genero (id)
);

create table tbl_filme_ator(
id int not null auto_increment primary key,
id_filme int,
id_ator int,

constraint FK_FILME_FILMEATOR
foreign key (id_filme)
references tbl_filme (id),

constraint FK_ATOR_FILMEATOR
foreign key (id_ator)
references tbl_ator (id)
);

create table tbl_ator_nacionalidade(
id int not null auto_increment primary key,
id_ator int,
id_nacionalidade int,

constraint FK_ATOR_ATORNACIONALIDADE
foreign key (id_ator)
references tbl_ator (id),

constraint FK_NACIONALIDADE_ATORNACIONALIDADE
foreign key(id_nacionalidade)
references tbl_nacionalidade (id)
);

create table tbl_diretor_nacionalidade(
id int not null auto_increment primary key,
id_diretor int,
id_nacionalidade int,

constraint FK_DIRETOR_DIRETORNACIONALIDADE
foreign key (id_diretor)
references tbl_diretor (id),

constraint FK_NACIONALIDADE_DIRETORNACIONALIDADE
foreign key(id_nacionalidade)
references tbl_nacionalidade (id)
);

drop table tbl_filme;
drop table tbl_nascionalidade;

show tables;

desc tbl_filme;


insert into tbl_filme(nome, sinopse, duracao, data_lancamento,data_relancamento, foto_capa, valor_unitario, diponibilidade, tbl_classificacao_id)
values
(
"O Grande Mistério do Bosque",
 "Um thriller psicológico que revela os segredos sombrios de uma floresta assombrada.",
 "02:30:00",
 "2022-08-25",
 null,
 "https://exemplo.com/foto_bosque.jpg",
 "19.90",
 true,
 "1"
 );
 select * from tbl_filme;