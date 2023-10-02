--WARM UP: 15 movies with the highest rating starting from 2020--

SELECT movie_title, movie_year, genre, rating FROM movie_db
WHERE movie_year >= 2020
ORDER BY rating DESC
LIMIT 15;

--Let's see if the ratings and votes correlate--

SELECT movie_title, movie_year, genre, votes, rating FROM movie_db
WHERE movie_year >= 2020
ORDER BY votes DESC, rating
LIMIT 15;

--Yep! And as expected, I've seen all of the above already. Now, curious if all those horror movie top lists are data-driven.--

SELECT movie_title, votes, rating FROM movie_db
ORDER BY votes DESC, rating
LIMIT 25;

--IGN got 7 correct. 28% accuracy. New approach: find the year with the highest overall ratings--

SELECT movie_year, ROUND(AVG(rating),2) as average_rating, COUNT(movie_year) FROM movie_db
GROUP BY movie_year
HAVING COUNT(movie_year) > 10 --Added COUNT to exclude years with only 1 or 2 movies--
ORDER BY AVG(rating) DESC
LIMIT 10;

--1992 is our champion - no surprises, several classics there. Let's see which year gave us the most horror movies--

SELECT movie_year, COUNT(*) FROM movie_db
GROUP BY movie_year
ORDER BY COUNT(*) DESC
LIMIT 15;

--Turns out, horror has peaked in 2019, but which year brought the most in terms of box office?--

SELECT movie_year, SUM(gross_earning) as box_office FROM movie_db
WHERE gross_earning IS NOT NULL
GROUP BY movie_year
ORDER BY SUM(gross_earning) DESC
LIMIT 15;

--2017-2019 all grossed above $1 billion, nice. Now, I want to look at the PUREST horror--

SELECT movie_title, movie_year, genre, rating FROM movie_db
WHERE genre = 'Horror'
ORDER BY rating DESC

--Curious, in the whole dataset there are only 50 movies with no subgenres added. The Exorcist is the highest rated among them.--

--After exploring the database a bit, I'm ready to pull a list that my friends may enjoy. Since some of them are scaredy cats, I'm only including movies with the Comedy subgenre--

SELECT movie_title, movie_year, runtime, genre, rating FROM movie_db
WHERE movie_year BETWEEN 2005 AND 2019 AND RATING > 6.5
AND genre LIKE '%Comedy%' AND genre NOT LIKE '%Animation%'
LIMIT 10

--Looks like a pretty good selection! This Halloween is bound to be fun.--
