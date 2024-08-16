-- database: ../../DataBase/SJDataBase.sqlite

PRAGMA foreign_keys = OFF;

DROP TABLE IF EXISTS SJHormigas;
DROP TABLE IF EXISTS SJAlimento;
DROP TABLE IF EXISTS SJTipoAlimento;
DROP TABLE IF EXISTS SJIngestaNativa;
DROP TABLE IF EXISTS SJGenoAlimento;
DROP TABLE IF EXISTS SJSexo;
DROP TABLE IF EXISTS SJProvincias;
DROP TABLE IF EXISTS SJRegiones;
DROP TABLE IF EXISTS SJPaises;

PRAGMA foreign_keys = ON;

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

CREATE TABLE SJHormigas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    TipoHormiga TEXT NOT NULL,
    idProvincia TEXT NOT NULL,
    idSexo TEXT NOT NULL,
    idGenoAlimento TEXT NOT NULL,
    idIngestaNativa TEXT NOT NULL,
    Estado TEXT NOT NULL,
    ChipIA TEXT NOT NULL
);

INSERT INTO SJSexo (NombreSexo, Estado) VALUES ('Hibrido', 'A');

UPDATE SJProvincias 
SET NombreProvincia = 'GALAPAGOS', 
    idRegion = 4, 
    Estado = 'A', 
    FechaCreacion = datetime('now', 'localtime') 
WHERE idSJProvincia = 24;