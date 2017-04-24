/*
BASH command:
\ls |xargs greadlink -f | tr '\t' '\n' | awk '{print "\\\." $0 ";";}' | cat > output.txt

\. /full/path/to/sql/file1.sql
\. /full/path/to/sql/file2.sql
\. /full/path/to/sql/file3.sql
...
\. /full/path/to/sql/file(n).sql
*/
USE cram;
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/isLogged.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/isAuthenticated.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/login.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/loginf.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/submitTPS.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/todoList.sql
\. /Users/Doug/Projects/cram_db/mySQL/Scripts/csv_import.sql
