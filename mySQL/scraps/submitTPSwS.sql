# submitTPS
# Once the scientist has gone-through the video, and the data has been validated
# ... at the app-end (i.e. error-handling need-not-be-handled here), submit the set.
# CAVEAT: must check that this row is unique, else the database will throw an error.
# Error Handle problems:
# 1. did the user already submit a tp-set for this? (eventually, build-in this as an
# ... add'l check in todoList.sql.

# IN: a text-s
USE cram;
DROP PROCEDURE IF EXISTS submitTPS;

DELIMITER $$ 

# Pass them in individually
CREATE PROCEDURE submitTPS(IN v INT, IN s CHAR(3), IN t1 INT, IN t2 INT, IN t3 INT, IN t4 INT)
BEGIN
	# Check if logged-in.
	
	# Check if duplicate-person.

	# TODO: figure out this converstion//hand-off
	INSERT INTO timepoints VALUES (v, s, t1, t2, t3, t4);

END $$
DELIMITER ;

# Examples


#call uploadTPS(1, 'AAA', 33, 23, 140, 220);
#select * from timepoints;