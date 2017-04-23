USE cram;

SELECT vid, AVG(entry_start) t1, AVG(entry_stop) t2, AVG(exit_start) t3,
	AVG(exit_stop) t4, count(scientist) tp_trial_count
# dwell = 3-2
# exit = 4-3
# entry = 2-1
# transit = 4-1
FROM timepoints
GROUP BY vid;

SELECT vid, ROUND(AVG(exit_stop) - AVG(exit_start)) as "transit"
	,ROUND(AVG(exit_start) - AVG(entry_stop)) as "dwell"
	,ROUND(AVG(entry_stop) - AVG(entry_start)) as "entry"
	,ROUND(AVG(exit_stop) - AVG(exit_start)) as "exit"
FROM timepoints
GROUP BY vid;

/*      
select ()
from table ()A
inner join()B
ON vid
*/
select *
from (
SELECT vid, AVG(entry_start) t1, AVG(entry_stop) t2, AVG(exit_start) t3,
	AVG(exit_stop) t4, count(scientist) tp_trial_count
FROM timepoints
GROUP BY vid
)A
inner join (
SELECT vid, ROUND(AVG(exit_stop) - AVG(exit_start)) as "transit"
	,ROUND(AVG(exit_start) - AVG(entry_stop)) as "dwell"
	,ROUND(AVG(entry_stop) - AVG(entry_start)) as "entry"
	,ROUND(AVG(exit_stop) - AVG(exit_start)) as "exit"
FROM timepoints
GROUP BY vid
)B
ON A.vid=B.vid;

/*
SELECT @n1 := AVG(entry_start) as "avg Entry_Start", @n2 := AVG(entry_stop) as "avg Entry_End", @n3 := AVG(exit_start) as "avg Exit_Start",
	@n4 := AVG(exit_stop) as "avg Exit_End", count(scientist) as tp_trial_count, AVG(exit_stop) - AVG(entry_start) as "transit",
	(@n3 - @n2) as "dwell", (@n2 - @n1) as "entry", (@n4- @n3) as "exit"
# dwell = 3-2
# exit = 4-3
# entry = 2-1
# transit = 4-1
FROM timepoints
GROUP BY vid;
*/
