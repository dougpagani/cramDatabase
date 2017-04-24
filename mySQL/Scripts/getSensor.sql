USE cram;

DROP PROCEDURE IF EXISTS getSensor;
DELIMITER $$


CREATE PROCEDURE getSensor()
BEGIN


select * from sensors_enum;

END $$
DELIMITER ;