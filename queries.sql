-- Give me the names of all the actors in the movie 'Die Another Day'. Please also make sure actor names are in this format:  <firstname> <lastname>   (seperated by a single space). 
-- Find the join of Actor, Movie and MovieActor Tables and select actors' first name and last name of movie "Die Another Day"
SELECT CONCAT(Actor.first,' ',Actor.last) FROM Actor, Movie, MovieActor WHERE Movie.title = 'Die Another Day' AND Movie.id = mid AND Actor.id = aid ORDER BY Actor.first;

-- Give me the count of all the actors who acted in multiple movies.
-- Find actor id that have more than one movie id using GROUP BY and count the actors' number;
SELECT COUNT(*) FROM (SELECT Actor.id FROM Actor, MovieActor WHERE Actor.id = aid GROUP BY Actor.id HAVING COUNT(mid) > 1) actors;

-- Find movies' title by the join of Sales and Movie when tiecketsSold is greater than 1000000;
SELECT Movie.title FROM Sales, Movie WHERE ticketsSold > 1000000 AND Movie.id = mid;

-- Find the no. of female actors with the same and duplicate birthday;
SELECT Actor.dob, COUNT(*) FROM Actor WHERE sex = 'female' GROUP BY dob HAVING count(*) > 1 ORDER BY dob; 

-- Find all the action movies from 2000 and ordered by year
SELECT Movie.title FROM Movie, MovieGenre WHERE Movie.id = mid AND Movie.year > 2000 AND genre = 'Action' ORDER BY year;