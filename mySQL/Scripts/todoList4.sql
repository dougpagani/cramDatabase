# MY timepoints
# 4-version: Get your videos which need timepoints-done.
USE cram;

DROP PROCEDURE IF EXISTS todoList4;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoList4()
BEGIN
# TODO: build-in finding-of-paths from the vid list

SELECT vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name#, full_ovulation, is_trap
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3)
AND video.owner = @user;

END $$
DELIMITER ;

#select * from video;
#call todoList4();

/*
select vid, owner
FROM video
WHERE vid IN (SELECT vid FROM video_metrics WHERE "count(scientist" < 3)
AND video.owner = "dpa";
*/
#SELECT @user;



