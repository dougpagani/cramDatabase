# Delete my timepoints
# Necessitates authentication-check first
# Will take a vid you want to delete
USE cram;

DROP PROCEDURE IF EXISTS deleteTimepoint;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE deleteTimepoint(IN v INT, IN s CHAR(3))
this_label:BEGIN
DECLARE thisOwner CHAR(3);
DECLARE ret VARCHAR(45);
# Which user does this vid belong to?
SELECT owner
FROM video
WHERE video.vid = v
INTO thisOwner;



# An elegant solution for the constrained SQL-syntax:
# 1) Are the inputs not NULL?
# 2) Is the owner of the video the same as the person who is logged-in?
# 3) Is the logged-in user properly Authenticated?
# 4) Well OK, then they can delete that timepoint of their video from any scientist.
SELECT "One of these are null.";
	# CHECK (1)
     IF v IS NULL OR s IS NULL THEN
          LEAVE this_label;
     END IF;
SELECT "Post-check 1";
	# CHECK (2)
	 IF thisOwner != @user THEN
		LEAVE this_label;
	END IF;
SELECT "Post-check 2";
	# CHECK (3)
	IF !isAuthenticated() THEN
		LEAVE this_label;
	END IF;
SELECT "Post-check 3";
	IF isAuthenticated() THEN BEGIN
		DELETE FROM timepoints where vid = v AND scientist = s;
		# Return an exit_code
		# SELECT 1;
		SELECT CONCAT("vid ", v, " deleted from ", "s.") INTO endMessage;
	END; END IF;


SELECT endMessage;

/* possible extra security -- only delete from a subset-query, start-set isolation
SELECT * #vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name, full_ovulation, is_trap
FROM video
WHERE video.owner = @user;
*/
END $$
DELIMITER ;

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
SELECT pw_hash FROM person WHERE initials = "jab";
