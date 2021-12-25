PRAGMA foreign_keys = OFF;
BEGIN TRANSACTION;

.mode columns
.headers on
.nullvalue NULL

DROP TABLE IF EXISTS Kaoots;

CREATE TABLE Kaoots (
    Data date,
    Acertadas INTEGER,
    Total INTEGER,
    Pontos INTEGER,
    CHECK (Acertadas <= Total)
);

INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-04", 9, 15, 5993);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-08", 3, 4, 2127);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-11", 4, 4, 3446);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-15", 3, 4, 2212);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-18", 4, 4, 3242);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-22", 3, 4, 2128);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-25", 4, 4, 2970);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-29", 3, 4, 2135);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-12-02", 3, 4, 1935);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-06", 1, 4, 842);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-09", 2, 4, 1172);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-13", 3, 4, 2190);
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-16", 2, 4, 1231);

.shell cls

SELECT * FROM Kaoots;

COMMIT TRANSACTION;