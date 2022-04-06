#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE LOGIN $DB_USER WITH PASSWORD = '$SA_PASSWORD', CHECK_POLICY = OFF"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE USER $DB_USER FOR LOGIN $DB_USER "
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "DROP DATABASE IF EXISTS $DB_NAME"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE DATABASE $DB_NAME"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d $DB_NAME -i /fullDemoDatabase.sql
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d $DB_NAME -Q "EXEC sp_changedbowner $DB_USER"

# fix for missing user
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d $DB_NAME -Q "INSERT into core_User(id, i_user_id, username) SELECT replace(CAST(NEWID() as char(40)), '-', ''), u.UserID , LoginName FROM  tblUsers u   LEFT JOIN core_User cu on username = LoginName  WHERE u.LegacyID is null and cu.username is null"