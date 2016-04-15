CREATE TABLE Movie(id INT NOT NULL, title VARCHAR(100) NOT NULL, year INT NOT NULL, rating VARCHAR(10), company VARCHAR(50), PRIMARY KEY (id), CHECK(id >= 0 AND id <= MaxMovieID(id)), CHECK(year > 0), CHECK(rating IN ('G','PG','PG-13','R','NC-17','NR'))) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE Actor(id INT NOT NULL, last VARCHAR(20), first VARCHAR(20), sex VARCHAR(6), dob DATE, dod DATE, PRIMARY KEY (id), CHECK(id >= 0 AND id <= MaxPersonID(id)), CHECK(sex IN ('Female', 'Male'))) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE Sales(mid INT NOT NULL,ticketsSold INT,totalIncome INT,FOREIGN KEY (mid) REFERENCES Movie(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id)),CHECK(ticketsSold >= 0),CHECK(totalIncome >= 0)) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE Director(id INT NOT NULL,last VARCHAR(20),first VARCHAR(20),sex VARCHAR(6),dob DATE,dod DATE,PRIMARY KEY (id),CHECK(id >= 0 AND id <= MaxPersonID(id))) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE MovieGenre(mid INT NOT NULL,genre VARCHAR(20),FOREIGN KEY (mid) REFERENCES Movie(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id))) ENGINE = INNODB;

CREATE TABLE MovieDirector(mid INT NOT NULL,did INT NOT NULL,FOREIGN KEY (mid) REFERENCES Movie(id),FOREIGN KEY (did) REFERENCES Director(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id)),CHECK(did >= 0 AND mid <= MaxPersonID(id))) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE MovieActor(mid INT NOT NULL,aid INT NOT NULL,role VARCHAR(50),FOREIGN KEY (mid) REFERENCES Movie(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id)),FOREIGN KEY (aid) REFERENCES Actor(id),CHECK(aid >= 0 AND mid <= MaxPersonID(id))) ENGINE = INNODB, CHARACTER SET utf8;

CREATE TABLE MovieRating(mid INT NOT NULL,imdb INT,rot INT,FOREIGN KEY (mid) REFERENCES Movie(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id)),CHECK(imdb >= 0 AND imdb <= 100),CHECK(rot >= 0 AND rot <= 100)) ENGINE = INNODB;

CREATE TABLE Review(name VARCHAR(20) NOT NULL,time TIMESTAMP,mid INT NOT NULL,rating INT,comment VARCHAR(500),FOREIGN KEY (mid) REFERENCES Movie(id),CHECK(mid >= 0 AND mid <= MaxMovieID(id)),CHECK(rating >= 0 AND rating <= 5)) ENGINE = INNODB;

CREATE TABLE MaxPersonID(id INT NOT NULL) ENGINE = INNODB;

CREATE TABLE MaxMovieID(id INT NOT NULL) ENGINE = INNODB;

