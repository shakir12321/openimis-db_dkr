#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U $DB_USER -P $SA_PASSWORD -Q "Select 1"