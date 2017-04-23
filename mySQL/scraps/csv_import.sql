LOAD DATA LOCAL INFILE '/Users/Doug/Desktop/persons.csv' INTO TABLE person
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS # ignore the header
;

select * from person;

delete FROM person WHERE initials="ini"; 

delete from person WHERE initials LIKE "b%%";

delete from person WHERE initials LIKE "jba";


LOAD DATA LOCAL INFILE '/Users/Doug/Desktop/video.csv' INTO TABLE video
	FIELDS TERMINATED BY ',' 
	ENCLOSED BY '"'
	LINES TERMINATED BY '\n'
	IGNORE 1 ROWS # ignore the header
;

select * from video;