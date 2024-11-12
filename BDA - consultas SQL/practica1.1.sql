use Musica;
SELECT * FROM grupo;


-- EJERCICIO 5.1:
-- 1) �Cu�ntos discos hay?
SELECT count(*)
FROM disco;

-- 2) nombre de los grupos que no sean de Espa�a
SELECT nombre
FROM grupo
WHERE pais<>'Espa�a';

-- 3) t�tulo de las canciones con m�s de 5 minutos de duraci�n
SELECT titulo
FROM cancion
WHERE duracion > 5;

-- 4) distintas funciones que se pueden realizar en un grupo
SELECT DISTINCT funcion
FROM pertenece;

-- 5) lista de clubs de fans junto con su tama�o
SELECT nombre AS club, num AS tama�o
FROM club
ORDER BY num ASC;

--6) Selecciona el nombre y la sede de los clubes de fans con m�s de 500 socios
SELECT nombre, sede
FROM club
WHERE num>500;


-- EJERCICIO 5.2:
-- 7) Obtener el nombre y la sede de cada club de fans de grupos de Espa�a as� como el nombre del grupo al que admiran.
SELECT club.nombre, sede, grupo.nombre
FROM club, grupo
WHERE pais='Espa�a' AND cod_gru=grupo.cod;

-- 8) Obtener el nombre de los artistas que pertenezcan a un grupo de Espa�a.
SELECT artista.nombre
FROM artista, pertenece, grupo
WHERE artista.dni=pertenece.dni AND grupo.cod=pertenece.cod AND pais='Espa�a';

-- 9) Obtener el nombre de los discos que contienen alguna canci�n que dure m�s de 5 minutos.
SELECT DISTINCT disco.nombre
FROM disco, esta, cancion
WHERE cancion.cod=esta.can AND disco.cod=esta.cod AND cancion.duracion>5;

-- 10) Obtener los nombres de las canciones que dan nombre al disco en el que aparecen.
SELECT cancion.titulo
FROM cancion, esta, disco
WHERE cancion.cod=esta.can AND disco.cod=esta.cod AND cancion.titulo=disco.nombre;

-- 11) Obtener los nombres de compa��as y direcciones postales de aquellas compa��as que han grabado alg�n disco que empiece por �A�.
SELECT companyia.nombre, companyia.dir
FROM companyia, disco
WHERE companyia.cod=disco.cod_comp AND disco.nombre LIKE 'A%';

-- 12) DNI de los artistas que pertenecen a m�s de un grupo.
SELECT DISTINCT P1.dni
FROM pertenece P1, pertenece P2
WHERE P1.dni=P2.dni AND P1.cod<>P2.cod;

