# get timepoints todos
# 3-version: Get list of all todo's 
# ... besides the videos you own
# ... and the ones you've already done.
USE cram;

DROP PROCEDURE IF EXISTS todoList3;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoList3()
BEGIN
# TODO: build-in finding-of-paths from the vid list

SELECT vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name#, full_ovulation, is_trap
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3 AND scientist != @user)
AND video.owner != @user;

END $$
DELIMITER ;

# call todoList();
/*
select vid, owner
FROM video
WHERE vid IN (SELECT vid FROM video_metrics WHERE "count(scientist" < 3)
AND video.owner = "dpa";*/
#SELECT @user;

