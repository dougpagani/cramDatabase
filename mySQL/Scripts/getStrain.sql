USE cram;

DROP PROCEDURE IF EXISTS getStrain;
DELIMITER $$


CREATE PROCEDURE getStrain()
BEGIN


select * from strain_enum;

END $$
DELIMITER ;