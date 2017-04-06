## INSERTION

DELIMITER $$
CREATE PROCEDURE myProc()
BEGIN   /* declare local variables */   
DECLARE a INT DEFAULT 10;   
DECLARE b, c INT;    /* using the local variables */   
SET a = a + 100;   
SET b = 2;   
SET c = a + b;    
BEGIN      /* local variable in nested block */      
DECLARE c INT;             
SET c = 5;       
/* local variable c takes precedence over the one of the          
same name declared in the enclosing block. */       
SELECT a, b, c;   
END;    
SELECT a, b, c;
END$$