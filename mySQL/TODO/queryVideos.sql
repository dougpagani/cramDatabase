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

CREATE PROCEDURE queryVideos(IN a CHAR(3), IN b INT, IN c INT)
proc_label:BEGIN
proc_label2:BEGIN
DECLARE endMessage VARCHAR(45);
DECLARE exit_code INT DEFAULT 1;

DECLARE a, b INT;

	IF NOT isLogged() THEN BEGIN
		set endMessage := "Not Logged in.";
		set exit_code:= 1;
		LEAVE proc_label2;
	END; END IF;

-- ---------------------- QUERY-CONSTRUCTION -------------------------------
SELECT * FROM video
WHERE strain LIKE "%" 
AND rnai LIKE "%"
#AND rnai = "*"
AND "heatshock" LIKE "%"
AND ovulation_no LIKE "%"
AND growth_temp LIKE "%"
AND immob_method LIKE "%"
AND date_recorded LIKE "%"
AND old_file_name LIKE "%"
AND date_archived LIKE "%"
AND archive_filepath LIKE "%"
AND full_ovulation LIKE "%"
AND is_trap LIKE "%"
AND searchCount LIKE "%"
;	
	
END; -- end context-INNER

SELECT exit_code, endMessage;

END $$
DELIMITER ;

SELECT * FROM video
WHERE strain LIKE "%" 
AND rnai LIKE "%"
#AND rnai = "*"
AND "heatshock" LIKE "%"
AND ovulation_no LIKE "%"
AND growth_temp LIKE "%"
AND immob_method LIKE "%"
AND date_recorded LIKE "%"
AND old_file_name LIKE "%"
AND date_archived LIKE "%"
AND archive_filepath LIKE "%"
AND full_ovulation LIKE "%"
AND is_trap LIKE "%"
AND searchCount LIKE "%"
;