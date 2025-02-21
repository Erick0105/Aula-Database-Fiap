DECLARE 
    --Declarando variaveis com o ":=" e pegando informações da tabela como o tipo de data e tamnho dos dados presentes
    v_nome emp.ename%TYPE := 'Pedregunda';
    v_sal emp.sal%TYPE := 1000.50;
    v_hoje DATE := SYSDATE;
    v_agora v_hoje%TYPE := SYSDATE + 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_NOME || TO_CHAR(v_sal,'L9999.00'));
    
    --Fazendo uma consulta de uma valor apenas
    SELECT ename INTO v_nome FROM emp WHERE sal > 3000;
    v_hoje := v_hoje + 1;
    DBMS_OUTPUT.PUT_LINE(V_NOME);

    --Fazendo uma consulta de 2 valores
    SELECT ename, sal INTO v_nome, v_sal FROM emp WHERE sal > 3000;
    DBMS_OUTPUT.PUT_LINE(V_NOME || v_sal);
END;
/