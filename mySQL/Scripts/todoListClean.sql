# Clean-version: Get list of all timepoints YOU, the @user, can do
# ... BESIDES the ones you've already done. (so you can get your own vids if you haven't done TP's yet.
USE cram;

DROP PROCEDURE IF EXISTS todoListClean;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoListClean()
BEGIN
# TODO: build-in finding-of-paths from the vid list

SELECT vid, owner, strain, rnai, date_recorded, archive_filepath, old_file_name#, full_ovulation, is_trap
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3 AND scientist != @user);

END $$
DELIMITER ;

# call todoList();
/*
select vid, owner
FROM video
WHERE vid IN (SELECT vid FROM video_metrics WHERE "count(scientist" < 3)
AND video.owner = "dpa";*/
#SELECT @user;

