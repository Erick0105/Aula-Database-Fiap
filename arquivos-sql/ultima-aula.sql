--Usando Agrupamento
SELECT uf , COUNT(uf) from cliente group by uf order by 1;



--Quantos vendedores existem por comissão?
SELECT * from VENDEDOR order by COMISSAO;

SELECT comissao, count(comissao) from vendedor group by comissao order by 2;



--Quantos pedidos existem por vendedor
SELECT cod_ven, COUNT(NUM_PEDIDO) from PEDIDO group by COD_VEN order by 2;


SELECT NOME_VEN, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO in (SELECT max(SALARIO_FIXO) from VENDEDOR);

--Exibir o nome do vendedor que tem o maior e menor salários
SELECT NOME_VEN, SALARIO_FIXO from VENDEDOR where SALARIO_FIXO in 
(SELECT max(SALARIO_FIXO) from VENDEDOR, SELECT min(SALARIO_FIXO) from VENDEDOR);

SELECT * from CLIENTE where COD_CLIE IN(870,110,830,157);

--Funções caracteres

SELECT NOME_CLIE, UPPER(NOME_CLIE) "MAIUSCULO", lower(NOME_CLIE) "minusculo", INITCAP(NOME_CLIE) "1aº MAIUSCULO", LENGTH(NOME_CLIE) "Conta Caracter" from CLIENTE;

--Exibir os dados do cliente "Flavio"

SELECT * from CLIENTE where UPPER(NOME_CLIE) = 'FLAVIO';
SELECT * from CLIENTE where lower(NOME_CLIE) = 'flavio';
SELECT * from CLIENTE where INITCAP(NOME_CLIE) = 'Flavio';

--SUBSTR(coluna, inicio da leitura, qtd de caracteres) 
SELECT NOME_CLIE, SUBSTR(NOME_CLIE,2,3) from CLIENTE;

--nova senha
SELECT SUBSTR(CEP,2,3) ||substr(CIDADE,2,2) ||SUBSTR(CNPJ,3,2) "Nova Senha" from CLIENTE;

-- Junção de tabelas

/*
Inner join = igualdade
left join = igualdade e diferença a esquerda
right join = igualdade e diferença a direita
*/

drop table cargo CASCADE CONSTRAINTs;
drop TABLE FUNCIONARIO CASCADE CONSTRAINTS;

create table cargo (id_cargo number(2) primary key,
                    nm_cargo varchar(20) not null unique,
                    salario number(10,2));
insert into cargo values (1,'DBA', 25000);
insert into cargo values (2,'prog Java', 20000);
insert into cargo values (3,'Analista de Sist', 20000);
insert into cargo values (4,'Estágio', 6000);
commit;

create table FUNCIONARIO (id_fun number(2) PRIMARY KEY,
                            nm_fun VARCHAR(20) not NULL,
                            FK_CARGO REFERENCES cargo);

insert into FUNCIONARIO values (1, 'Marcel', 1);
insert into FUNCIONARIO values (2, 'Roberta', 1);
insert into FUNCIONARIO values (3, 'Juliano', 2);
insert into FUNCIONARIO values (4, 'Carmem', 3);
insert into FUNCIONARIO values (5, 'Ricardo', NULL);
commit;

--Aqui é só a igualdade
SELECT nm_fun, NM_CARGO from FUNCIONARIO Inner join cargo on id_cargo = FK_CARGO;

--Aqui é o lado esquerdo mais a igualdade
SELECT nm_fun, NM_CARGO from FUNCIONARIO left join cargo on id_cargo = FK_CARGO;
--Aqui é o lado direito mais a igualdade
SELECT nm_fun, NM_CARGO from FUNCIONARIO right join cargo on id_cargo = FK_CARGO;