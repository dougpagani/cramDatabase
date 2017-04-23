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
CREATE PROCEDURE submitTPS(IN v INT, IN t1 INT, IN t2 INT, IN t3 INT, IN t4 INT)
BEGIN
DECLARE exit_code BOOL default false;
	# Check if logged-in.
	
	# Check if duplicate-person.
	
	IF isAuthenticated() THEN BEGIN
	INSERT INTO timepoints VALUES (v, @user, t1, t2, t3, t4);
	SET exit_code := true;
	END; END IF;
SELECT exit_code;
END $$
DELIMITER ;

# Examples

#call submitTPS(1, 33, 23, 140, 220);
#select * from timepoints;