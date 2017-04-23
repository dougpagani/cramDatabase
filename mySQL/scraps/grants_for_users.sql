CREATE USER 'rstudio'@'localhost' IDENTIFIED BY 'rstudio';
-- REVOKE; 
GRANT EXECUTE ON cram.* TO 'rstudio'@'localhost';
# Not needed for basic SELECT fxn() functionality.
GRANT SELECT ON cram.* TO 'rsutdio'@'localhost';