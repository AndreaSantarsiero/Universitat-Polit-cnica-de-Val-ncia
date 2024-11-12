use Musica;


-- EJERCICIO 5.4:
-- 17)Obtener el nombre de las compa��as discogr�ficas que no han trabajado con grupos espa�oles.
SELECT nombre
FROM companyia
WHERE NOT EXISTS (SELECT *
                  FROM disco, grupo
                  WHERE companyia.cod=disco.cod_comp AND grupo.cod=disco.cod_gru AND grupo.pais='Espa�a');

-- 18)Obtener el nombre de las compa��as discogr�ficas que s�lo han trabajado con grupos espa�oles.
SELECT nombre
FROM companyia
WHERE NOT EXISTS (SELECT *
                  FROM disco, grupo
                  WHERE companyia.cod=disco.cod_comp AND grupo.cod=disco.cod_gru AND grupo.pais<>'Espa�a')
      AND EXISTS (SELECT *
                  FROM disco, grupo
                  WHERE companyia.cod=disco.cod_comp AND grupo.cod=disco.cod_gru);

-- 19)Obtener el nombre y la direcci�n de aquellas compa��as discogr�ficas que han grabado todos los discos de alg�n grupo.
SELECT DISTINCT companyia.nombre, companyia.dir
FROM companyia, disco, grupo
WHERE companyia.cod=disco.cod_comp AND grupo.cod=disco.cod_gru AND
      NOT EXISTS (SELECT *
                  FROM disco D1
                  WHERE companyia.cod<>D1.cod_comp AND grupo.cod=D1.cod_gru);


-- EJERCICIO 5.5:
-- 20)Obtener el nombre de los grupos que sean de Espa�a y la suma de sus fans.
SELECT grupo.nombre, SUM(club.num) fans
FROM grupo, club
WHERE grupo.cod=club.cod_gru AND grupo.pais='Espa�a' 
GROUP BY grupo.cod, grupo.nombre;

-- 21)Obtener para cada grupo con m�s de dos componentes el nombre y el n�mero de componentes del grupo.
SELECT grupo.nombre, COUNT(*) numero_componentes
FROM grupo, pertenece, artista
WHERE grupo.cod=pertenece.cod AND artista.dni=pertenece.dni 
GROUP BY grupo.cod, grupo.nombre
HAVING COUNT(*)>2;

-- 22)Obtener el n�mero de discos de cada grupo.
SELECT grupo.nombre, COUNT(*) numero_de_discos
FROM grupo, disco
WHERE grupo.cod=disco.cod_gru
GROUP BY grupo.cod, grupo.nombre;

-- 23)Obtener el n�mero de canciones que ha grabado cada compa��a discogr�fica y su direcci�n.
SELECT companyia.nombre, COUNT(esta.can) canciones, companyia.dir
FROM (companyia LEFT JOIN disco ON companyia.cod=disco.cod_comp) LEFT JOIN esta ON disco.cod=esta.cod
GROUP BY companyia.cod, companyia.nombre, companyia.dir;


