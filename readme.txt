Readme.txt

In this project, we create tables in MySQL where SQL script is named as create.sql and the data is loaded into the tables by load.sql.

So it is easy to load and query the dataset in Ubuntu shell:

% mysql CS143 < create.sql
% mysql CS143 < load.sql

queries.sql explore the dataset which answer the questions using SELECT statement and the description for each question is commented in the script.
-- Find the join of Actor, Movie and MovieActor Tables and select actors' first name and last name of movie "Die Another Day"
-- Find actor id that have more than one movie id using GROUP BY and count the actors' number;
-- Find movies' title by the join of Sales and Movie when tiecketsSold is greater than 1000000;
-- Find the no. of female actors with the same and duplicate birthday;
-- Find all the action movies from 2000 and ordered by year


query.php builds a web query interface where user just need to enter an SQL query in the input box shown by the result page and results would be given. In this part, user is assumed to provide correct queries.


violate.sql identifies the constraints provided and primary key constraints, foreign key constraints and CHECK constraints are given here.
