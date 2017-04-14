DROP FUNCTION IF EXISTS loginf;

DELIMITER $$

CREATE FUNCTION loginf(abc char(3), inputhash CHAR(64))
		RETURNS BOOL
		DETERMINISTIC
BEGIN
DECLARE stored_hash char(64);
DECLARE exit_code BOOL DEFAULT false;
-- DECLARE exit_code BOOL DEFAULT false;
-- SET exit_code := false;


	# get the stored-hash associated with the initials provided for login
	SELECT person.pw_hash INTO stored_hash FROM person
	WHERE  (person.initials = abc);

# compare two strings ... STRCMP() returns 0 if exact match, and -1 & 1 are both computed to 0 with `NOT`
# ----------------------------
IF(NOT STRCMP(inputhash, stored_hash)) THEN BEGIN

    SET @user := abc;
	SET @pwdhash := inputhash;
    SET exit_code := true;
	
END; END IF;
# ----------------------------

RETURN exit_code;
# ELSEIF true THEN 

# destroy the connection? But that would be costly in terms of time for the app's action.
# Send back a descriptive error. Is it the wrong password? The wrong username? Does the user exist?

END $$

DELIMITER ;
# SELECT initials, pw_hash FROM person
# SELECT loginf("dpa", "e77a58908f66bf61ac22e5d6131288c54295cfb97153d1bf180eff97f3b53232") as 'fx' \G
#> 1
#> bugs: the hash is NOT case-sensitively-checked... but of course that doesn't matter.