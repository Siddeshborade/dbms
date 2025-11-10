BEGIN
    FOR rec IN (SELECT stud_id, name, dept, total_mark FROM Student_Result)
    LOOP
        DBMS_OUTPUT.PUT_LINE(rec.stud_id || ' - ' ||
                             rec.name || ' - ' ||
                             rec.total_mark);
    END LOOP;
END;
/
