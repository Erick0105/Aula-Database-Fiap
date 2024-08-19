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