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

INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );
INSERT INTO Kaoots (Data, Acertadas, Total, Pontos) VALUES ("2021-11-", , , );

COMMIT TRANSACTION;