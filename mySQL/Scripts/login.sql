# login
# in: initials, pwd-hash
# out: boolean for whether the @logged-user SESSION-VARIABLE was successfully set, or not

DELIMITER $$

CREATE PROCEDURE login(IN abc char(3), IN pwdhash CHAR(64),
								OUT exit_code boolean)
BEGIN
SET exit_code = false;
DECLARE stored_hash char(64);

	# initial work
	SELECT person.pw_hash INTO stored_hash FROM person
	WHERE  (person.initials = abc);

IF  (pwdhash LIKE stored_hash) THEN 
{
SET @user_logged_in := abc;
SET exit_code = true;
}
ELSEIF 
{
# destroy the connection? But that would be costly in terms of time for the app's action.
# Send back a descriptive error. Is it the wrong password? The wrong username? Does the user exist?
}


END $$
DELIMITER ;

# Handling error-cases:

# 1. user does not exist in the db
# 2. the hash doesn't match
# 3. server-side problems?