--Drops de tabelas
drop table Ator cascade constraints;
drop table DVD cascade constraints;
drop table Loca cascade constraints;
drop table Ator cascade constraints;
drop table Cliente cascade constraints;
drop table Filme cascade constraints;
drop table Filme_Ator cascade constraints;
drop table Categoria cascade constraints;


--Criação da tabela Categoria
create table Categoria
    (CodCateg number(4) constraint pk_cod_categ primary key,
    Descricao varchar(50) constraint nn_desc not null);



--Criação da tabela Filme
create table Filme 
    (CodFilme number(4) constraint pk_cod_filme primary key,
    Titulo varchar(70) constraint nn_titulo not null,
    codcateg number(4) constraint fk_cod_cat references Categoria );
    


--Criação da tabela Filme_Ator
create table Filme_Ator
    (CodFilmAto number(4) constraint pk_cod_film_ator primary key,
    CodFilm number(4) constraint fk_cod_film references Filme);
    
    
    
--Criação da tabela Ator
create table Ator
    (Codator number(4) constraint pk_codator primary key,
    NomePopular varchar(50) constraint nn_nm_pp not null,
    NomeArtistico varchar(50),
    DataNasc date);    
    
    
    
--Criação da tabela DVD
create table DVD
    (NumDVD number(4) constraint pk_num_dvd primary key,
    Tipo char(1), 
    codfilme number(4) constraint fk_cod_filme references Filme );
    
    
    
--Criação da tabela Loca
create table Loca
    (CodLoca number(4) constraint pk_cod_loca primary key,
    DataRet date,
    DataDev date,
    NumDVD number(4) constraint fk_num_dvd references DVD );
    
    
    
--Criação da tabela Cliente
create table Cliente 
    (CodCli number(4) constraint pk_cod_cli primary key,
    Prenome varchar(50) constraint nn_prenome not null,
    Sobrenome varchar(50),
    Endereco varchar(70),
    Telefone varchar(20),
    CodLoca number(4) constraint fk_cod_loca references Loca);
    
    
    
--Inserção de valores da tabela Categoria
insert into Categoria (CodCateg,Descricao) values(11,'Comédia');
insert into Categoria (CodCateg,Descricao) values(21,'Drama');
insert into Categoria (CodCateg,Descricao) values(31,'Aventura');
insert into Categoria (CodCateg,Descricao) values(41,'Terror');



--Inserção de valores da tabela Filme
insert into Filme (CodFilme,Titulo,CodCateg) values(1,'Sai pra lá',11);
insert into Filme (CodFilme,Titulo,CodCateg) values(2,'Ajuda Eterna',21);
insert into Filme (CodFilme,Titulo,CodCateg) values(3,'Anjos Malditos',21);
insert into Filme (CodFilme,Titulo,CodCateg) values(4,'Pânico 2',41);
insert into Filme (CodFilme,Titulo,CodCateg) values(5,'Um dia de furia',31);
insert into Filme (CodFilme,Titulo,CodCateg) values(6,'Lente Cega',31);
insert into Filme (CodFilme,Titulo,CodCateg) values(7,'Sinais do Tempo',21);
insert into Filme (CodFilme,Titulo,CodCateg) values(8,'A melodia da vida',11);



--Inserção de valores da tabela Filme_ator
insert into Filme_Ator (CodFilmAto, CodFilm) values (1, 1);
insert into Filme_Ator (CodFilmAto, CodFilm) values (2, 2);
insert into Filme_Ator (CodFilmAto, CodFilm) values (3, 3);



--Inserção de valores da tabela Ator
insert into Ator (CodAtor,nomepopular,datanasc) values (1, 'brad pitt', '10-SEP-1986');
insert into Ator (CodAtor,nomepopular,nomeartistico,datanasc) values (2, 'Roberto Gómez Bolaños', 'Chaves', '02-OCT-1951');
insert into Ator (CodAtor,nomepopular,datanasc) values (3, 'Adam Sandler', '09-SEP-1966');



--Inserção de valores da tabela Dvd
insert into DVD (NumDVD,CodFilme,Tipo) values(100,1,'S');
insert into DVD (NumDVD,CodFilme,Tipo) values(200,1,'S');
insert into DVD (NumDVD,CodFilme,Tipo) values(300,1,'S');
insert into DVD (NumDVD,CodFilme,Tipo) values(400,2,'D');
insert into DVD (NumDVD,CodFilme,Tipo) values(500,3,'S');



--Inserção de valores da tabela Loca
insert into Loca (codloca,dataret,datadev,numdvd) values (1, '10-APR-2005', '20-APR-2005', 100);
insert into Loca (codloca,dataret,datadev,numdvd) values (2, '10-JUN-2006', '20-JUN-2006', 200);
insert into Loca (codloca,dataret,datadev,numdvd) values (3, '10-JUL-2007', '20-JUL-2007', 300);



--Inserção de valores da tabela Cliente
insert into Cliente (CodCli,Prenome,Sobrenome,Endereco,Telefone,codloca) values(11,'João','Silva','Rua da Cruz sem Pé','4444-1111',1);
insert into Cliente (CodCli,Prenome,Sobrenome,Endereco,Telefone,codloca) values(21,'Antônio','Ferreira','Av. da Vila Velha','6660-9333',1);
insert into Cliente (CodCli,Prenome,Sobrenome,Endereco,Telefone,codloca) values(31,'Fabio','Dias','Rua Antonio Vieira','2337-0393',2);
insert into Cliente (CodCli,Prenome,Sobrenome,Endereco,Telefone,codloca) values(41,'Andreia','Melo','Rua da Praia Bonita','8989-7777',3);
insert into Cliente (CodCli,Prenome,Sobrenome,Endereco,Telefone,codloca) values(51,'Murilo','Fontes','Av. dos Autonomistas','9090-9090',2);

commit;
alter table filme drop constraint FK_COD_CAT;
update categoria set codcateg = 8 where codcateg = 1;
update filme set codcateg = 8 where codcateg = 1;
alter table filme modify codcateg number(4) references categoria;


alter table filme add Sinopse varchar(300);

insert into Categoria (codcateg, descricao) values(12,'Ficção');


-- Resolver exercicio 6 ainda
delete from filme where titulo values('Anjos Malditos', 'A melodia da vida');