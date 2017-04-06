# queryVideos()

# This is a versatile stored procedure for which you can query anything you'd like.
/* OPTIONS:
- By strain
- By person
- By date-range
- By timepoint-completion
- By isRecent Flag
- By "new timepoints" flag -- how would that be stored?
- By metrics
*/
/* Error-Handling:
- no such video, empty-result-set
-
*/

DELIMITER $$ 

CREATE PROCEDURE queryVideos()
BEGIN
	IF 
	SELECT 

END $$
DELIMITER ;