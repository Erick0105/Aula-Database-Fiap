Aula 1 - 19 /08/24

-- comentários de linha
/* comentários várias linhas*/

Parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
        -- nome da Entidade / tipo / Quantidade / Chave primaria
        mat_fun - N - 4 - Pk
        nm_fun - A - 30 - Nn
        dt_adm - D - Nn
        salario - N - 8,2
        sexo - C - 1 - Nn
        /* 
        N - Tipo Number 
        A - Tipo Varchar
        D - Tipo Data
        C - Tipo Char
        -----
        O PK significa chame primaria
        Nn é Not Null significa que é obrigatoria o preenchimento
        */
        
Criando tabelas:
Sintaxe create table table_name (column_name1 datatype(size) [constraint],
                                column_name2 datatype(size) [constraint],
                                ..............);
                                
-- constraint é opcional, nem todas as colunas tem 

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;
-- desc vem de Descrição se a tabela existir ele geral uma estrura igual a de cima do func
desc funcionario;

criando a tabela funcionário:

create table funcionario (mat_fun Number(4) Primary Key,
                          nm_fun varchar(30) Not null,
                          dt_adm Date Not null,
                          salario Number(10,2),
                          sexo Char(1) Not null);
                          
desc funcionario;

Relacionamentos: 1 - N - criando a FK

Tabela: Cargo - cd_cargo - N - 4 - Pk
                nm_cargo - A - 25 - Nn, Uk
                salario - N - 8,2

Tabela: Funcionario, já existe???? vamos apagar
Apagando uma tabela sem relacionamento

sintaxe: drop table table_name

drop table funcionaro_2024;

create table cargo (
cd_cargo number(4) constraint cargo_cd_pk Primary Key,
nm_cargo varchar(25) constraint cargo_nm_nn Not Null
                     constraint cargo_nm_uk unique,
salario number(10,2));


create table funcionario_2024 (
mat_fun Number(4) constraint func_mat_pk Primary Key,
nm_fun varchar(30) constraint func_nm_nn Not null,
dt_adm Date constraint func_dt_nn Not null,
salario Number(10,2),
sexo Char(1) constraint func_sx_nn Not null,
fk_cargo number(4) constraint func_cargo_fk references cargo);

-- fk: column_name datatype(syze) [constraint] references table_name
-- references é a criação da foreign key(fk) ou chave estrangeira

create table Venda(
num_venda number(6) constraint venda_num_pk Primary key,
dt_venda date constraint venda_dt_nn not null,
ttl_venda number(10,2) constraint venda_ttl_nn not null
)

create table Peca (
id_peca Number(6) constraint peca_id_pk Primary Key,
nm_peca varchar(50) constraint peca_nm_nn Not Null
                    constraint peca_nm_pk unique,
qtd_peca number(6,2) constraint peca_qtd_nn not null,
preco_peca number(8,2)
fk_venda number(6) constraint venda_num_fk references Venda
)

Aula 2 - criando relacionamento 1 - 1

Create table pessoa1 (cod_pess1 number(3) primary key,
                        nm_pess1 varchar(30) not null);

Create table pessoa2 (cod_pess2 number(3) primary key,
                        nm_pess1 varchar(30) not null,
                        fk_pess number(3) unique references pessoa1);

DML - Alteração de estrutura - tabela

sintaxe: alter table table_name.....
variações: incluir coluna: add column_name
            incluir constraint: add constraint constraint_name
            modificar tipo de dados: modify
            modificar tamanho: modify
            apagar coluna: drop column column_name
            apagar constraint: drop constraint constraint_name
            renomear coluna: rename column
            
drop table teste cascade constraints;

create table teste (nome number(4));

- incluir na tabela teste a coluna código de tipo numérica com 4 posições.
desc teste;
alter table teste add codigo number(4);

- incluir na coluna código da tabela teste a pk.
alter table teste add constraint teste_cd_pk primary key (codigo);
desc teste;

- alterar o tipo de dados da coluna nome para alfanumérico com 30 posições
alter table teste modify nome varchar(30);
desc teste;

- altere o tamanho da coluna nome para 45 posições
alter table teste modify nome varchar(45);
desc teste;

- apagar a pk da coluna código
alter table teste drop constraint teste_cd_pk;
desc teste;

- apagar a coluna na código da tabela teste
alter table teste drop column codigo;
desc teste;

- renomear a coluna nome para nome_cliente.
alter table teste rename column nome to nome_cliente;
desc teste;

- incluir a regra not null na coluna nome_cliente
alter table teste modify nome_cliente 
constraint teste_nome_nn not Null;
desc teste;

DML - Data Manipulation Language - Dados

Novas linhas
sintaxe: insert into table_name values (value_column1,....., value_columnN);
            insert into table_name (name_column1,.....,name_columnN)
            values (value_column1,....., value_columnN);
            
usando nulo = null
dados não numéricos precisam de ''

Exemplificar

desc cargo;
insert into cargo values (1,'prog. Java',10000);
-- visualizando dados
select * from cargo;
insert into cargo values (2, 'DBA',12500.80);

incluir os seguintes dados na tabela cargo
3 - CEO - 25000
4 - Adm Redes - 8500
5 - Estágio - 33000

insert into cargo values (3,'CEO',25000);
insert into cargo values (4,'Adm Redes',8500);
insert into cargo values (5,'Estagiario',33000);

caso não tenha dados para uma ou mais colunas????

6 - Adm. Seg - null
select * from cargo;
desc cargo;
versão 1: insert into cargo values (6,'Adm. Seg',null);
versão 2: insert into cargo (cd_cargo,nm_cargo) values(7,'Adm Seg');
commit;

drop table Tipo_Prod;
create table Tipo_Prod (cd_tipo number(4) constraint tp_cd_pk primary key,
                        nm_tipo varchar(40) constraint tp_nm_nn Not Null);

drop table Produto;
create table Produto (cd_prod number(6) constraint pd_cd_pk primary key,
                        nm_prod varchar (40) constraint pd_nm_nn Not null,
                        fk_Tipo_Prod_cd_tipo number(4) constraint pd_fk_uk unique references Tipo_Prod);
                        
drop table Compra;
create table Compra (cd_compra number(4) constraint cp_cd_pk primary key,
                    dt_compra date constraint cp_dt_nn not null);
                    
drop table Comp_Prod_Tem;
create table Comp_Prod_Tem(fk_compra_cd_compra number(4) constraint cpt_ccc_re references Compra,
                            fk_prod_cd_prod number(4) constraint cpt_pcp_re references Produto);
                            
commit;