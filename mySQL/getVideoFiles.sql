# I want to select all the videos whhose vid's match the vid's associated with a tp_count of < 3

USE cram;
DESCRIBE video_metrics;

SELECT vid FROM video_metrics;


SELECT *
FROM video
WHERE vid IN 
	(SELECT vid FROM video_metrics)



USE cram;
DESCRIBE metrics_view;