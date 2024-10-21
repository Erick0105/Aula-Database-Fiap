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

--Exibir os dados do cliente "Flavio"

SELECT * from CLIENTE where UPPER(NOME_CLIE) = 'FLAVIO';
SELECT * from CLIENTE where lower(NOME_CLIE) = 'flavio';
SELECT * from CLIENTE where INITCAP(NOME_CLIE) = 'Flavio';

--SUBSTR(coluna, inicio da leitura, qtd de caracteres) 
SELECT NOME_CLIE, SUBSTR(NOME_CLIE,2,3) from CLIENTE;

--nova senha
SELECT SUBSTR(CEP,2,3) ||substr(CIDADE,2,2) ||SUBSTR(CNPJ,3,2) "Nova Senha" from CLIENTE;