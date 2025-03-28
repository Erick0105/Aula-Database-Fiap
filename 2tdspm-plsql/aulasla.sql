SET SERVEROUTPUT ON
DECLARE 
BEGIN
    FOR v_record IN (SELECT  ename, sal, sal * 1.10 novo FROM emp)
    LOOP
        DBMS_OUTPUT.PUT_LINE(v_record.ename || ' tem o salário de ' || v_record.sal);
        DBMS_OUTPUT.PUT_LINE('O novo salário é ' || v_record.novo);
    END LOOP;
END;