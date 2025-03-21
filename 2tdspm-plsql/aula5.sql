DECLARE 
    v_maior emp.sal%TYPE :=0;
    v_emp emp.empno%TYPE :=0;
    v_cont NUMBER :=1;
BEGIN
    SELECT MAX(sal), MAX(empno) INTO v_maior, v_emp from emp;
    IF v_maior > 3000 THEN
        WHILE v_cont < 5 LOOP
            INSERT INTO EMP (EMPNO, SAL)
            VALUES (v_emp + v_cont, v_maior);
            v_cont := v_cont + 1;
        END LOOP;
    END IF;
END;
/* Loop com for
        FOR i IN 1..4 LOOP
            INSERT INTO EMP (EMPNO, SAL)
            VALUES (v_emp + i, v_maior);
        END LOOP;
*/
/* Swich Case

Case v_deptno
    WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 10');
    WHEN 20 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 20');
    WHEN 30 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 30');
    WHEN 40 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 40');
    WHEN 50 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 50');
    WHEN 60 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 60');
    WHEN 70 THEN DBMS_OUTPUT.PUT_LINE('Você escolheu 70');
    ELSE DBMS_OUTPUT.PUT_LINE('Tente Novamente');
*/