# checks if the pwd was authenticated or not.
# isAuthenticated

DROP FUNCTION IF EXISTS isAuthenticated;

DELIMITER $$ 

CREATE FUNCTION isAuthenticated()
	RETURNS BOOL
BEGIN
DECLARE u char(3);
DECLARE p char(64);
DECLARE stored_hash char(64);
DECLARE answer BOOL default false;

	SET u := @user;
	SET p := @pwdhash;

	# initial work
	SELECT person.pw_hash INTO stored_hash FROM person
	WHERE  (person.initials = u);

# compare two strings

if isLogged() 
then set answer := NOT STRCMP(p, stored_hash); 
ELSE set answer := false;
END IF;

RETURN answer;

END $$
DELIMITER ;

# BUGS:

# will return null if the initial `SELECT INTO` ... not a blah
# can fix it on isLogged
