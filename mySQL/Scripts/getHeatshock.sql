USE cram;

DROP PROCEDURE IF EXISTS getHeatshock;
DELIMITER $$


CREATE PROCEDURE getHeatshock()
BEGIN


select * from heatshock_enum;

END $$
DELIMITER ;