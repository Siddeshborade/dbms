DECLARE
    CURSOR c_dept(p_dept VARCHAR2) IS
        SELECT stud_id, name, total_mark
        FROM Student_Result
        WHERE dept = p_dept;

    v_d Student_Result.dept%TYPE := '&Department';
BEGIN
    FOR rec IN c_dept(v_d)
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec.stud_id || ' - ' ||
                             rec.name  || ' - ' ||
                             rec.total_mark);
    END LOOP;
END;
/
