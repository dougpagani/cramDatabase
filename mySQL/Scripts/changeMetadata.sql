# Change a VIDEO RECORD
# INPUT: vid, (...) -- list of parameters to possibly change

# EXAMPLE RECORD:: INSERT INTO `video` (`vid`, `owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) VALUES (1, 'DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);
USE cram;

DROP PROCEDURE IF EXISTS changeMetadata;
DELIMITER $$ 

CREATE PROCEDURE changeMetadata(IN p0 INT, IN p1 VARCHAR(10), IN p2 VARCHAR(45), IN p3 VARCHAR(45), IN p4 VARCHAR(45), 
							 IN p5 smallint(6), IN p6 smallint(6), IN p7 VARCHAR(45), IN p8 BOOL, IN p9 BOOL)
this_label:BEGIN 
DECLARE x1 VARCHAR(10);
DECLARE x2, x3, x4, x7 VARCHAR(45);
DECLARE x5, x6 smallint(6);
DECLARE x8, x9 BOOL;

SELECT strain FROM video WHERE vid = p0 INTO x1;
SELECT rnai FROM video WHERE vid = p0 INTO x2;
SELECT heatshock FROM video WHERE vid = p0 INTO x3;
SELECT sensors FROM video WHERE vid = p0 INTO x4;
SELECT ovulation_no FROM video WHERE vid = p0 INTO x5;
SELECT growth_temp FROM video WHERE vid = p0 INTO x6;
SELECT immob_method FROM video WHERE vid = p0 INTO x7;
SELECT full_ovulation FROM video WHERE vid = p0 INTO x8;
SELECT is_trap FROM video WHERE vid = p0 INTO x9;

SET @p1 := IF(p1 IS NULL, x1, p1);
SET @p2 := IF(p2 IS NULL, x2, p2);
SET @p3 := IF(p3 IS NULL, x3, p3);
SET @p4 := IF(p4 IS NULL, x4, p4);
SET @p5 := IF(p5 IS NULL, x5, p5);
SET @p6 := IF(p6 IS NULL, x6, p6);
SET @p7 := IF(p7 IS NULL, x7, p7);
SET @p8 := IF(p8 IS NULL, x8, p8);
SET @p9 := IF(p9 IS NULL, x9, p9);

UPDATE video
SET 
strain = @p1,
rnai = @p2,
heatshock = @p3,
sensors = @p4,
ovulation_no = @p5,
growth_temp = @p6,
immob_method = @p7,
full_ovulation = @p8,
is_trap = @p9
WHERE vid = p0;


-- diagnostic info for API
IF ROW_COUNT() > 0 THEN SET @exit_code := 0; END IF;
SELECT @exit_code, CONCAT("Rows affected: ", ROW_COUNT()) AS infoMessage;

END $$
DELIMITER ;
-- END FUNCTION
/*
-- EXAMPLES
call changeMetadata(1, null, null, null, null, null, null, null, null, null);
call changeMetadata(1, "strain", r, hs, s, ovn, gt, imm, fo, it);




-- TEST
START TRANSACTION;
--
UPDATE video
SET 
owner = "jab",
heatshock = null
WHERE vid = 7;
SELECT ROW_COUNT();
ROLLBACK;
--
SELECT * FROM video;

###### 1
INSERT INTO `video` 
(`owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) 
VALUES 
('DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);
###### 2
INSERT INTO `video` 
(`vid`, `owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) 
VALUES 
(null,'DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);
## BOTH WORK

SELECT LAST_INSERT_ID(); 


*/