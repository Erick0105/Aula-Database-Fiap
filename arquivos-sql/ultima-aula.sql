--Usando Agrupamento
SELECT uf , COUNT(uf) from cliente group by uf order by 1;



--Quantos vendedores existem por comissão?
SELECT * from VENDEDOR order by COMISSAO;

SELECT comissao, count(comissao) from vendedor group by comissao order by 2;



--Quantos pedidos existem por vendedor
SELECT cod_ven, COUNT(NUM_PEDIDO) from PEDIDO group by COD_VEN order by 2;


SELECT NOME_VEN, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO in (SELECT max(SALARIO_FIXO) from VENDEDOR);

--Funções caracteres

SELECT NOME_CLIE, UPPER(NOME_CLIE) "MAIUSCULO", lower(NOME_CLIE) "minusculo", INITCAP(NOME_CLIE) "1aº MAIUSCULO", LENGTH(NOME_CLIE) "Conta Caracter" from CLIENTE;