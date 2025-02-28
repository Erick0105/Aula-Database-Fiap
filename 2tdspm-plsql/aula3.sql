SET SERVEROUTPUT ON

DECLARE
    v_nome emp.ename%TYPE := 'Zé';
    v_valor NUMBER := 0;
    v_niver DATE := TO_DATE('01/05/2006', 'DD/MM/YYYY');
BEGIN
    SELECT ename, sal INTO v_nome, v_valor FROM emp WHERE sal > 3000;
    DECLARE 
        v_nome VARCHAR2(30) := 'Maria';
    BEGIN
        dbms_output.put_line(v_nome);
        v_valor := v_valor + 1;
    END;
/*
    v_valor := LENGTH(v_nome);
    dbms_output.put_line(v_nome || ' tem ' || v_valor || ' letras');
    DBMS_OUTPUT.PUT_LINE('Você nasceu dia ' || TO_CHAR(v_niver,'DD'));
    DBMS_OUTPUT.PUT_LINE('Era uma ' || TO_CHAR(v_niver,'day'));
    v_valor := ROUND(MONTHS_BETWEEN(SYSDATE,v_niver), 2);
    DBMS_OUTPUT.PUT_LINE('Você viveu ' || v_valor || ' meses');
*/
END;