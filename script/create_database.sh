#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "DROP DATABASE IF EXISTS imis"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE DATABASE imis"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d imis -i /openIMIS_ONLINE.sql
