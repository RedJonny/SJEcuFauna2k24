-- database: ../../DataBase/SJDataBase.sqlite

INSERT INTO SJPaises
    (NombrePais) VALUES
    ('ECUADOR');

INSERT INTO SJRegiones
    (NombreRegion, idPais) VALUES
    ('COSTA', 1),
    ('SIERRA', 1),
    ('ORIENTE', 1),
    ('GALAPAGOS', 1);

INSERT INTO SJProvincias
    (NombreProvincia, idRegion) VALUES
    ('ESMERALDAS',                      1),
    ('MANABI',                          1),
    ('SANTO DOMINGO DE LOS TSACHILAS',  1),
    ('LOS RIOS',                        1),
    ('SANTA ELENA',                     1),
    ('GUAYAS',                          1),
    ('EL ORO',                          1),
    ('CARCHI',                          2),
    ('IMBABURA',                        2),
    ('PICHINCHA',                       2),
    ('COTOPAXI',                        2),
    ('TUNGURAHUA',                      2),
    ('BOLIVAR',                         2),
    ('CHIMBORAZO',                      2),
    ('CAÑAR',                           2),
    ('AZUAY',                           2),
    ('LOJA',                            2),
    ('SUCUMBIOS',                       3),
    ('ORELLANA',                        3),
    ('NAPO',                            3),
    ('PASTAZA',                         3),
    ('MORONA SANTIAGO',                 3),
    ('ZAMORA CHIMCHIPE',                3),
    ('GALAPAGOS',                       4);

INSERT INTO SJIngestaNativa
    (NombreIngestaNativa) VALUES 
    ('CARNIVORO'),
    ('HERBIVORO'),
    ('OMNIVORO'),
    ('INSECTIVORO');

INSERT INTO SJGenoAlimento
    (NombreGenoAlimento) VALUES 
    ('X'),
    ('XX'),
    ('XY');

INSERT INTO SJSexo
    (NombreSexo) VALUES 
    ('MACHO'),
    ('HEMBRA'),
    ('ASEXUAL');

INSERT INTO SJTipoAlimento
    (TipoAlimento) VALUES 
    ('GenoAlimento'),
    ('IngestaNativa');


