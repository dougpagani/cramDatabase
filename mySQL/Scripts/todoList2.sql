# get timepoints todos
# 2-version: Get full list
USE cram;

DROP PROCEDURE IF EXISTS todoList2;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoList2()
BEGIN

START TRANSACTION;
# TODO: build-in finding-of-paths from the vid list

SELECT vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name#, full_ovulation, is_trap
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3)
AND video.owner != @user;
COMMIT;
END $$
DELIMITER ;

#call todoList2();