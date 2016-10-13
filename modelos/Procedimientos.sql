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

---CREA UN AREA DE INVESTIGACION Y LE CAMBIA EL ESTADO DEL ATRIBUTO TIPO_JEFE A '2'(jefe de un area) ESTADO AL TRABAJADOR
CREATE OR REPLACE PROCEDURE set_area
(
  nom varchar2,
  descrip varchar2,
  idtrabajador integer
  
)
AS
BEGIN
  
  INSERT INTO AREA(nombre,descripcion,id_trabajador) values(nom,descrip,idtrabajador);
  UPDATE trabajador
    SET TIPO_JEFE='2';
  
END;

CREATE OR REPLACE PROCEDURE set_trabajador
(
  nom varchar2,
  usu varchar2,
  pass varchar2,
  fecini date,
  tipoo char,--puede ser A(admin) o T(trabajador)
  tipoj char--1(jefe de todas las areas),2(jefe de una area),3(no es jefe)
)
AS