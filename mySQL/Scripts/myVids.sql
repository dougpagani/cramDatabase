# MY vids

USE cram;

DROP PROCEDURE IF EXISTS myVids;
DELIMITER $$

# OUT: video_path_list
CREATE PROCEDURE myVids()
BEGIN
# TODO: build-in finding-of-paths from the vid list

SELECT strain, rnai, date_recorded, vid, old_file_name, full_ovulation, is_trap, owner
FROM video
WHERE video.owner = @user;

END $$
DELIMITER ;

#SELECT @user;
#call todoList4();
call myVids();

