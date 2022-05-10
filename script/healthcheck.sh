#!/usr/bin/env bash
data=$(/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "SELECT COUNT(*)  FROM master.dbo.sysdatabases WHERE name = N'$DB_NAME'" | tr -dc '0-9'| cut -c1 )
if [ ${data} -eq "0" ]; then
    exit 1
else
    exit 0
fi