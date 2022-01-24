-- Created on January, 2022
-- @author: Fábio Araújo de Sá

CREATE TRIGGER example
AFTER UPDATE OF cName ON college
FOR EACH ROW
BEGIN
    UPDATE Apply
    SET cName = NEW.cName
    WHERE cName = OLD.cName;
END;

INSERT INTO CSEE VALUES (111, 'Berkeley', 'CS');

CREATE TRIGGER CSEEinsert
INSTEAD OF INSERT ON CSEE
FOR EACH ROW
BEGIN
    INSERT INTO Apply
    VALUES (NEW.sID, NEW.cName, NEW.major, NULL);
END;

CREATE INDEX courseIDX on Exam(course_code); --> cria um index, para melhorar a performance caso
                                             --> o atributo de course_code for muito usado no sistema

-- Notes:
-- Index baseado em igualdade -> usa HashTables
-- Index baseado em comparações -> usa B-Trees