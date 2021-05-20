/* SELECT 1 */
SELECT population FROM world
  WHERE name = 'Germany';

/* SELECT 2 */
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* SELECT 3 */
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000;

/* SELECT quizz 1*/
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000;

/* SELECT quizz 2 */
/*Table-E*/
Albania	3200000
Algeria	3290000

/* SELECT quizz 3 */
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l';

/* SELECT quizz 4 */
name	length(name)
Italy	5
Malta	5
Spain	5

/* SELECT quizz 5 */
Andorra	936

/* SELECT quizz 6 */
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000;

/* SELECT quizz 7 */
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

 /* ------------------------------------------------------ */

 /* SELECT FROM 2 (the number 1 is just an example) */

 SELECT name
  FROM world
 WHERE population > 200000000

/*  SELECT FROM 3 */

SELECT name, gdp/population
FROM world
WHERE population > 200000000

/*  SELECT FROM 4 */

SELECT name, population/1000000
FROM world
WHERE continent LIKE 'South%'

/*  SELECT FROM 5 */

SELECT name, population
FROM world
WHERE name='France' OR name='Germany' OR name='Italy'

/*  SELECT FROM 6 */

SELECT name
FROM world
WHERE name LIKE '%United%'

/*  SELECT FROM 7 */

SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000

/*  SELECT FROM 8 */

SELECT name, population, area
FROM world
WHERE (area > 3000000 AND population < 250000000) OR (population > 250000000 AND area < 3000000)

/*  SELECT FROM 9 */

SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2)
FROM world
WHERE continent='South America'

/*  SELECT FROM 10 */

SELECT name, ROUND(gdp/population, -3)
FROM world
WHERE gdp >= 1000000000000

/*  SELECT FROM 11 */

SELECT name, 
       capital
  FROM world
 WHERE LEN(name)=LEN(capital)

/*  SELECT FROM 12 */

SELECT name, capital
FROM world
WHERE (LEFT(name,1)=LEFT(capital,1)) AND NOT (name=capital)

/*  SELECT FROM 13 */

SELECT name
   FROM world
WHERE (name LIKE '%a%') AND (name LIKE '%e%') AND (name LIKE '%i%') AND (name LIKE '%o%') AND (name LIKE '%u%')
  AND name NOT LIKE '% %'

/*  SELECT FROM quizz 1 */

SELECT name
  FROM world
 WHERE name LIKE 'U%'

/*  SELECT FROM quizz 2 */

SELECT population
  FROM world
 WHERE name = 'United Kingdom'

/*  SELECT FROM quizz 3 */

'name' should be name

/*  SELECT FROM quizz 4 */

Nauru	990

/*  SELECT FROM quizz 5 */

SELECT name, population
  FROM world
 WHERE continent IN ('Europe', 'Asia')

/*  SELECT FROM quizz 6 */

SELECT name FROM world
 WHERE name IN ('Cuba', 'Togo')

/*  SELECT FROM quizz 7 */

Brazil
Colombia

/* --------------------------------- */

/*  SELECT FROM nobel 1 */

SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

/*  SELECT FROM nobel 2 */

SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'Literature'

/*  SELECT FROM nobel 3 */

SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein'

/*  SELECT FROM nobel 4 */

SELECT winner
FROM nobel
WHERE yr > 1999 AND subject = 'Peace'

/*  SELECT FROM nobel 5 */

SELECT yr, subject, winner
FROM nobel
WHERE subject = 'Literature' AND (1979 < yr AND yr < 1990)

/*  SELECT FROM nobel 6 */

SELECT * FROM nobel
 WHERE winner IN('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

/*  SELECT FROM nobel 7 */

SELECT winner
FROM nobel
WHERE winner LIKE 'John%'

/*  SELECT FROM nobel 8 */

SELECT * FROM nobel
WHERE (yr = 1980 AND subject= 'Physics') OR (yr = 1984 AND subject = 'Chemistry')

/*  SELECT FROM nobel 9 */

SELECT * from nobel
WHERE yr = 1980 AND NOT (subject IN ('Chemistry', 'Medicine'))

/*  SELECT FROM nobel 10 */

SELECT * FROM nobel
WHERE (subject = 'Medicine' AND yr < 1910) OR (subject = 'Literature' AND yr > 2003)

/*  SELECT FROM nobel 11 */

SELECT * FROM nobel
WHERE winner = 'PETER GRÜNBERG'

/*  SELECT FROM nobel 12 */

SELECT * FROM nobel
WHERE winner = 'EUGENE O''NEILL'

/*  SELECT FROM nobel 13 */

SELECT winner, yr, subject FROM nobel
WHERE winner LIKE 'Sir%' ORDER BY yr DESC, winner

/*  SELECT FROM nobel 14 */

SELECT winner, subject FROM nobel
WHERE yr=1984
ORDER BY 
CASE WHEN subject IN ('Physics','Chemistry') THEN 1 ELSE 0 END, subject, winner

/* ----------SELECT FROM quizz ---------- */

/* 1 */
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

/* 2 */
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

/* 3 */
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

/* 4 */

Medicine	Sir John Eccles
Medicine	Sir Frank Macfarlane Burnet

/* 5 */
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

/* 6 */
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

/* 7 */

Chemistry	1
Literature	1
Medicine	2
Peace	1
Physics	1

/* -------------------SELECT IN SELECT -------------------- */

/* 1 */
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')

/* 2 */
SELECT name FROM world
WHERE continent='Europe' AND gdp/population > (SELECT gdp/population FROM world WHERE name = 'United Kingdom')

/* 3 */
SELECT name, continent FROM world
WHERE continent IN (SELECT continent FROM world WHERE name IN('Argentina', 'Australia'))

/* 4 */
SELECT name, population FROM world
WHERE population > (SELECT population FROM world WHERE name = 'Canada') AND
      population < (SELECT population FROM world WHERE name = 'Poland')

/* 5 */
SELECT name, CONCAT(ROUND(100*population/(SELECT population
                                          FROM world 
                                          WHERE name = 'Germany')
                          , 0)
             ,'%')
             AS percentage
FROM world
WHERE continent = 'Europe'

/* 6 */
SELECT name
FROM world
WHERE gdp > ALL(SELECT gdp
                   FROM world
                  WHERE gdp>0 AND continent = 'Europe')

/* 7 */
SELECT continent, name, area 
  FROM world
 WHERE area IN (SELECT MAX(area) 
                  FROM world 
                 GROUP BY continent);

/* 8 */
SELECT continent, MIN(name)
FROM world
GROUP BY continent

/* 9 */
SELECT name, continent, population FROM world x
  WHERE 25000000>=ALL (SELECT population FROM world y
                         WHERE x.continent=y.continent
                         AND population>0)

/* 10 */
SELECT name, 
       continent
FROM   world x 
WHERE  population > 
       (SELECT 3 * MAX(population) 
        FROM   world y 
        WHERE  x.continent = y.continent 
               AND x.name <> y.name) 

/* ------- SELECT IN SELECT Quizz ------- */

/* 1 */

SELECT region, name, population FROM bbc x WHERE population <= ALL (SELECT population FROM bbc y WHERE y.region=x.region AND population>0)

/* 2 */

SELECT name,region,population FROM bbc x WHERE 50000 < ALL (SELECT population FROM bbc y WHERE x.region=y.region AND y.population>0)

/* 3 */
SELECT name, region FROM bbc x
 WHERE population < ALL (SELECT population/3 FROM bbc y WHERE y.region = x.region AND y.name != x.name)

/* 4 */

Table-D
France
Germany
Russia
Turkey

/* 5 */
SELECT name FROM bbc
 WHERE gdp > (SELECT MAX(gdp) FROM bbc WHERE region = 'Africa')

/* 6 */

SELECT name FROM bbc
 WHERE population < (SELECT population FROM bbc WHERE name='Russia')
   AND population > (SELECT population FROM bbc WHERE name='Denmark')

/* 7 */

Table-B
Bangladesh
India
Pakistan

/* ---------------SUM and COUNT----------------- */

/* 1 */
SELECT SUM(population)
FROM world
/* 2 */
SELECT DISTINCT continent
FROM world
/* 3 */
SELECT SUM(gdp)
FROM world
WHERE continent ='Africa'
/* 4 */
SELECT COUNT(name)
FROM world
WHERE area >= 1000000
/* 5 */
SELECT SUM(population)
FROM world
WHERE name IN ('Estonia','Latvia','Lithuania')
/* 6 */
SELECT continent, COUNT(name)
FROM world
GROUP BY continent
/* 7 */
SELECT continent, COUNT(name)
FROM world
WHERE population >= 10000000
GROUP BY continent
/* 8 */
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000

/* --------- SUM and COUNT quizz ------- */

/* 1 */
 SELECT SUM(population) FROM bbc WHERE region = 'Europe'

/* 2 */
SELECT COUNT(name) FROM bbc WHERE population < 150000

/* 3 */
AVG(), COUNT(), MAX(), MIN(), SUM()

/* 4 */
No result due to invalid use of the WHERE function

/* 5 */
 SELECT AVG(population) FROM bbc WHERE name IN ('Poland', 'Germany', 'Denmark')

/* 6 */
 SELECT region, SUM(population)/SUM(area) AS density FROM bbc GROUP BY region

/* 7 */
 SELECT name, population/area AS density FROM bbc WHERE population = (SELECT MAX(population) FROM bbc)

/* 8 */

Table-D
Americas	732240
Middle East	13403102
South America	17740392
South Asia	9437710

/*----------------------JOIN------------------ */

SELECT matchid, player FROM goal 
  WHERE teamid LIKE 'GER'

SELECT id,stadium,team1,team2
  FROM game
WHERE id = 1012;

SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid) where teamid LIKE 'GER'

SELECT team1, team2, player
FROM game JOIN goal ON (id=matchid) where player LIKE 'Mario%'

SELECT player, teamid, coach, gtime
  FROM goal join eteam ON (teamid=id)
 WHERE gtime<=10

Select mdate, teamname from game JOIN eteam ON (team1=eteam.id) where coach like 'Fernando Santos'

Select player from goal join game on (matchid=id) where stadium LIKE 'National Stadium, Warsaw';

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (team1='GER' OR team2='GER') AND teamid!='GER'

SELECT teamname, COUNT(*)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

select stadium, count(*) from game join goal on (matchid=id) group by stadium

SELECT matchid,mdate, count(*)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL') Group by matchid, mdate

Select matchid, mdate, Count(*) from game join goal on (matchid=id) where teamid LIKE 'GER' group by matchid, mdate

SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score2
  FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, matchid, team1, team2
ORDER BY mdate, matchid, team1, team2


/* -------------------- MORE JOIN -------------------*/

SELECT id, title
 FROM movie
 WHERE yr=1962

Select yr from movie where title = 'Citizen Kane'

Select id, title, yr from movie where title Like '%Star Trek%'

Select id from actor where name= 'Glenn Close'

Select id from movie where title = 'Casablanca'

Select name from actor join casting on (id = actorid) where movieid = 27

Select name from actor join casting on (id = actorid) where movieid LIKE (Select id from movie where title = 'Alien' )

Select title from movie join casting on id=movieid  where actorid LIKE (Select id from actor where name = 'Harrison Ford' )

Select title from movie join casting on id=movieid  where actorid LIKE (Select id from actor where name = 'Harrison Ford' ) and ord != 1

SELECT title, name
FROM movie
 JOIN casting
ON movie.id = casting.movieid
 JOIN actor 
ON actor.id = casting.actorid
WHERE yr = '1962' AND ord=1;

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Doris Day'
GROUP BY yr
HAVING COUNT(title) > 1

SELECT title, name 
FROM movie
INNER JOIN casting
ON movie.id = casting.movieid
INNER JOIN actor
ON actor.id = casting.actorid
WHERE movieid IN ( 
  SELECT movieid FROM casting 
  WHERE actorid IN (
    SELECT id FROM actor
    WHERE name='Julie Andrews') )
AND ord =1;

SELECT name
FROM actor
JOIN casting
ON actor.id=casting.actorid
 JOIN movie
ON movie.id = casting.movieid
WHERE ord=1
GROUP BY name
HAVING COUNT(actorid)>=15

SELECT title, COUNT(movieid)
FROM movie
 JOIN casting
ON movie.id = casting.movieid
 JOIN actor
ON actor.id = casting.actorid
WHERE yr= '1978'
GROUP BY title
ORDER BY COUNT(movieid) DESC, title

SELECT DISTINCT name
FROM actor
 JOIN casting
ON actor.id=casting.actorid
JOIN movie
ON movie.id = casting.movieid
WHERE movieid IN (
  SELECT movieid FROM casting 
  WHERE actorid IN (
    SELECT id FROM actor 
    WHERE name LIKE 'Art Garfunkel'))
AND name NOT LIKE 'Art Garfunkel'

/*-----------------------NULL--------------------------*/


Select teacher.name from teacher Left join dept on dept= dept.id where dept is null 

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id)

SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)

SELECT name, COALESCE(mobile, '07986 444 2266') 
FROM teacher

SELECT teacher.name, COALESCE(dept.name, 'None') 
FROM teacher left join dept on dept = dept.id

Select Count(*) teachers, Count(mobile) mobiles from teacher

Select dept.name ,count(teacher.name) from teacher right join dept on dept = dept.id group by dept.name

SELECT teacher.name, 
CASE teacher.dept 
WHEN '1' THEN 'Sci'
ELSE 'Art'
END dept
FROM teacher


SELECT teacher.name, 
CASE teacher.dept 
WHEN '1' THEN 'Sci'
WHEN '2' THEN 'Sci'
ELSE 'None'
END dept
FROM teacher

/* ------------------- SELF JOIN -------------------- */
select count(*) from stops

select id from stops where name like 'Craiglockhart' 

select id, name from stops join route on stops.id = stop where company like 'LRT' and num like '4'

SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num Having COUNT(*) = 2

SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149

SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and  stopb.name='London Road'

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' and  stopb.name='Leith' 

SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and  stopb.name='Tollcross' 

SELECT DISTINCT  stopb.name, a.company, a.num
FROM route a JOIN route b ON
  ( a.company= b.company and a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and  a.company='LRT' 

SELECT  a.num, a.company,  stops.name,  d.num, d.company
FROM route a JOIN route b ON
  ( a.company= b.company and a.num=b.num)
  JOIN stops  ON (b.stop=stops.id)
  JOIN route c ON
  ( c.stop= stops.id)
 JOIN route d ON
  ( c.company= d.company and c.num=d.num)
WHERE a.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
AND d.stop = (SELECT id FROM stops WHERE name = 'Lochend')
ORDER BY a.num, stops.name, d.num;

