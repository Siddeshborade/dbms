DECLARE
    v_rows NUMBER;
BEGIN
    INSERT INTO Student_Result (stud_id, name, dept, total_mark)
    VALUES (101, 'Asha Patil', 'CSE', 455);

    v_rows := SQL%ROWCOUNT;

    DBMS_OUTPUT.PUT_LINE('Rows Inserted: ' || v_rows);
END;
/
