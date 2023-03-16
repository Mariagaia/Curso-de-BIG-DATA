PRACTICA EX.3

Extraer campos film, director, year y actor de la tabla de James Bond; filtrar por
películas publicadas hasta el año 2000, cuyo director sea Lewis Gilbert o Martin
Campbell. Excluir aquellas películas protagonizadas por Roger Moore.
● Tabla: James Bond
● Descripción de tabla: esta tabla incluye datos sobre personajes de la saga Star War

SELECT film, director, year, actor FROM jamesbond
WHERE year < 2000 AND director IN ('Lewis Gilbert', 'Martin Campbell') and actor !='Roger Moore';


PRACTICA EX.4

Extraer países que cumplan con alguna de las siguientes condiciones: (i) sean países
africanos con un índice de alfabetismo entre el 25% y 75% o (ii) países europeos con un
ratio de población viviendo en áreas urbanas menor al 50%.
● Tabla: world_health_org
● Descripción de tabla: contiene información de países provista por la Organización
Mundial de la Salud

SELECT country AS País, continent AS Continente, adult_literacy_rate AS 'Alfabetizacion', population_in_urban_areas AS 'Areas Urbanas'
FROM world_health_org
WHERE
	continent = 'Africa' AND adult_literacy_rate BETWEEN 25 AND 75
   	 OR continent = 'Europe' and population_in_urban_areas < 50
ORDER BY 1


PRACTICA EX.5

¿Cuáles son los 5 países africanos con mayor PIB (GIPC) per cápita?
● Tabla: world_health_org
● Descripción de tabla: contiene información de países provista por la Organización
Mundial de la Salud

SELECT country AS País, continent AS Continente, gross_income_per_capita AS PIB
FROM world_health_org
WHERE
	continent = 'Africa' 
ORDER BY 3 DESC
LIMIT 5


PRACTICA EX.6

Extraer las 10 películas con mayor IMDB score, filtrar por películas publicadas a
partir de la década del 80, excluir aquellas producidas en los EEUU.
● Tabla: imdb_movies
● Descripción de la tabla: esta tabla incluye data de películas publicada por
IMDB (imdb.com)

SELECT movie_title as pelicula, country AS pais, director_me As director, imdb_score AS puntuacion, title_year AS año from imdb_movies
WHERE title_year > 1979 AND country != 'USA'
ORDER BY puntuacion DESC
LIMIT 10




PRACTICA EX. 7.2

¿Qué solicitudes de crédito tienen un plazo de devolución entre 12 y 24 meses?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT duration FROM LoanData
WHERE duration BETWEEN 12 and 24

PRACTICA EX. 7.3

¿Qué solicitudes de crédito corresponden a hombres solteros?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT personal_status FROM LoanData
WHERE personal_status = 'male single'

PRACTICA EX. 7.4

¿Qué solicitudes de crédito corresponden a personas que en algún momento
han solicitado otros créditos y los han pagado?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT credit_history FROM LoanData
WHERE credit_history IN ('existing paid', 'all paid')

PRACTICA EX. 7.5

¿Qué solicitudes corresponden a personas que tienen 4 créditos o más en
curso?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT existing_credits FROM LoanData
WHERE existing_credits > 3

PRACTICA EX. 7.6

¿Qué solicitudes de crédito corresponden a un crédito de negocio?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT purpose FROM LoanData
WHERE purpose = 'business'

PRACTICA EX. 7.7

¿Qué solicitudes de crédito corresponden a un crédito de reparaciones?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT purpose FROM LoanData
WHERE purpose = 'repairs'

PRACTICA EX. 7.8

¿Qué solicitudes de crédito corresponden a personas que viven en su vivienda
de propiedad?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT housing FROM LoanData
WHERE housing = 'own'

PRACTICA EX. 7.9

Qué solicitudes de crédito corresponden a personas con más de 60 años de
edad?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT age FROM LoanData
WHERE age > 60

PRACTICA EX. 7.10

¿Qué solicitudes de crédito corresponden a personas entre 35 y 50 años de
edad?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT age FROM LoanData
WHERE age BETWEEN 35 and 50

PRACTICA EX. 7.11

¿Qué solicitudes de crédito se han aprobado?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de crédito

SELECT class FROM LoanData
WHERE class = 'good'

PRACTICA EX. 7.12

¿Qué solicitudes de crédito se han rechazado?
● Tabla: loan-data
● Descripción de la tabla: esta tabla incluye data para la entrenamiento de un
algoritmo de clasificación para la concesión de créditos

SELECT class FROM LoanData
WHERE class = 'bad'