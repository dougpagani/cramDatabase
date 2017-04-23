# checks if the pwd was authenticated or not.
# Feeds into isAuthenticated

DROP FUNCTION IF EXISTS isLogged;

DELIMITER $$ 

CREATE FUNCTION isLogged()
	RETURNS BOOL
BEGIN
	DECLARE isSet BOOL;
	DECLARE islogged bool default false;

	SET isSet := (@user IS NOT NULL AND @pwdhash IS NOT NULL);
	IF isSet THEN BEGIN
	
	SELECT EXISTS(SELECT initials FROM person WHERE initials=@user) INTO islogged;
	
	END; END IF;

	RETURN islogged;

END $$
DELIMITER ;


#SELECT @islogged := EXISTS(SELECT initials FROM person WHERE initials=@user);

#select @islogged;