PRAGMA foreign_keys = OFF;
BEGIN TRANSACTION;

.mode columns
.headers on

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
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );

COMMIT TRANSACTION;