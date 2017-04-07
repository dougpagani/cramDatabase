# A prepared statement

use scratch;
SET @a := "code";
SET @b := "country";
SET @s := CONCAT ("select", @a, " FROM ", @b); -- example dynamic SQL
PREPARE stmt FROM @s

