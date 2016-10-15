----TRAE EL JEFE DE TODAS LAS AREAS
CREATE OR REPLACE PROCEDURE get_JefeDeAreas
(
  cursorr OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN cursorr FOR
    SELECT nombre,usuario FROM trabajador WHERE tipo_jefe='1';
END get_JefeDeAreas;
--------------------------------------------------------------------------

---TRAE LOS TRABAJADORES QUE NO SON JEFES
CREATE OR REPLACE PROCEDURE get_JefesDisponibles
(
  cursorr OUT SYS_REFCURSOR
)
AS
BEGIN
  OPEN cursorr FOR
    SELECT id_trabajador,nombre from trabajador WHERE TIPO_JEFE='3';
  
END get_JefesDisponibles;
----------------------------------------------------------------
--ASIGNA A UN TRABAJADOR COMO JEFE DE TODAS LAS AREAS DE TRABAJO
CREATE OR REPLACE PROCEDURE set_JefeDeAreas
(
  idtrabajador IN integer,
  mess OUT varchar
)
AS
flag1 integer;
idjefe integer;
cursor cursor1 is select id_trabajador from trabajador where tipo_jefe='1';
BEGIN

  FOR trabajador in cursor1 LOOP
    flag1 :=1;
    idjefe :=trabajador.id_trabajador;
  END LOOP;
  
  IF flag1=1 THEN--YA HAY un JEFE DE TODAS LAS AREAS..
    UPDATE trabajador SET tipo_jefe='3' WHERE id_trabajador=idjefe;
    UPDATE trabajador SET tipo_jefe='1' WHERE id_trabajador=idtrabajador;
    mess :='SE CAMBIO EL JEFE DE LAS AREAS CON EXITO';
    
  ELSE--TODAVIA NO HAY 
  
    UPDATE TRABAJADOR
      SET tipo_jefe='1'
    WHERE id_trabajador=idtrabajador;
    mess := 'SE ASIGNO JEFE DE AREAS CON EXITO';
    
  END IF;
END;
-----------------------------------------------------------
---CREA UN AREA DE INVESTIGACION Y LE CAMBIA EL ESTADO DEL ATRIBUTO TIPO_JEFE A '2'(jefe de un area) ESTADO AL TRABAJADOR
CREATE OR REPLACE PROCEDURE set_area
(
  nom IN varchar2,
  descrip IN varchar2,
  idtrabajador IN integer
  
)
AS
BEGIN
  
  INSERT INTO AREA(nombre,descripcion,id_trabajador) values(nom,descrip,idtrabajador);
  UPDATE trabajador
    SET TIPO_JEFE='2'
  WHERE id_trabajador=idtrabajador;
  
END set_area;
----------------------------------------------------------
------CREA UN TRABAJADOR-----------------------------------------------------
CREATE OR REPLACE PROCEDURE set_trabajador
(
  nom IN varchar2,
  usu IN varchar2,
  pass IN varchar2,
  fecini IN date,
  tipoo IN char,--puede ser A(admin) o T(trabajador)
  tipoj IN char--1(jefe de todas las areas),2(jefe de una area),3(no es jefe)
)
AS
BEGIN
  INSERT INTO TRABAJADOR(nombre,usuario,password,fecha_ini,tipo,tipo_jefe)values(nom,usu,pass,fecini,tipoo,tipoj); 
END set_trabajador;
-----------------------------
---------CREA UNA REGION------------------
CREATE OR REPLACE PROCEDURE set_region
(
  nom IN varchar2,
  idregion IN integer
)
AS
BEGIN
  INSERT INTO region(nombre,id_region_1)values(nom,idregion);
END set_region;
-------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-----------------------------CRUD PAIS----------------------------------------------------------------
--------------------------CREA UN PAIS-------------------------------------
CREATE OR REPLACE PROCEDURE set_pais
(
  nom IN VARCHAR2,
  idregion IN INTEGER,
  pobla IN INTEGER
)
AS
BEGIN
  INSERT INTO pais(nombre,id_region,poblacion)values(nom,idregion,pobla);
END set_pais;
--------------------------------
--------------------------ELIMINA UN PAIS---------------------------------
CREATE OR REPLACE PROCEDURE E_pais
(
  idpais IN INTEGER
  
)
AS
BEGIN
  DELETE PAIS
  WHERE id_pais=idpais;
END E_pais;
--------------------------------
--------------------------MODIFICA UN PAIS--------------------------------
CREATE OR REPLACE PROCEDURE M_pais
(
  idpais IN INTEGER,
  nom IN VARCHAR2,
  idregion IN INTEGER,
  pobla IN INTEGER
)
AS
BEGIN
  UPDATE PAIS
  SET nombre=nom,id_region=idregion,poblacion=pobla
  WHERE id_pais=idpais;
END M_pais;

--------------------CREA UNA FRONTERA-----------
CREATE OR REPLACE PROCEDURE set_frontera
(
  idpais1 IN INTEGER,
  idpais2 IN INTEGER
)
AS
BEGIN
  INSERT INTO FRONTERA(id_pais,id_pais2)values(idpais1,idpais2);
END set_frontera;
-----------------------------------------------
--------------------ELIMINA UNA FRONTERA------------------
CREATE OR REPLACE PROCEDURE E_frontera
(
  idpais1 IN INTEGER,
  idpais2 IN INTEGER
)
AS
BEGIN
  DELETE FRONTERA WHERE id_pais=idpais1 and id_pais2=idpais2;
END E_frontera;
