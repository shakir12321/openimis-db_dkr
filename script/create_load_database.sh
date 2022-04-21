#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE LOGIN $DB_USER WITH PASSWORD = '$SA_PASSWORD', CHECK_POLICY = OFF"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "DROP DATABASE IF EXISTS $DB_NAME"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE DATABASE $DB_NAME"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -i /fullDemoDatabase.sql -d $DB_NAME | grep . | uniq -c
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE USER $DB_USER FOR LOGIN $DB_USER " -d $DB_NAME
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "EXEC sp_changedbowner $DB_USER" -d $DB_NAME

# fix for missing user