# get timepoints todos
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE todoList()
BEGIN

# TODO: build-in finding-of-paths from the vid list

SELECT *
FROM video
WHERE vid IN 
	(SELECT vid FROM time_metrics WHERE trial_count < 3);


END $$
DELIMITER ;

# call todoList();