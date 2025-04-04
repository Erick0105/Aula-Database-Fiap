SET SERVEROUTPUT ON

DECLARE
    v_nome emp.ename%TYPE := 'Ana';
    v_num NUMBER := 0;
BEGIN
    SELECT sal/0 INTO v_num
        FROM emp where ename = 'KING';
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Verifique sua consulta');
    ROLLBACK;
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Sugiro que use um cursor');
    ROLLBACK;
    WHEN ZERO_DIVIDE THEN
        DBMS_OUTPUT.PUT_LINE('Estúpido');
    ROLLBACK;
END;
/