USE cram;


-- SIMPLE QUERYING OF VIDEO RECORDS
-- IN: 10 possibilities
DROP PROCEDURE IF EXISTS simpleQuery;
DELIMITER $$ 

CREATE PROCEDURE simpleQuery(IN p1 CHAR(3), IN p2 VARCHAR(10), IN p3 VARCHAR(45), IN p4 VARCHAR(45), IN p5 VARCHAR(45), 
							 IN p6 smallint(6), IN p7 VARCHAR(45), IN p8 DATE, IN p9 VARCHAR(45), IN p10 BOOL, IN p11 BOOL)
this_label:BEGIN 
# SUBSTITUTE WITH THE QUERY OPERATOR "IDENTITIES" 
# ... so nulls can be passed in as if they weren't there at all (if the user doesn't want to split on a given parameter)
SET @p1 := IF(p1 IS NULL, "%", p1);
SET @p2 := IF(p2 IS NULL, "%", p2);
SET @p3 := IF(p3 IS NULL, "%", p3);
SET @p4 := IF(p4 IS NULL, "%", p4);
SET @p5 := IF(p5 IS NULL, "%", p5);
SET @p6 := IF(p6 IS NULL, "%", p6);
SET @p7 := IF(p7 IS NULL, "%", p7);
SET @p8 := IF(p8 IS NULL, "1985-01-01", p8);
SET @p9 := IF(p9 IS NULL, "%", p9);
SET @p10 := IF(p10 IS NULL, "%", p10);
SET @p11 := IF(p11 IS NULL, "%", p11);


SELECT * FROM video
WHERE owner LIKE @p1 # 1 -- E 
AND strain LIKE @p2  # 2 -- E
AND rnai LIKE @p3     # 3 -- E
AND heatshock LIKE @p4 # 4 -- E
AND sensors LIKE @p5 -- E
# could add ranges
AND growth_temp LIKE @p6 # 6 -- Range?
# could add ranges for this
AND immob_method LIKE @p7 # 7 -- E
AND date_recorded BETWEEN @p8 AND DATE(NOW()) 
# could add exact-date match ... or by month, or by day-name
AND old_file_name LIKE @p9 # 9 -- pattern matching, need to add %'s on app-side
AND full_ovulation LIKE @p10 # 10 -- B
AND is_trap LIKE @p11 # 11 -- B
;

#SELECT exit_code, endMessage;

END $$
DELIMITER ;
/*
-- ---------------------------
# TESTS
-- call simpleQuery(o, s, r, hs, srs, gt, im, datr, ofn, fo, it);
call simpleQuery(null, null, null, null, null, null, null, null, null, null, null);
call simpleQuery("dpa", "UN1417", "cku-80", "30m", "GCaMP3", 25, "10% agarose, beads", "2017-03-24", "%Great%", TRUE, FALSE);
call simpleQuery(null, null, null, null, null, null, null, "2017-03-25", null, null, null);
-- ------------------------------------------
# ARCHITECTURE:

SELECT * FROM video
WHERE owner LIKE "%"
AND strain LIKE "%" 
AND rnai LIKE "%"
AND heatshock LIKE "%"
AND growth_temp LIKE "%"
AND immob_method LIKE "%"
AND date_recorded LIKE "%"
AND old_file_name LIKE "%"
AND full_ovulation LIKE FALSE
AND is_trap LIKE "%"
;

SELECT * FROM video;
-- ---------------------------------------------------------------

*/