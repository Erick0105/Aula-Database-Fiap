-- Rm 556862 - Erick / Rm 556864 - Luiz Henrique

--Drops 
DROP TABLE Funcionario CASCADE CONSTRAINT; 
DROP TABLE Departamento CASCADE CONSTRAINT; 



-- Creates 
CREATE TABLE DEPARTAMENTO(
  Codigo NUMBER(3), --PK
  Nome VARCHAR2(40), --nn
  Localizacao VARCHAR2(50) --nn
);

CREATE TABLE FUNCIONARIO(
    Codigo NUMBER(4), --PK
    PrimerioNome VARCHAR2(20), --nn
    SegundoNome VARCHAR2(20),
    UltimoNome VARCHAR2(20), --nn
    DataNasci DATE, --nn
    CPF NUMBER(11), --nn
    RG VARCHAR2(9), --nn 
    Endereco VARCHAR2(30), --nn
    CEP NUMBER(7), --nn
    Cidade VARCHAR2(50), --nn
    Fone NUMBER(11), --nn
    Funcao VARCHAR2(20),
    Salario NUMBER(4),
    DtAdm DATE,
    CodigoDepartamento NUMBER(3)
);


--Inserts de regras nas tabelas

--Alteração da PRIMARY KEY
ALTER TABLE DEPARTAMENTO ADD PRIMARY KEY (Codigo);
ALTER TABLE FUNCIONARIO add PRIMARY KEY (Codigo);

--Alteração do NOT NULL
ALTER TABLE DEPARTAMENTO MODIFY Nome CONSTRAINT N_NN NOT NULL;
ALTER TABLE DEPARTAMENTO MODIFY Localizacao CONSTRAINT LOCA_NN NOT NULL;

alter table FUNCIONARIO modify PrimerioNome constraint PN_NN not null;
alter table FUNCIONARIO modify UltimoNome constraint UN_NN not null;
AlTER TABLE FUNCIONARIO MODIFY DataNasci CONSTRAINT DN_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY CPF CONSTRAINT CPF_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY RG CONSTRAINT RG_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY Endereco CONSTRAINT End_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY CEP CONSTRAINT CEP_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY Cidade CONSTRAINT Cidade_NN NOT NULL;
AlTER TABLE FUNCIONARIO MODIFY FONE CONSTRAINT FONE_NN NOT NULL;


--Alteração do REFERENCES
ALTER TABLE FUNCIONARIO add FOREIGN KEY (CodigoDepartamento) REFERENCES DEPARTAMENTO(Codigo);



--Inserts de dados

--Inserts dentro de Departamento
Insert into DEPARTAMENTO VALUES (01, 'administrativo', 'Minas Gerais');
Insert into DEPARTAMENTO VALUES (02, 'financeiro', 'São Paulo');
Insert into DEPARTAMENTO VALUES (03, 'pessoal', 'Bahia' );
Insert into DEPARTAMENTO VALUES (04, 'comercial', 'Rio de Janeiro' );
Insert into DEPARTAMENTO VALUES (05, 'marketing', 'São Paulo');

INSERT into FUNCIONARIO VALUES (1, 'Mel', 'Faro', 'Amorim', '21-OCT-2005', 58277236140 , '232132423', 'Rua Armando Conti', 0690000, 'São Paulo',79928777172, 'Professor', 2000, '20-OCT-2012',1);
INSERT into FUNCIONARIO VALUES (5, 'Antônio', 'Chaves', 'Jr', '11-OCT-1998', 87658261599 , '321545431','Rua Armando Conti',0690430,'Rio de Janeiro', 65935154891,'Adm', 5000 , '20-OCT-1950', 3);
INSERT into FUNCIONARIO VALUES (4, 'Aaron', 'Caldeira', 'Correia', '01-OCT-1975', 24336211949 , '543543567','Rua Armando Conti',0690230, 'Rio grande do Sul', 83922701733,'Diretor', 6000, '05-OCT-2012', 5);
INSERT into FUNCIONARIO VALUES (3, 'Patrícia', 'Zilda', 'Duarte', '19-OCT-2000', 35585575732 , '232132423','Rua Armando Conti',0690130, 'Bahia', 95932155541,'Zelador', 1000, '10-OCT-2012', 2);
INSERT into FUNCIONARIO VALUES (2, 'Carolina', 'Corona', 'Sanches', '12-OCT-1979', 00791620964 , '232132423', 'Rua Armando Conti' ,0690030, 'São Paulo', 79921053523,'Dev', 2000 , '30-OCT-2015',4);

--Update de dados qualquer em qualquer tabela
update FUNCIONARIO set DataNasci = '08-OCT-2005' where Codigo = 1;

--Select de nome e sobrenome ordenado por sobrenome

SELECT PrimerioNome, SegundoNome FROM FUNCIONARIO ORDER BY SegundoNome;

--Select de tudo do Funcionario ordenado por cidade, que moram em RJ,SP e BH

SELECT * from FUNCIONARIO WHERE CIDADE = 'São Paulo' or CIDADE = 'Rio de Janeiro' or CIDADE = 'Bahia' order BY CIDADE;

--Select de Funcionarios com salário superior a R$1.000 e DataNasci entre 1970 e 1980, ordenado pelo nome

SELECT * from FUNCIONARIO WHERE SALARIO > 1000 AND DataNasci >= '01-JAN-1970' and DataNasci <= '31-DEC-1980' ORDER BY PrimerioNome;