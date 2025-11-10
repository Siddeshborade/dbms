DECLARE
    CURSOR c_up IS
        SELECT stud_id, total_mark
        FROM Student_Result
        WHERE dept = 'CSE'
        FOR UPDATE;
BEGIN
    FOR rec IN c_up
    LOOP
        UPDATE Student_Result
        SET total_mark = rec.total_mark + 5
        WHERE CURRENT OF c_up;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Marks updated.');
END;
/
