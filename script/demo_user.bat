sqlcmd -S localhost -U %DB_USER% -P %SA_PASSWORD% -Q "update tblUsersDistricts set userid = 16 where userid = 10"
sqlcmd -S localhost -U %DB_USER% -P %SA_PASSWORD% -d %DB_NAME% -Q "update tblUsers set loginname = 'user' where loginname = 'test'"
sqlcmd -S localhost -U %DB_USER% -P %SA_PASSWORD% -d %DB_NAME% -Q "update tblUsers set validityto = null, roleid = 7 where userid = 16"
sqlcmd -S localhost -U %DB_USER% -P %SA_PASSWORD% -d %DB_NAME% -Q "update tblUserRole set UserID = 16 where UserID = 2"