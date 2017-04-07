# checks if the pwd was authenticated or not.
# isAuthenticated

DROP FUNCTION IF EXISTS isAuthenticated;

DELIMITER $$ 

CREATE FUNCTION isAuthenticated()
	RETURNS BOOL
BEGIN

	DECLARE isSet BOOL;
	SET isSet := (@userINS IS NOT NULL);
	RETURN isSet;

END $$
DELIMITER ;

