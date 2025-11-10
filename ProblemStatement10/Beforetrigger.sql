CREATE OR REPLACE TRIGGER trg_del_books
BEFORE DELETE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    VALUES (:OLD.AccNo, :OLD.Title, :OLD.Author,
            :OLD.Publisher, :OLD.Count);
END;
/
