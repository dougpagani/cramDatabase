# OUTPUT:
# [,1] -- exit_code (0 == success)
# [,2] -- informative message if successful

USE cram;
DROP PROCEDURE IF EXISTS deleteVideo;
# deleteVideo()

# This is a stored-procedure which has the capacity to wreck
# ... havoc by the user, wittingly or unwittingly. As a result,
# ... it will have to be heavily checked.

# Questions of usability-design:
# 1. does the user delete by vid? maybe the app can query, then collect them 
# ... dynamically, and amass a list.
# 2. search by user, attributes, timepoint threshold
# search by GO-term

# Design-usability:
# - verification first? Or can that just be managed app-side?

/* Checks:
1. is this the user that is logged-in? 
2. does the video have some special lock on it?
*/

DELIMITER $$ 

CREATE PROCEDURE deleteVideo(IN v INT)
this_label:BEGIN 

DECLARE thisOwner CHAR(3);
DECLARE endMessage VARCHAR(45);
DECLARE exit_code INT;
# Get the video's owner
SELECT video.owner
FROM video
WHERE video.vid = v
INTO thisOwner;

	# CHECK (2)
     IF v IS NULL THEN
        SELECT 2;
		LEAVE this_label;
     END IF;
	# CHECK (3)
	 IF thisOwner != @user THEN
		SELECT 3;
		LEAVE this_label;
	END IF;
	# CHECK (4)
	IF !isAuthenticated() THEN
		SELECT 4;
		LEAVE this_label;
	END IF;
	IF isAuthenticated() THEN BEGIN
		DELETE FROM video where vid = v AND owner = @user;
		#SELECT IF(ROW_COUNT() > 0, 0, 1) INTO exit_code;
		SELECT IF(ROW_COUNT() > 0, 0, 1) INTO exit_code;
		# Return an exit_code
		
		IF (exit_code = 0) THEN 
			SELECT CONCAT("vid ", v, " deleted: owned by ", @user) INTO endMessage;
		END IF;
	END; END IF;
#######

SELECT exit_code, endMessage;

END $$
DELIMITER ;

# TESTS
/*
# Setup
SELECT @user := "dpa";
SELECT @pwdhash := "92e89237bba3c2562f4b17d94c6ce27e88549c8225f874b263f691eb57c79eb8";

START TRANSACTION;
SELECT * from timepoints where vid = 1; #> should be a couple rows
call deleteVideo(1);
SELECT * from timepoints where vid = 1; #> should be now null
ROLLBACK;

SELECT * FROM video WHERE owner = "dpa";

ALTER TABLE timepoints DROP FOREIGN KEY Video;
ALTER TABLE timepoints ADD CONSTRAINT Video FOREIGN KEY (vid)
    REFERENCES video (vid) ON UPDATE CASCADE ON DELETE CASCADE;
*/
/*


*/