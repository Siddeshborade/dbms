CREATE OR REPLACE TRIGGER trg_upd_books
AFTER UPDATE ON Books
FOR EACH ROW
BEGIN
    INSERT INTO Library_Audit
    VALUES (:NEW.AccNo, :NEW.Title, :NEW.Author,
            :NEW.Publisher, :NEW.Count);
END;
/
