--login de usuarios
CREATE OR REPLACE PROCEDURE login_usuarios(
  u_correo IN VARCHAR2,
  u_clave IN VARCHAR2,
  d_usuario OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN d_usuario FOR
    SELECT T.id_trabajador, T.NOMBRE, T.TIPO
    FROM trabajador  T
    WHERE T.USUARIO = u_correo AND T.PASSWORD = u_clave;
END;

--cambia la clave del usuario
CREATE OR REPLACE PROCEDURE cambiar_clave(
  codigo_usuario IN INTEGER,
  clave IN VARCHAR2,
  n_clave IN VARCHAR2,
  resultado OUT INTEGER
) 
IS
  clave_u VARCHAR2(15) DEFAULT 'nokey';
BEGIN
  SELECT T.PASSWORD INTO clave_u
  FROM TRABAJADOR T
  WHERE T.ID_TRABAJADOR= codigo_usuario;
  
  IF clave = clave_u then
    UPDATE trabajador T
    SET T.PASSWORD = n_clave
    WHERE T.ID_TRABAJADOR = codigo_usuario;
    resultado := 1;
  ELSE
    resultado := 0;
  END IF;
END;

--OBTENER LOS DATOS DEL USUARIO SEGUN CODIGO DE USUARIO

CREATE OR REPLACE PROCEDURE get_d_usuario(
  COD_USER_I IN INTEGER,
  DATOS_I OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN DATOS_I FOR
    SELECT T.NOMBRE, T.USUARIO
    FROM TRABAJADOR T
    WHERE T.ID_TRABAJADOR = COD_USER_I;
END;

--valida que el correo no este registrado en la base de datos
CREATE OR REPLACE PROCEDURE validar_correo(
  v_correo IN VARCHAR2,
  d_usuario OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN d_usuario FOR
    SELECT T.ID_TRABAJADOR
    FROM TRABAJADOR T
    WHERE T.USUARIO = v_correo;
END;

--REFRESCAR USUARIO
CREATE OR REPLACE PROCEDURE act_d_usuario(
  cod_u_i IN INTEGER,
  nombre_i IN VARCHAR2,
  correo_i IN VARCHAR2,
  c_correo_i IN VARCHAR2
)
IS
BEGIN
  
  IF(c_correo_i ='si') THEN
    UPDATE TRABAJADOR T
    SET
      T.USUARIO = correo_i,
      T.NOMBRE = nombre_i
    WHERE T.ID_TRABAJADOR = cod_u_i;
  ELSE
    UPDATE TRABAJADOR T
      SET
        T.NOMBRE = nombre_i
      WHERE T.ID_TRABAJADOR = cod_u_i;
  END IF;
END;

--Lista Todos los paises de la base
CREATE OR REPLACE PROCEDURE listado_paises(
  paises OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN paises FOR
    SELECT R.NOMBRE, R.ID_REGION
    FROM REGION R
    WHERE R.tipo = 'P'
    ORDER BY R.NOMBRE;
END;

--Registrar inventor
CREATE OR REPLACE PROCEDURE crear_inventor(
  nombre_i IN VARCHAR2,
  correo_i IN VARCHAR2,
  codigo_pais_i IN INTEGER
)
IS
BEGIN
  INSERT INTO INVENTOR (nombre,correo,region_id_region) values (nombre_i,correo_i,codigo_pais_i);
END;

--Obtener areas
CREATE OR REPLACE PROCEDURE get_area(
  areas_o OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN areas_o FOR
    SELECT A.ID_AREA, A.NOMBRE
    FROM AREA A
    ORDER BY A.NOMBRE;
END;

--Registrar invento
CREATE OR REPLACE PROCEDURE nuevo_invento(
  descripcionIN IN VARCHAR2,
  regid IN INTEGER,
  areaid IN INTEGER,
  IDINV OUT INTEGER
)
IS
BEGIN
  INSERT INTO INVENTO(DESCRIPCION,ESTADO,ID_REGION,ID_AREA) values (descripcionIN,'E',regid,areaid)
  RETURNING ID_INVENTO INTO IDINV;
END;
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

