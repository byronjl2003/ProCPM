CREATE OR REPLACE PROCEDURE llenado_patentes
AS
cursor cursor1 IS SELECT * from PATENTES;

type tipinvento IS RECORD(idinve INVENTO.ID_INVENTO%TYPE);
idinvento tipinvento;

cursor cursor2(nom varchar2) is select ID_REGION FROM region where nombre=nom and tipo='N';
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idnacion tipe;

cursor cursorarea(nom varchar2) is select ID_AREA FROM AREA WHERE id_area=nom; 
type tipearea IS RECORD(ida AREA.ID_AREA%TYPE);
idarea tipearea;

fechadate varchar2(100);


type tipeinventor IS RECORD(idid INVENTOR.ID_INVENTOR%TYPE);
idinventor tipeinventor;

BEGIN
  idinvento.idinve := 0;
  FOR dato IN cursor1 LOOP
    
    IF idinvento.idinve <> dato.CODIGOPATENTE THEN
      --ES UNA PATENTE NUEVA..
      idinvento.idinve := dato.CODIGOPATENTE;
      idnacion.idd := 0;
      
      FOR dataa IN cursor2(dato.PAIS) LOOP
        idnacion.idd :=dataa.ID_REGION;
      END LOOP;
      
      idarea.ida :=0;
      FOR dato2 IN cursorarea(dato.AREAINVESTIGACION) LOOP
        idarea.ida :=dato2.ID_AREA;
      END LOOP;
      
      UPDATE AREA SET descripcion = dato.DESCRIPAREA,ranking=dato.RANKINGAREA WHERE ID_AREA=idarea.ida;--SE AGREGA LA INFO QUE FALTA DE EL AREA DE INVESTIGACION
      
      fechadate := '01/01/'|| dato.ANIOPUBLI;
      
      INSERT INTO INVENTO(id_invento,descripcion,fec_publicacion,estado,region_id_region,area_id_area)
        values(idinvento.idinve,dato.DESCRIPPATENTE,TO_DATE(fechadate,'DD/MM/YYYY'),'P',idnacion.idd,idarea.ida);
     
      idnacion.idd :=0;
      FOR dataa IN cursor2(dato.NACIONALIDAD) LOOP
        idnacion.idd :=dataa.ID_REGION;
      END LOOP;
      
        
      INSERT INTO INVENTOR(nombre,region_id_region)values(dato.INVENTOR,idnacion.idd)returning ID_INVENTOR INTO idinventor.idid;
      INSERT INTO DET_INVENTO(inventor_id_inventor,invento_id_invento)values(idinventor.idid,idinvento.idinve);
      
      
    ELSE
    
      idnacion.idd :=0;
      FOR dataa IN cursor2(dato.NACIONALIDAD) LOOP
        idnacion.idd :=dataa.ID_REGION;
      END LOOP;
      
        
      INSERT INTO INVENTOR(nombre,region_id_region)values(dato.INVENTOR,idnacion.idd)returning ID_INVENTOR INTO idinventor.idid;
      INSERT INTO DET_INVENTO(inventor_id_inventor,invento_id_invento)values(idinventor.idid,idinvento.idinve);
      
      
    
    END IF;  
  END LOOP;
END llenado_patentes;