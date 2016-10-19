CREATE OR REPLACE PROCEDURE llenado_continente
AS
cursor cursor1 is select * FROM continentes;
cursor cursor2(nom varchar2,tip char) is select ID_REGION FROM region where nombre=nom and tipo=tip;
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idcontinente tipe;
idnacion tipe;
idcapital tipe;
idregion tipe;

BEGIN
  
  FOR dato IN cursor1 LOOP
    idcontinente.idd :=0;
    idregion.idd :=0;
    idnacion.idd :=0;
    idcapital.idd :=0;
    
    
    FOR dataa IN cursor2(dato.CONTINENTE,'C') LOOP
      idcontinente.idd := dataa.ID_REGION;
    END LOOP;
    IF idcontinente.idd = 0 THEN
      INSERT INTO REGION(nombre,tipo)values(dato.CONTINENTE,'C') returning id_region INTO idcontinente.idd;
    END IF;
    ---------------------------------------------------------------------------------------------------------------------------
    FOR dataa IN cursor2(dato.REGION,'R') LOOP
      idregion.idd := dataa.ID_REGION;
    END LOOP;
    IF idregion.idd = 0 THEN
      INSERT INTO REGION(nombre,tipo,id_region1)values(dato.REGION,'R',idcontinente.idd) returning id_region INTO idregion.idd;
    END IF;
    -----------------------------------------------------------------------------------------------------------------------------
    FOR dataa IN cursor2(dato.NACION,'N')LOOP
      idnacion.idd := dataa.ID_REGION; 
    END LOOP;
    IF idnacion.idd = 0 THEN
      INSERT INTO REGION(nombre,tipo,id_region1)values(dato.NACION,'N',idregion.idd) returning id_region INTO idnacion.idd;
    END IF;
    -----------------------------------------------------------------------------------------------------------------------------
    INSERT INTO REGION(nombre,tipo,id_region1)values(dato.CAPITAL,'A',idnacion.idd);
      
  END LOOP;
END llenado_continente;
---------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE llenado_frontera
AS
cursor cursor1 is select * FROM FRONTRAS;
cursor cursor2(nom varchar2) is select ID_REGION FROM region where nombre=nom and tipo='N';
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idnacion1 tipe;
idnacion2 tipe;

BEGIN
  
  FOR dato IN cursor1 LOOP
    idnacion1.idd :=0;
    idnacion2.idd :=0;
        
    FOR dataa IN cursor2(dato.NACION) LOOP
      idnacion1.idd := dataa.ID_REGION;
    END LOOP;
    
    FOR dataa IN cursor2(dato.NACIONF) LOOP
      idnacion2.idd := dataa.ID_REGION;
    END LOOP;
    -----------------------------------------------------------------------------------------------------------------------------
    IF idnacion1.idd <> 0 AND idnacion2.idd <> 0 THEN
      INSERT INTO FRONTERA values(idnacion1.idd,idnacion2.idd);
    END IF;  
  END LOOP;
END llenado_frontera;
-----------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE llenado_areas
AS
cursor cursor1 is select * FROM AREAS;
cursor cursor2(nom varchar2) is select ID_REGION FROM region where nombre=nom and tipo='N';
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idnacion tipe;
BEGIN
  FOR dato IN cursor1 LOOP
    idnacion.idd :=0;
    FOR dataa IN cursor2(dato.NACION) LOOP
      idnacion.idd :=dataa.ID_REGION;
    END LOOP;
    IF idnacion.idd <> 0 THEN
      UPDATE REGION SET area = dato.AREA WHERE ID_REGION=idnacion.idd;
    END IF;
  END LOOP;
END llenado_areas;
-----------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE llenado_poblacion
AS
cursor cursor1 is select * FROM POBLACION;
cursor cursor2(nom varchar2) is select ID_REGION FROM region where nombre=nom and tipo='N';
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idnacion tipe;
BEGIN
  
  FOR dato IN cursor1 LOOP
    idnacion.idd :=0;
    FOR dataa IN cursor2(dato.NACION) LOOP
      idnacion.idd :=dataa.ID_REGION;
    END LOOP;
    IF idnacion.idd <> 0 THEN
      UPDATE REGION SET POBLACION = dato.POBLA WHERE ID_REGION=idnacion.idd;
    END IF;
  END LOOP;
  
END llenado_poblacion;
------------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE llenado_profesionales
AS
cursor cursor1 is select * FROM PROFESIONALES;
cursor cursorarea(nom varchar2) is select ID_AREA FROM AREA WHERE nombre=nom; 

type tipearea IS RECORD(ida AREA.ID_AREA%TYPE);
idarea tipearea;

type tiptrabajador IS RECORD(idtraba TRABAJADOR.ID_TRABAJADOR%TYPE);
idtrabajador tiptrabajador;

BEGIN
  FOR dato IN cursor1 LOOP
    IF dato.PUESTO = 'Empleado' THEN
      
      INSERT INTO TRABAJADOR(NOMBRE,USUARIO,PASSWORD,FECHA_INI,TIPO,TIPO_JEFE,SALARIO,COMISION)
        VALUES(dato.PROFESIONAL,dato.PROFESIONAL,'123456',dato.FECINI,'T','3',dato.SALARIO,dato.COMISION)RETURNING ID_TRABAJADOR INTO idtrabajador.idtraba;
      
      INSERT INTO AREA(NOMBRE,ID_TRABAJADOR)VALUES(dato.AREA,idtrabajador.idtraba) RETURNING ID_AREA INTO idarea.ida;
      
      INSERT INTO ASIGAREA(ID_AREA,ID_TRABAJADOR,RANKING)VALUES(idarea.ida,idtrabajador.idtraba,5);
      
        
    ELSE
      INSERT INTO TRABAJADOR(NOMBRE,USUARIO,PASSWORD,FECHA_INI,TIPO,TIPO_JEFE,SALARIO,COMISION)
        VALUES(dato.PROFESIONAL,dato.PROFESIONAL,'123456',dato.FECINI,'T','2',dato.SALARIO,dato.COMISION)RETURNING ID_TRABAJADOR INTO idtrabajador.idtraba;
        
      
      idarea.ida := 0;
      FOR dato2 IN cursorarea(dato.AREA) LOOP
        idarea.ida := dato2.ID_AREA;
        --idarea.ida := 10;
      END LOOP;
      IF idarea.ida <> 0 THEN
        INSERT INTO ASIGAREA(ID_AREA,ID_TRABAJADOR,RANKING)VALUES(idarea.ida,idtrabajador.idtraba,5);
      END IF; 
      
         
    END IF;
       
  END LOOP;
  
END llenado_profesionales;
-----------------------------------------------------------------------------------------------------------
create or replace PROCEDURE llenado_patentes
AS
cursor cursor1 IS SELECT * from PATENTES;

cursor cursor2(nom varchar2) is select ID_REGION FROM region where nombre=nom and tipo='N';
type tipe IS RECORD(idd REGION.ID_REGION%TYPE);
idnacion tipe;

cursor cursorarea(nom varchar2) is select ID_AREA FROM AREA WHERE nombre=nom; 
type tipearea IS RECORD(ida AREA.ID_AREA%TYPE);
idarea tipearea;

cursor cursorinvento(idinve integer) IS SELECT ID_INVENTO FROM INVENTO WHERE id_invento=idinve;
type tipeinvento IS RECORD(idd INVENTO.ID_INVENTO%TYPE);
idinvento tipeinvento;

fechadate varchar2(100);

type tipeinventor IS RECORD(idid INVENTOR.ID_INVENTOR%TYPE);
idinventor tipeinventor;

flaginvento INTEGER;
BEGIN

  FOR dato IN cursor1 LOOP
    flaginvento := 0;
    idinvento.idd :=0;
    FOR invento IN cursorinvento(dato.CODIGOPATENTE) LOOP
      flaginvento :=1;
      idinvento.idd :=invento.ID_INVENTO;
    END LOOP;
    
    IF flaginvento = 0 THEN--NO ESTA CREADO EL INVENTO TODAVIA
      
      DBMS_OUTPUT.PUT_LINE('SE VA A CREAR EL INVENTO '||dato.CODIGOPATENTE);
      -----SE AGREGA LA INFO DE EL AREA DE INVENTIGACION..
        idarea.ida :=0;
        FOR dato2 IN cursorarea(dato.AREAINVESTIGACION) LOOP
          idarea.ida :=dato2.ID_AREA;
        END LOOP;
      
        IF idarea.ida<>0 THEN
          UPDATE AREA SET descripcion = dato.DESCRIPAREA,ranking=dato.RANKINGAREA WHERE ID_AREA=idarea.ida;--SE AGREGA LA INFO QUE FALTA DE EL AREA DE INVESTIGACION
          ---------------SE CREA EL INVENTO------------------------------------
            fechadate := '01/01/'|| dato.ANIOPUBLI;
        
            idnacion.idd := 0;
      
            FOR dataa IN cursor2(dato.PAIS) LOOP
              idnacion.idd :=dataa.ID_REGION;
            END LOOP;
            
            IF idnacion.idd <> 0 THEN
              INSERT INTO INVENTO(id_invento,descripcion,fec_publicacion,estado,id_region,id_area)
              values(dato.CODIGOPATENTE,dato.DESCRIPPATENTE,TO_DATE(fechadate,'DD/MM/YYYY'),'P',idnacion.idd,idarea.ida);
              -------------------------------------SE CREA EL INVENTOR Y SE AGREGA A LA ENTIDAD DE ASIGACION------------------
                idnacion.idd :=0;
                FOR naciona IN cursor2(dato.NACIONALIDAD) LOOP
                  idnacion.idd :=naciona.ID_REGION;
                END LOOP;
      
                IF idnacion.idd <> 0 THEN  
                  INSERT INTO INVENTOR(nombre,id_region)values(dato.INVENTOR,idnacion.idd)returning ID_INVENTOR INTO idinventor.idid;
                  
                  INSERT INTO DET_INVENTO(id_inventor,id_invento)values(idinventor.idid,dato.CODIGOPATENTE);
                ELSE
                  DBMS_OUTPUT.PUT_LINE('SE QUISO CREAR EL UN INVENTOR PERO LA NACIONALIDAD: '|| dato.NACIONALIDAD||'No existe');
                END IF;

                
            ELSE
              DBMS_OUTPUT.PUT_LINE('SE QUISO CREAR EL INVENTO: '||dato.CODIGOPATENTE||'PERO NO EXISTE LA NACION:'||dato.PAIS);
            END IF;
            ------------------FIN CREACION DEL INVENTO        
        ELSE
          DBMS_OUTPUT.PUT_LINE('SE QUISO ACTUALIZAR AL AREA : '||dato.AREAINVESTIGACION ||'PERO NO EXISTE');
        END IF;
      ---------------FIN DE LA INFO FALTANTE DE EL AREA DE INVESTIGACION
      
        
      
      
    ELSE
    ------------------------------------------------------------SE CREA EL INVENTOR y SE AGREFA A ASIGN-------------------
    -------------------------------------SE CREA EL INVENTOR Y SE AGREGA A LA ENTIDAD DE ASIGACION------------------
        idnacion.idd :=0;
        FOR naciona IN cursor2(dato.NACIONALIDAD) LOOP
          idnacion.idd :=naciona.ID_REGION;
        END LOOP;
        IF idnacion.idd <> 0 THEN
          INSERT INTO INVENTOR(nombre,id_region)values(dato.INVENTOR,idnacion.idd)returning ID_INVENTOR INTO idinventor.idid;
                  
          INSERT INTO DET_INVENTO(id_inventor,id_invento)values(idinventor.idid,dato.CODIGOPATENTE);
        ELSE
          DBMS_OUTPUT.PUT_LINE('SE QUISO CREAR EL UN INVENTOR(PATENTE YA EXISTE) PERO LA NACIONALIDAD: '|| dato.NACIONALIDAD||'No existe');
        END IF;
    END IF;
    
  END LOOP;
  
END llenado_patentes;

---------------
--exec llenado_continente();
--exec llenado_frontera();
--exec llenado_areas();
--exec llenado_poblacion();
--exec llenado_profesionales();
--exec llenado_patentes();

--insert into trabajador(nombre,usuario,password,fecha_ini,tipo,tipo_jefe,salario,comision)values('Saul','sawer@gmail.com','123456',TO_DATE(SYSDATE),'T','3',13000,11000);
--commit;