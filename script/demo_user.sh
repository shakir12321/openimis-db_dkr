#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "update tblUsersDistricts set userid = 16 where userid = 10"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d imis -Q "update tblUsers set loginname = 'user' where loginname = 'test'"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d imis -Q "update tblUsers set validityto = null, roleid = 7 where userid = 16"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d imis -Q "update tblUserRole set UserID = 16 where UserID = 2"