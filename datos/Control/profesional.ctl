OPTIONS (SKIP=1)
LOAD DATA
INFILE 'FileData/profesional.csv'
INTO TABLE PROFESIONALES TRUNCATE
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(
PROFESIONAL "TRIM(:PROFESIONAL)",
SALARIO "TRIM(:SALARIO)",
COMISION "TRIM(:COMISION)",
FECINI "TRIM(:FECINI)",
PUESTO "TRIM(:PUESTO)",
AREA "TRIM(:AREA)"
)
