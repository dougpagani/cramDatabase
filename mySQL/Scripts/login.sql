# login
# in: initials, pwd-hash
# out: boolean for whether the @logged-user SESSION-VARIABLE was successfully set, or not
DROP PROCEDURE IF EXISTS login;

DELIMITER $$

CREATE PROCEDURE login(IN abc char(3), IN pwdhash CHAR(64),
								OUT exit_code boolean)
BEGIN
DECLARE stored_hash char(64);
-- DECLARE exit_code BOOL DEFAULT false;
SET exit_code := false;




	# initial work
	SELECT person.pw_hash INTO stored_hash FROM person
	WHERE  (person.initials = abc);

# compare two strings
IF(pwdhash LIKE stored_hash) THEN BEGIN
# then do ...
    SET @u := abc;
    SET @exit_code := true;
	
END; END IF;


select @exit_code;
# ELSEIF true THEN 

# destroy the connection? But that would be costly in terms of time for the app's action.
# Send back a descriptive error. Is it the wrong password? The wrong username? Does the user exist?

END $$

DELIMITER ;

# Handling error-cases:

# 1. user does not exist in the db
# 2. the hash doesn't match
# 3. server-side problems?

#??? 
# 1. how to destroy a connection f/ a statement
# 2. how to fetch exit code