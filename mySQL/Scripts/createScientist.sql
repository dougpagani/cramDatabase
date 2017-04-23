# createScientist
# http://stackoverflow.com/questions/16211107/how-to-execute-stored-procedure-in-another-stored-procedure-in-sql-server

# IN(2) :: tuple(initials, 
# describe scientists
USE cram;

DROP PROCEDURE IF EXISTS createScientist;

DELIMITER $$ 

CREATE PROCEDURE createScientist(IN abc CHAR(3), IN fn VARCHAR(20), IN ln VARCHAR(30), IN email VARCHAR(50), IN pw_hash CHAR(64))
BEGIN

# ERROR HANDLING

# COMMIT HANDLING

INSERT INTO person VALUES (abc, fn, ln, email, pw_hash);

END $$
DELIMITER ;

# Example of person:
#INSERT INTO `person` (`initials`, `fn`, `ln`, `email`, `pw_hash`) 
#VALUES ('BBB', 'Bob', 'Borker', 'borker.b@husky.neu.edu', 'da7655b5bf67039c3e76a99d8e6fb6969370bbc0fa440cae699cf1a3e2f1e0a1');
/*
delete from person WHERE initials="BBB";
call createScientist('BBB', 'Bob', 'Borker', 'borker.b@husky.neu.edu', 
'da7655b5bf67039c3e76a99d8e6fb6969370bbc0fa440cae699cf1a3e2f1e0a1');
*/