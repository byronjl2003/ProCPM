-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2016-10-11 22:16:23 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Area
  (
    id_area                  SMALLINT NOT NULL ,
    nombre                   VARCHAR2 (50) NOT NULL ,
    descripcion              VARCHAR2 (100) ,
    Trabajador_id_trabajador SMALLINT NOT NULL
  ) ;
CREATE UNIQUE INDEX Area__IDX ON Area
  (
    Trabajador_id_trabajador ASC
  )
  ;
ALTER TABLE Area ADD CONSTRAINT Area_PK PRIMARY KEY ( id_area ) ;


CREATE TABLE AsigArea
  (
    Area_id_area             SMALLINT NOT NULL ,
    Trabajador_id_trabajador SMALLINT NOT NULL
  ) ;


CREATE TABLE AsigRegion
  (
    Region_id_region  INTEGER NOT NULL ,
    Region_id_region1 INTEGER NOT NULL
  ) ;
ALTER TABLE AsigRegion ADD CONSTRAINT Relation_1_PK PRIMARY KEY ( Region_id_region, Region_id_region1 ) ;


CREATE TABLE Det_invento
  (
    Inventor_id_inventor SMALLINT NOT NULL ,
    Invento_id_invento   SMALLINT NOT NULL
  ) ;
ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_PK PRIMARY KEY ( Inventor_id_inventor, Invento_id_invento ) ;


CREATE TABLE Frontera
  (
    Pais_id_pais  SMALLINT NOT NULL ,
    Pais_id_pais1 SMALLINT NOT NULL
  ) ;
ALTER TABLE Frontera ADD CONSTRAINT Relation_2_PK PRIMARY KEY ( Pais_id_pais, Pais_id_pais1 ) ;


CREATE TABLE Invento
  (
    id_invento   SMALLINT NOT NULL ,
    Descripcion  VARCHAR2 (100) NOT NULL ,
    Pais_id_pais SMALLINT NOT NULL
  ) ;
ALTER TABLE Invento ADD CONSTRAINT Invento_PK PRIMARY KEY ( id_invento ) ;


CREATE TABLE Inventor
  (
    id_inventor  SMALLINT NOT NULL ,
    nombre       VARCHAR2 (80) NOT NULL ,
    Pais_id_pais SMALLINT NOT NULL
  ) ;
ALTER TABLE Inventor ADD CONSTRAINT Inventor_PK PRIMARY KEY ( id_inventor ) ;


CREATE TABLE Pais
  (
    id_pais          SMALLINT NOT NULL ,
    nombre           VARCHAR2 (30) NOT NULL ,
    Region_id_region INTEGER NOT NULL
  ) ;
ALTER TABLE Pais ADD CONSTRAINT Pais_PK PRIMARY KEY ( id_pais ) ;


CREATE TABLE Patente
  (
    id_patente         INTEGER NOT NULL ,
    Invento_id_invento SMALLINT NOT NULL ,
    Pais_id_pais       SMALLINT NOT NULL
  ) ;
CREATE UNIQUE INDEX Patente__IDX ON Patente
  (
    Invento_id_invento ASC
  )
  ;
ALTER TABLE Patente ADD CONSTRAINT Patente_PK PRIMARY KEY ( Pais_id_pais, id_patente ) ;


CREATE TABLE Region
  (
    id_region INTEGER NOT NULL ,
    nombre    VARCHAR2 (80) NOT NULL
  ) ;
ALTER TABLE Region ADD CONSTRAINT Region_PK PRIMARY KEY ( id_region ) ;


CREATE TABLE Trabajador
  (
    id_trabajador SMALLINT NOT NULL ,
    nombre        VARCHAR2 (50) NOT NULL ,
    usuario       VARCHAR2 (50) NOT NULL ,
    password      VARCHAR2 (15) NOT NULL ,
    fecha_ini     DATE NOT NULL ,
    Tipo          CHAR (1) NOT NULL ,
    Tipo_jefe     CHAR (1) NOT NULL
  ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( id_trabajador ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_usuario_UN UNIQUE ( usuario ) ;


ALTER TABLE Area ADD CONSTRAINT Area_Trabajador_FK FOREIGN KEY ( Trabajador_id_trabajador ) REFERENCES Trabajador ( id_trabajador ) ;

ALTER TABLE AsigArea ADD CONSTRAINT AsigArea_Area_FK FOREIGN KEY ( Area_id_area ) REFERENCES Area ( id_area ) ;

ALTER TABLE AsigArea ADD CONSTRAINT AsigArea_Trabajador_FK FOREIGN KEY ( Trabajador_id_trabajador ) REFERENCES Trabajador ( id_trabajador ) ;

ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_Invento_FK FOREIGN KEY ( Invento_id_invento ) REFERENCES Invento ( id_invento ) ON
DELETE CASCADE ;

ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_Inventor_FK FOREIGN KEY ( Inventor_id_inventor ) REFERENCES Inventor ( id_inventor ) ON
DELETE CASCADE ;

ALTER TABLE AsigRegion ADD CONSTRAINT FK_ASS_1 FOREIGN KEY ( Region_id_region ) REFERENCES Region ( id_region ) ON
DELETE CASCADE ;

ALTER TABLE Frontera ADD CONSTRAINT FK_ASS_10 FOREIGN KEY ( Pais_id_pais1 ) REFERENCES Pais ( id_pais ) ;

ALTER TABLE AsigRegion ADD CONSTRAINT FK_ASS_2 FOREIGN KEY ( Region_id_region1 ) REFERENCES Region ( id_region ) ON
DELETE CASCADE ;

ALTER TABLE Frontera ADD CONSTRAINT FK_ASS_9 FOREIGN KEY ( Pais_id_pais ) REFERENCES Pais ( id_pais ) ;

ALTER TABLE Invento ADD CONSTRAINT Invento_Pais_FK FOREIGN KEY ( Pais_id_pais ) REFERENCES Pais ( id_pais ) ;

ALTER TABLE Inventor ADD CONSTRAINT Inventor_Pais_FK FOREIGN KEY ( Pais_id_pais ) REFERENCES Pais ( id_pais ) ;

ALTER TABLE Pais ADD CONSTRAINT Pais_Region_FK FOREIGN KEY ( Region_id_region ) REFERENCES Region ( id_region ) ;

ALTER TABLE Patente ADD CONSTRAINT Patente_Invento_FK FOREIGN KEY ( Invento_id_invento ) REFERENCES Invento ( id_invento ) ;

ALTER TABLE Patente ADD CONSTRAINT Patente_Pais_FK FOREIGN KEY ( Pais_id_pais ) REFERENCES Pais ( id_pais ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            11
-- CREATE INDEX                             2
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
