OPTIONS (SKIP=1)
LOAD DATA
INFILE 'FileData/poblacion.csv'
INTO TABLE POBLACION TRUNCATE
FIELDS TERMINATED BY "," TRAILING NULLCOLS
(
NACION "TRIM(:NACION)",
POBLA "TRIM(:POBLA)"
)
