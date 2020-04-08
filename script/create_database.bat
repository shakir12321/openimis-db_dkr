
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "DROP DATABASE IF EXISTS %DB_NAME%"
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "CREATE DATABASE %DB_NAME%"
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -d %DB_NAME% -i "C:\openIMIS_ONLINE.sql"
