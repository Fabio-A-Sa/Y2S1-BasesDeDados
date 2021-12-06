PRAGMA foreign_keys = OFF;
BEGIN TRANSACTION;

DROP TABLE IF EXISTS Kaoots;

CREATE TABLE Kaoots (
    Data date,
    Acertadas INTEGER,
    Total INTEGER,
    Pontos INTEGER,
    CHECK (Acertadas <= Total)
);

COMMIT TRANSACTION;