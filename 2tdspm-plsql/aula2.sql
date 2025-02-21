DECLARE 
    v_nome VARCHAR(30) := 'Pedregunda';
    v_sal NUMBER(7,2) := 1000.50;
    v_hoje DATE := SYSDATE;
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

