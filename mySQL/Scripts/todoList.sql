# get timepoints todos
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
	(SELECT vid FROM video_metrics WHERE "count(scientist)" < 3);

COMMIT;
END $$
DELIMITER ;

# call todoList();