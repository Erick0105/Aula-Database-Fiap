/*Aula 6 - 14/10/24

Recriando Nosso sistema

Operadores de banco de dados

Criar um relatório que exiba todos os dados dos clientes de código 100 até 600(inclusive)
*/

--Tradicional: 
SELECT * FROM cliente where cod_clie >= 100 and cod_clie <= 600;

--Operador de Bd: between

SELECT * FROM CLIENTE where cod_clie BETWEEN 100 and 600;

--Crie um relatório que exiba o nome dos clientes que estejam no intervalo de "A" até "p"

SELECT * FROM CLIENTE where NOME_CLIE BETWEEN 'A' and 'Q';
-- Como a pessoa se chama Paula ela não apareceria se colocasse o P pq o nome dela não é somente "p"

--Gerar um relatório que mostra o nome do cliente o estado onde mora, desde que seja do estado: sp,rj,mg

--Metodo Tradicional
SELECT * FROM CLIENTE where uf='SP' or UF = 'RJ' or UF = 'MG';
--Operador de BD: in(list)
SELECT * from CLIENTE where UF in ('SP','RJ','MG');


--Crie um relatório que mostre os clientes de código: 870,110,830,157.
SELECT * from CLIENTE where COD_CLIE IN(870,110,830,157);

--Criar um relatório que mostre os clientes no intervalo de código entre 100 e 300 e 500 e 700;
SELECT * FROM CLIENTE where COD_CLIE BETWEEN 100 and 300 or COD_CLIE BETWEEN 500 and 750 ORDER BY 1;

--Quem são os produtos com unidade de medida: Kg, M?
SELECT * FROM PRODUTO where UNIDADE in('KG','M');

--Quais pedidos possume código entre 50 e 150 e são dos vendedores de código 209,101
SELECT * FROM PEDIDO where NUM_PEDIDO BETWEEN 50 and 150 and COD_VEN in(209,101) ORDER by COD_VEN;