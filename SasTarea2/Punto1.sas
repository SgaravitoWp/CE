proc import datafile="/home/u63334633/Clases/Tareas/Tarea cursos estadística/ofrecidos.xlsx" dbms=xlsx out=ofrecidos replace;
    getnames=yes;
run;

PROC IMPORT DATAFILE='/home/u63334633/Clases/Tareas/Tarea cursos estadística/docentes.csv'
     OUT=docentes
     DBMS=csv REPLACE;
     GETNAMES=YES;
RUN;

PROC IMPORT DATAFILE='/home/u63334633/Clases/Tareas/Tarea cursos estadística/cursos.txt'
     OUT=cursos
     DBMS=DLM REPLACE;
     DELIMITER=';';
     GETNAMES=YES;
RUN;

/*En cual semestre del periodo comprendido entre 2014-I y 2016-II hubo más cupos de 
"Probabilidad y Estadística Fundamental"?*/

proc sql;
	CREATE TABLE probyEst AS SELECT * FROM ofrecidos 
	WHERE CodigoCurso = (SELECT CodigoCurso 
		FROM cursos WHERE NombreCurso = 'Probabilidad y Estadística Fundamental');
RUN;

proc sql;
	SELECT Semestre, SUM(CuposN) as cuposTotales
	FROM probyEst
	GROUP BY Semestre
	ORDER BY cuposTotales DESC;
RUN;

/*En cual semestre del periodo comprendido entre 2014-I y 2016-II hubo más grupos de 
"Bioestadística Fundamental"?*/

proc sql;
	CREATE TABLE bioEst AS SELECT * FROM ofrecidos 
	WHERE CodigoCurso = (SELECT CodigoCurso 
		FROM cursos WHERE NombreCurso = 'Bioestadística Fundamental');
RUN;

proc sql;
	SELECT Semestre, COUNT(CuposN) as gruposTotales
	FROM bioEst
	GROUP BY Semestre
	ORDER BY gruposTotales DESC;
RUN;


/*En cual semestre del periodo comprendido entre 2014-I y 2016-II hubo mayor homogeneidad 
(de acuerdo al coeficiente de variación) entre los grupos de "Estadística Social Fundamental" 
en relación al número de cupos ofrecidos?*/
proc sql;
	CREATE TABLE estSocFund AS SELECT * FROM ofrecidos 
	WHERE CodigoCurso = (SELECT CodigoCurso 
		FROM cursos WHERE NombreCurso = 'Estadística Social Fundamental');
RUN;

proc sql;
	SELECT Semestre, STD(CuposN)/AVG(CuposN) as CV
	FROM estSocFund
	GROUP BY Semestre
	ORDER BY CV ASC;
RUN;

/* Cuales cursos del pregrado en Estadística (especifique código y nombre) de la agrupación 
"Complementación" se ofrecieron solo un semestre en el periodo comprendido entre 2014-I y 2016-II?*/

proc sql;
	CREATE TABLE cursosComp AS SELECT CodigoCurso FROM ofrecidos
	WHERE Agrupacion = 'Complementación'
	GROUP BY CodigoCurso
	HAVING COUNT(DISTINCT Semestre) = 1;
RUN;

proc sql;
	SELECT CodigoCurso, NombreCurso FROM cursos 
	WHERE CodigoCurso IN (SELECT * FROM cursosComp);
RUN;

/*Cuales cursos del pregrado en Estadística (especifique código y nombre) de la agrupación 
"Nucleo" se ofrecieron todos los semestres en el periodo comprendido entre 2014-I y 2016-II?*/

proc sql;
	CREATE TABLE cursosNucleo AS SELECT CodigoCurso FROM ofrecidos
	WHERE Agrupacion = 'Nucleo'
	GROUP BY CodigoCurso
	HAVING COUNT(DISTINCT Semestre) = 6;
RUN;

proc sql;
	SELECT CodigoCurso, NombreCurso FROM cursos 
	WHERE CodigoCurso IN (SELECT * FROM cursosNucleo);
RUN;

/*Cuales profesores(as) (especifique identificador y nombre) dictaron en solo uno de los programas 
del departamento de Estadística (es decir, Pregrado, Especialización, Maestría y Doctorado) 
en el periodo comprendido entre 2014-I y 2016-II?*/
