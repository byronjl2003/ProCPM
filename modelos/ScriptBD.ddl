-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2016-10-12 18:18:00 CST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Area
  (
    id_area       SMALLINT NOT NULL ,
    nombre        VARCHAR2 (50) NOT NULL ,
    descripcion   VARCHAR2 (100) ,
    id_trabajador SMALLINT NOT NULL
  ) ;
CREATE UNIQUE INDEX Area__IDX ON Area
  (
    id_trabajador ASC
  )
  ;
ALTER TABLE Area ADD CONSTRAINT Area_PK PRIMARY KEY ( id_area ) ;


CREATE TABLE AsigArea
  (
    id_area       SMALLINT NOT NULL ,
    id_trabajador SMALLINT NOT NULL ,
    ranking       SMALLINT NOT NULL
  ) ;
ALTER TABLE AsigArea ADD CONSTRAINT AsigArea_PK PRIMARY KEY ( id_area, id_trabajador ) ;


CREATE TABLE AsigInvento
  (
    id_invento    SMALLINT NOT NULL ,
    id_trabajador SMALLINT NOT NULL
  ) ;
ALTER TABLE AsigInvento ADD CONSTRAINT AsigInvento_PK PRIMARY KEY ( id_invento, id_trabajador ) ;


CREATE TABLE Det_invento
  (
    id_inventor SMALLINT NOT NULL ,
    id_invento  SMALLINT NOT NULL
  ) ;
ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_PK PRIMARY KEY ( id_inventor, id_invento ) ;


CREATE TABLE Frontera
  (
    id_pais  SMALLINT NOT NULL ,
    id_pais2 SMALLINT NOT NULL
  ) ;
ALTER TABLE Frontera ADD CONSTRAINT Relation_2_PK PRIMARY KEY ( id_pais, id_pais2 ) ;


CREATE TABLE Invento
  (
    id_invento  SMALLINT NOT NULL ,
    Descripcion VARCHAR2 (100) NOT NULL ,
    id_pais     SMALLINT NOT NULL ,
    estado      CHAR (1 CHAR) NOT NULL
  ) ;
ALTER TABLE Invento ADD CONSTRAINT Invento_PK PRIMARY KEY ( id_invento ) ;


CREATE TABLE Inventor
  (
    id_inventor SMALLINT NOT NULL ,
    nombre      VARCHAR2 (80) NOT NULL ,
    id_pais     SMALLINT NOT NULL
  ) ;
ALTER TABLE Inventor ADD CONSTRAINT Inventor_PK PRIMARY KEY ( id_inventor ) ;


CREATE TABLE Pais
  (
    id_pais   SMALLINT NOT NULL ,
    nombre    VARCHAR2 (50) NOT NULL ,
    id_region INTEGER NOT NULL
  ) ;
ALTER TABLE Pais ADD CONSTRAINT Pais_PK PRIMARY KEY ( id_pais ) ;


CREATE TABLE Region
  (
    id_region   INTEGER NOT NULL ,
    nombre      VARCHAR2 (80) NOT NULL ,
    id_region_1 INTEGER
  ) ;
ALTER TABLE Region ADD CONSTRAINT Region_PK PRIMARY KEY ( id_region ) ;


CREATE TABLE Representante
  (
    id_representante SMALLINT NOT NULL ,
    nombre           VARCHAR2 (50) NOT NULL ,
    id_pais          SMALLINT NOT NULL
  ) ;
CREATE UNIQUE INDEX Representante__IDX ON Representante
  (
    id_pais ASC
  )
  ;
ALTER TABLE Representante ADD CONSTRAINT Representante_PK PRIMARY KEY ( id_representante ) ;


CREATE TABLE Trabajador
  (
    id_trabajador SMALLINT NOT NULL ,
    nombre        VARCHAR2 (50) NOT NULL ,
    usuario       VARCHAR2 (50 CHAR) NOT NULL ,
    password      VARCHAR2 (15 CHAR) NOT NULL ,
    fecha_ini     DATE NOT NULL ,
    tipo          CHAR (1 CHAR) NOT NULL ,
    tipe_jefe     VARCHAR2 (1 CHAR) NOT NULL
  ) ;
ALTER TABLE Trabajador ADD CONSTRAINT Trabajador_PK PRIMARY KEY ( id_trabajador ) ;


ALTER TABLE Area ADD CONSTRAINT Area_Trabajador_FK FOREIGN KEY ( id_trabajador ) REFERENCES Trabajador ( id_trabajador ) ON
DELETE CASCADE ;

ALTER TABLE AsigArea ADD CONSTRAINT AsigArea_Area_FK FOREIGN KEY ( id_area ) REFERENCES Area ( id_area ) ON
DELETE CASCADE ;

ALTER TABLE AsigArea ADD CONSTRAINT AsigArea_Trabajador_FK FOREIGN KEY ( id_trabajador ) REFERENCES Trabajador ( id_trabajador ) ON
DELETE CASCADE ;

ALTER TABLE AsigInvento ADD CONSTRAINT AsigInvento_Invento_FK FOREIGN KEY ( id_invento ) REFERENCES Invento ( id_invento ) ON
DELETE CASCADE ;

ALTER TABLE AsigInvento ADD CONSTRAINT AsigInvento_Trabajador_FK FOREIGN KEY ( id_trabajador ) REFERENCES Trabajador ( id_trabajador ) ON
DELETE CASCADE ;

ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_Invento_FK FOREIGN KEY ( id_invento ) REFERENCES Invento ( id_invento ) ON
DELETE CASCADE ;

ALTER TABLE Det_invento ADD CONSTRAINT Det_invento_Inventor_FK FOREIGN KEY ( id_inventor ) REFERENCES Inventor ( id_inventor ) ON
DELETE CASCADE ;

ALTER TABLE Frontera ADD CONSTRAINT FK_ASS_10 FOREIGN KEY ( id_pais2 ) REFERENCES Pais ( id_pais ) ON
DELETE CASCADE ;

ALTER TABLE Frontera ADD CONSTRAINT FK_ASS_9 FOREIGN KEY ( id_pais ) REFERENCES Pais ( id_pais ) ON
DELETE CASCADE ;

ALTER TABLE Invento ADD CONSTRAINT Invento_Pais_FK FOREIGN KEY ( id_pais ) REFERENCES Pais ( id_pais ) ON
DELETE CASCADE ;

ALTER TABLE Inventor ADD CONSTRAINT Inventor_Pais_FK FOREIGN KEY ( id_pais ) REFERENCES Pais ( id_pais ) ON
DELETE CASCADE ;

ALTER TABLE Pais ADD CONSTRAINT Pais_Region_FK FOREIGN KEY ( id_region ) REFERENCES Region ( id_region ) ON
DELETE CASCADE ;

ALTER TABLE Region ADD CONSTRAINT Region_Region_FK FOREIGN KEY ( id_region_1 ) REFERENCES Region ( id_region ) ON
DELETE CASCADE ;

ALTER TABLE Representante ADD CONSTRAINT Representante_Pais_FK FOREIGN KEY ( id_pais ) REFERENCES Pais ( id_pais ) ON
DELETE CASCADE ;

CREATE SEQUENCE Area_id_area_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Area_id_area_TRG BEFORE
  INSERT ON Area FOR EACH ROW WHEN (NEW.id_area IS NULL) BEGIN :NEW.id_area := Area_id_area_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Invento_id_invento_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Invento_id_invento_TRG BEFORE
  INSERT ON Invento FOR EACH ROW WHEN (NEW.id_invento IS NULL) BEGIN :NEW.id_invento := Invento_id_invento_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Inventor_id_inventor_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Inventor_id_inventor_TRG BEFORE
  INSERT ON Inventor FOR EACH ROW WHEN (NEW.id_inventor IS NULL) BEGIN :NEW.id_inventor := Inventor_id_inventor_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Pais_id_pais_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Pais_id_pais_TRG BEFORE
  INSERT ON Pais FOR EACH ROW WHEN (NEW.id_pais IS NULL) BEGIN :NEW.id_pais := Pais_id_pais_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Region_id_region_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Region_id_region_TRG BEFORE
  INSERT ON Region FOR EACH ROW WHEN (NEW.id_region IS NULL) BEGIN :NEW.id_region := Region_id_region_SEQ.NEXTVAL;
END;
/

CREATE SEQUENCE Representante_id_representante START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Representante_id_representante BEFORE
  INSERT ON Representante FOR EACH ROW WHEN (NEW.id_representante IS NULL) BEGIN :NEW.id_representante := Representante_id_representante.NEXTVAL;
END;
/

CREATE SEQUENCE Trabajador_id_trabajador_SEQ START WITH 1 NOCACHE ORDER ;
CREATE OR REPLACE TRIGGER Trabajador_id_trabajador_TRG BEFORE
  INSERT ON Trabajador FOR EACH ROW WHEN (NEW.id_trabajador IS NULL) BEGIN :NEW.id_trabajador := Trabajador_id_trabajador_SEQ.NEXTVAL;
END;
/


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
-- CREATE TRIGGER                           7
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
-- CREATE SEQUENCE                          7
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
