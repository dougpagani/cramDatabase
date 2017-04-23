# Delete my timepoints
# Necessitates authentication-check first
# Will take a vid you want to delete
USE cram;

DROP PROCEDURE IF EXISTS deleteTimepoint;
DELIMITER $$

# OUT: 0 == SUCCESS, >1 == FAILURE-CODE
CREATE PROCEDURE deleteTimepoint(IN v INT, IN s CHAR(3))
this_label:BEGIN
DECLARE thisOwner CHAR(3);
DECLARE endMessage VARCHAR(45);
DECLARE exit_code INT;
# Which user does this vid belong to?
SELECT owner
FROM video
WHERE video.vid = v
INTO thisOwner;

# An elegant solution for the constrained SQL-syntax:
# 2) Are the inputs not NULL?
# 3) Is the owner of the video the same as the person who is logged-in?
# 4) Is the logged-in user properly Authenticated?
# 5) Well OK, then they can delete that timepoint of their video from any scientist.

	# CHECK (2)
     IF v IS NULL OR s IS NULL THEN
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
		DELETE FROM timepoints where vid = v AND scientist = s;
		SELECT IF(ROW_COUNT() > 0, 0, 1) INTO exit_code;
		
		# Return an exit_code		
		IF (exit_code = 0) THEN 
			SELECT CONCAT("Timepoints from scientist ", s, "deleted from ", v) INTO endMessage;
		END IF;
	END; END IF;


SELECT exit_code, endMessage;

/* possible extra security -- only delete from a subset-query, start-set isolation
SELECT * #vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name, full_ovulation, is_trap
FROM video
WHERE video.owner = @user;
*/
END $$
DELIMITER ;
# TESTING DELETION
# "information functions" -- for trouble-shooting
# RESULT: There is a bug for ROW_COUNT ...
/*
SELECT CURRENT_USER();
SELECT USER();
SELECT CONNECTION_ID();
SELECT ROW_COUNT();
SELECT LAST_INSERT_ID(); #> only if it was an auto-increment ID
call deleteTimepoint(1, "jab"); #> post-check (4)

SELECT * FROM timepoints WHERE scientist = "jab";
INSERT INTO timepoints VALUES (1, "JAB", 50, 120, 400, 500);
DELETE FROM timepoints where vid = 1 AND scientist = "jab";
DELETE FROM timepoints where scientist = "jab";

call mysql_affected_rows();
SELECT LAST_INSERT_ID();
START TRANSACTION;
Rollback;

/*
# TEST data
SELECT * FROM timepoints;
SELECT * from timepoints where scientist = "DPA";
INSERT INTO timepoints VALUES (1, "JAB", 50, 120, 400, 500);
DELETE FROM timepoints where vid = 1 AND scientist = "JAB";

SELECT @user := null;
SELECT @pwdhash := null;
call deleteTimepoint(1, null); #> One of these are null
SELECT isAuthenticated();
SELECT @user := "jab";
call deleteTimepoint(1, "jab"); #> post-check (1) : This user doesn't own the video.
call deleteTimepoint(1, "jab"); #> post-check (2)
SELECT @user := "dpa";
call deleteTimepoint(1, "jab"); #> post-check (3)
SELECT @pwdhash := "xxx";
# Wrong hash
call deleteTimepoint(1, "jab"); #> post-check (2)
SELECT @pwdhash := "14975af22f0ae95c99edcb8693356459ab88c002e3bb7e39fe37cb826b3ac712";
# Right hash
call deleteTimepoint(1, "jab"); #> post-check (2)
SELECT @pwdhash := "92e89237bba3c2562f4b17d94c6ce27e88549c8225f874b263f691eb57c79eb8";
SELECT isAuthenticated();
SELECT @user;
call deleteTimepoint(1, "jab"); #> post-check (4)

DESCRIBE person;
SELECT pw_hash FROM person WHERE initials = "dpa";

*/
# This works now, in-context, but not in workbench. In terminal, yes it works, so it isn't a procedure-problem, it's a workbench problem.
/*
START TRANSACTION;

SELECT vid from video WHERE owner = "DPA";
SELECT * from timepoints WHERE scientist = "JAB";
INSERT INTO timepoints VALUES (1, "jab", 10, 20, 30, 40);
call deleteTimepoint(1, "jab");
ROLLBACK;
*/