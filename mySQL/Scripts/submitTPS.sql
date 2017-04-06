# submitTPS
# Once the scientist has gone-through the video, and the data has been validated
# ... at the app-end (i.e. error-handling need-not-be-handled here), submit the set.
# CAVEAT: must check that this row is unique, else the database will throw an error.
# Error Handle problems:
# 1. did the user already submit a tp-set for this? (eventually, build-in this as an
# ... add'l check in todoList.sql.

# IN: a text-s

DELIMITER $$ 

CREATE PROCEDURE submitTPS(IN tps_tuple VARCHAR(45), OUT exit_code BOOL)
BEGIN
	# Check if logged-in.
	
	# Check if duplicate-person.

	# TODO: figure out this converstion//hand-off
	INSERT INTO timepoints VALUE(tps_tuple);

END $$
DELIMITER ;