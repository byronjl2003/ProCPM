DROP TABLE FRONTERA;
DROP TABLE ASIGAREA;
DROP TABLE REPRESENTANTE;
DROP TABLE ASIGINVENTO;
DROP TABLE DET_INVENTO;
DROP TABLE INVENTOR;
DROP TABLE INVENTO;
DROP TABLE AREA;
DROP TABLE TRABAJADOR;

DROP TABLE PAIS;
DROP TABLE REGION;

DROP SEQUENCE Area_id_area_SEQ;
--CREATE SEQUENCE Area_id_area_SEQ START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Area_id_area_TRG;
--CREATE OR REPLACE TRIGGER Area_id_area_TRG BEFORE
  --INSERT ON Area FOR EACH ROW WHEN (NEW.id_area IS NULL) BEGIN :NEW.id_area := Area_id_area_SEQ.NEXTVAL;
--END;
--/
DROP SEQUENCE Invento_id_invento_SEQ;
--CREATE SEQUENCE Invento_id_invento_SEQ START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Invento_id_invento_TRG;
--CREATE OR REPLACE TRIGGER Invento_id_invento_TRG BEFORE
  --INSERT ON Invento FOR EACH ROW WHEN (NEW.id_invento IS NULL) BEGIN :NEW.id_invento := Invento_id_invento_SEQ.NEXTVAL;
--END;
--/
DROP SEQUENCE Inventor_id_inventor_SEQ;
--CREATE SEQUENCE Inventor_id_inventor_SEQ START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Inventor_id_inventor_TRG;
--CREATE OR REPLACE TRIGGER Inventor_id_inventor_TRG BEFORE
  --INSERT ON Inventor FOR EACH ROW WHEN (NEW.id_inventor IS NULL) BEGIN :NEW.id_inventor := Inventor_id_inventor_SEQ.NEXTVAL;
--END;
--/
DROP SEQUENCE Pais_id_pais_SEQ;
--CREATE SEQUENCE Pais_id_pais_SEQ START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Pais_id_pais_TRG;
--CREATE OR REPLACE TRIGGER Pais_id_pais_TRG BEFORE
  --INSERT ON Pais FOR EACH ROW WHEN (NEW.id_pais IS NULL) BEGIN :NEW.id_pais := Pais_id_pais_SEQ.NEXTVAL;
--END;
--/
DROP SEQUENCE Region_id_region_SEQ;
--CREATE SEQUENCE Region_id_region_SEQ START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Region_id_region_TRG;
--CREATE OR REPLACE TRIGGER Region_id_region_TRG BEFORE
  --INSERT ON Region FOR EACH ROW WHEN (NEW.id_region IS NULL) BEGIN :NEW.id_region := Region_id_region_SEQ.NEXTVAL;
---END;
--/
DROP SEQUENCE Representante_id_representante;
--CREATE SEQUENCE Representante_id_representante START WITH 1 NOCACHE ORDER ;
DROP TRIGGER Representante_id_representante;
--CREATE OR REPLACE TRIGGER Representante_id_representante BEFORE
  --INSERT ON Representante FOR EACH ROW WHEN (NEW.id_representante IS NULL) BEGIN :NEW.id_representante := Representante_id_representante.NEXTVAL;
--END;
--/
DROP SEQUENCE Trabajador_id_trabajador_SEQ;
--CREATE SEQUENCE Trabajador_id_trabajador_SEQ START WITH 1 NOCACHE ORDER ;
--CREATE OR REPLACE TRIGGER Trabajador_id_trabajador_TRG BEFORE
  --INSERT ON Trabajador FOR EACH ROW WHEN (NEW.id_trabajador IS NULL) BEGIN :NEW.id_trabajador := Trabajador_id_trabajador_SEQ.NEXTVAL;
--END;
--/
