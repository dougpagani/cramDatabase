# Change a VIDEO RECORD
# INPUT: vid, (...) -- list of parameters to possibly change

# EXAMPLE RECORD:: INSERT INTO `video` (`vid`, `owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) VALUES (1, 'DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);

DECLARE nowner
DECLARE oowner
DECLARE nstrain
DECLARE ostrain



UPDATE video
SET owner = null
WHERE vid = 7;

SELECT * FROM video;

###### 1
INSERT INTO `video` 
(`owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) 
VALUES 
('DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);
###### 2
INSERT INTO `video` 
(`vid`, `owner`, `strain`, `rnai`, `heatshock`, `sensors`, `ovulation_no`, `growth_temp`, `immob_method`, `date_recorded`, `old_file_name`, `date_archived`, `archive_filepath`, `full_ovulation`, `is_trap`, `searchCount`) 
VALUES 
(null,'DPA', 'UN1417', 'cku-80', '30m', 'GCaMP3', 3, 25, '10% agarose, beads', '2017-03-24', 'myGreatVideo.tif', '2017-03-25 15:23:21', '/UN1417/cku-80/30m', true, false, 99999);
## BOTH WORK

SELECT LAST_INSERT_ID(); 


