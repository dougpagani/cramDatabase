# checks if the pwd was authenticated or not.
# isAuthenticated

DELIMITER $$ 

CREATE FUNCTION isAuthd()
	RETURNS BOOL
BEGIN
	RETURN (NOT NULL @userINS);

END $$
DELIMITER ;
