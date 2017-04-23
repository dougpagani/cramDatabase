# queryVideos()
use cram;
DROP PROCEDURE IF EXISTS queryVideos;
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

CREATE PROCEDURE queryVideos(IN p1 CHAR(3), IN p2 VARCHAR(10), IN p3 VARCHAR(45), IN p4 VARCHAR(45), IN p5 VARCHAR(45), p6 smallint(6),
							 IN p7 smallint(6), IN p8 VARCHAR(45), IN p9 DATE, IN p10 VARCHAR(45), IN p11 TIMESTAMP,
							 IN p12 VARCHAR(45), IN p13 BOOL, IN p14 BOOL, IN p15 int(11))
proc_label:BEGIN
proc_label2:BEGIN
DECLARE endMessage VARCHAR(45);
DECLARE exit_code INT DEFAULT 1;
DECLARE a, b INT;

SET @endMessage := "Here at code";
SET @exit_code := 1;

	IF NOT isLogged() THEN BEGIN
		set @endMessage := "Not Logged in.";
		set @exit_code:= 1; # THESE DONT LEAVE THE CONTEXT :/
		LEAVE proc_label2;
	END; END IF;

-- ---------------------- QUERY-CONSTRUCTION -------------------------------
/*
SELECT * FROM video
WHERE owner LIKE p1
AND strain LIKE p2 
AND rnai LIKE p3
#AND rnai = "*"
AND "heatshock" LIKE p4
AND sensors LIKE p5
AND ovulation_no LIKE p6
AND growth_temp LIKE p7
AND immob_method LIKE p8
AND date_recorded LIKE p9
AND old_file_name LIKE p10
AND date_archived LIKE p11
AND archive_filepath LIKE p12
AND full_ovulation LIKE p13
AND is_trap LIKE p14
AND searchCount LIKE p15
;
*/
	
END; -- end context-INNER

SELECT @exit_code, @endMessage;

END $$
DELIMITER ;

-- TESTS

-- call queryVideos(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15)
-- call queryVideos("%", "%", "%", "%", "%", "%", "%", "%", "%", "%", "%", "%", "%", "%", "%");
call queryVideos (null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

SELECT * FROM video
WHERE owner LIKE "%"
AND strain LIKE "%" 
AND rnai LIKE "%"
#AND rnai = "*"
-- AND "heatshock" LIKE "%"
-- AND `heatshock` LIKE "30m"
-- AND `heatshock` = "%"
AND `heatshock` LIKE "%"
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
-- ALL THE FIELDS
# (`owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) 