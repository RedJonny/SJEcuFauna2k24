CREATE TABLE SJPaises(
    idSJPais            INTEGER PRIMARY KEY AUTOINCREMENT,
    NombrePais          VARCHAR(50) NOT NULL UNIQUE,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime'))
);

CREATE TABLE SJRegiones(
    idSJRegion          INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreRegion        VARCHAR(50) NOT NULL UNIQUE,
    idPais              INTEGER NOT NULL,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime')),
    CONSTRAINT          fk_Pais FOREIGN KEY(idPais) REFERENCES SJPaises(idSJPais)
);

CREATE TABLE SJProvincias(
    idSJProvincia       INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreProvincia     VARCHAR(50) NOT NULL UNIQUE,
    idRegion            INTEGER NOT NULL,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime')),
    CONSTRAINT          fk_Region FOREIGN KEY(idRegion) REFERENCES SJRegiones(idSJRegion)
);

CREATE TABLE SJSexo(
    idSJSexo            INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreSexo          VARCHAR(10) NOT NULL UNIQUE, 
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime'))
);

CREATE TABLE SJIngestaNativa(
    idSJIngestaNativa   INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreIngestaNativa VARCHAR(30) NOT NULL UNIQUE,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime'))
);

CREATE TABLE SJGenoAlimento(
    idSJGenoAlimento    INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreGenoAlimento  VARCHAR(10) NOT NULL UNIQUE,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime'))
);

CREATE TABLE SJTipoAlimento(
    idSJTipoAlimento    INTEGER PRIMARY KEY AUTOINCREMENT,
    TipoAlimento        VARCHAR(20) NOT NULL,
    Estado              CHAR(1) NOT NULL DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime')) 
);

CREATE TABLE SJAlimento(
    idSJAlimento        INTEGER PRIMARY KEY AUTOINCREMENT,
    NombreAlimento      VARCHAR(20) NOT NULL UNIQUE,
    idTipoAlimento      INTEGER NOT NULL,
    CONSTRAINT          fk_TipoAlimento FOREIGN KEY (idTipoAlimento) REFERENCES SJTipoAlimento(idSJTipoAlimento)
);

CREATE TABLE SJHormigas(
    idSJHormiga         INTEGER PRIMARY KEY AUTOINCREMENT,
    TipoHormiga         VARCHAR(50) NOT NULL UNIQUE,
    idSexo              INTEGER NOT NULL,
    idProvincia         INTEGER NOT NULL,
    idGenoAlimento      INTEGER NOT NULL,
    idIngestaNativa     INTEGER NOT NULL,
    Estado              CHAR(1) DEFAULT('A') CHECK(Estado IN ('A', 'X')),
    FechaCreacion       DATETIME NOT NULL DEFAULT(datetime('now', 'localtime')),
    CONSTRAINT          fk_Sexo FOREIGN KEY (idSexo) REFERENCES SJSexo(idSJSexo),
    CONSTRAINT          fk_Provincia FOREIGN KEY (idProvincia) REFERENCES SJProvincias(idSJProvincia),
    CONSTRAINT          fk_GenoAlimento FOREIGN KEY (idGenoAlimento) REFERENCES SJGenoAlimento(idSJGenoAlimento),
    CONSTRAINT          fk_IngestaNativa FOREIGN KEY (idIngestaNativa) REFERENCES SJIngestaNativa(idSJIngestaNativa)
);

INSERT INTO SJSexo (NombreSexo, Estado) VALUES (?, ?)