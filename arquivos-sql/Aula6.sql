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

