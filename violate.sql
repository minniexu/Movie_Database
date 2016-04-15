-- Three primary key constraints:
-- 1. id in Movie
-- 2. id in Actior
-- 3. id in Director
UPDATE Movie SET id = 10 WHERE year = 1999; #violates primary key feature of id in Movie by setting movie as same id
#ERROR 1062 (23000): Duplicate entry '1' for key 1

UPDATE Actor SET id = 10 WHERE last = 'King'; #violates primary key feature of id in Actor by setting all with last name 'King' as same id
#ERROR 1062 (23000): Duplicate entry '1' for key 1

UPDATE Director SET id = 10 WHERE first = 'Adam'; #violates primary key feature of id in Director by setting all with first name 'Adam' as same id
#ERROR 1062 (23000): Duplicate entry '1' for key 1

-- Six referential integrity constraints
UPDATE MovieDirector SET mid = 0; #violates mid in MovieDirector table since they refer to Movie id field.
#Cannot add or update a child row: a foreign key constraint fails

INSERT INTO MovieGenre VALUES (1000, 'Action'); #violates mid field since 1000 is not an id in Movie table
#Cannot add or update a child row: a foreign key constraint fails

UPDATE MovieActor SET aid = mid - 1; #violates any aid in MovieActor since they refer to id in Actor table
#Cannot add or update a child row: a foreign key constraint fails

INSERT INTO MovieDirector VALUES(1, 50000); #there is not a movie director with id = 50000, mid is set to be a foreign key constraint here, there should exist a row that has id=mid in movie table 
#Cannot add or update a child row: a foreign key constraint fails

UPDATE MovieDirector SET did = 70000 WHERE mid = 5000; #violates any did since 70000 is not an id in MovieDirector table
#Cannot add or update a child row: a foreign key constraint fails

DELETE FROM Movie WHERE id<1000; #cannot delete any id in Movie table since they refer to mid in MovieGenre field.
#Cannot delete or update a parent row: a foreign key constraint fails

-- Three CHECK constraints
#violates the Check constraint on the id field with -1 < 0 in Movie field
INSERT INTO Movie (id) VALUES (-1);
#violates the Check constraint on the id field with -1 < 0 in Actor field
INSERT INTO Actor (id) VALUES (-1);
#violates the Check constraint on the id field with -1 < 0 in Director field
INSERT INTO Director (id) VALUES (-1);
