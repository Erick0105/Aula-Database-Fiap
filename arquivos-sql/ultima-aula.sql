--Usando Agrupamento
SELECT uf , COUNT(uf) from cliente group by uf order by 1;



--Quantos vendedores existem por comissão?
SELECT * from VENDEDOR order by COMISSAO;

SELECT comissao, count(comissao) from vendedor group by comissao order by 2;



--Quantos pedidos existem por vendedor
SELECT cod_ven, COUNT(NUM_PEDIDO) from PEDIDO group by COD_VEN order by 2;


SELECT NOME_VEN, SALARIO_FIXO from VENDEDOR
where SALARIO_FIXO in (SELECT max(SALARIO_FIXO) from VENDEDOR);