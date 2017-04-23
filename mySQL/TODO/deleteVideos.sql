# deleteVideos()

# This is a stored-procedure which has the capacity to wreck
# ... havoc by the user, wittingly or unwittingly. As a result,
# ... it will have to be heavily checked.

# Questions of usability-design:
# 1. does the user delete by vid? maybe the app can query, then collect them 
# ... dynamically, and amass a list.
# 2. search by user, attributes, timepoint threshold
# search by GO-term

# Design-usability:
# - verification first? Or can that just be managed app-side?

/* Checks:
1. is this the user that is logged-in? 
2. does the video have some special lock on it?
*/
DELIMITER $$ 

CREATE PROCEDURE deleteVideos()
BEGIN 
		# fetch vids

		# delete them


		DELETE <Lo vid>;

END $$
DELIMITER ;