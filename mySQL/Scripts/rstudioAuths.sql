DROP USER 'rstudio'@'localhost';
-- GRANT USAGE ON *.* TO rstudio;
CREATE USER 'rstudio'@'localhost' IDENTIFIED BY 'rstudio';
GRANT EXECUTE ON `cram`.* TO 'rstudio'@'localhost';



