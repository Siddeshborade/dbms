DECLARE
    CURSOR c1 IS 
        SELECT name, total_mark FROM Student_Result;

    v_name Student_Result.name%TYPE;
    v_mark Student_Result.total_mark%TYPE;
BEGIN
    OPEN c1;
    LOOP
        FETCH c1 INTO v_name, v_mark;
        EXIT WHEN c1%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(v_name || ' - ' || v_mark);
    END LOOP;
    CLOSE c1;
END;
/
