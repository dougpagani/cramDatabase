# get timepoints todos
# Version 1: just get timepoints

USE cram;

DROP PROCEDURE IF EXISTS todoList;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoList()
BEGIN

START TRANSACTION;
# TODO: build-in finding-of-paths from the vid list

SELECT vid
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3)
AND video.owner != @user;

COMMIT;
END $$
DELIMITER ;

# call todoList();