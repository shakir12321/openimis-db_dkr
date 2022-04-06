
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "CREATE LOGIN %DB_USER% WITH PASSWORD = '%SA_PASSWORD%', CHECK_POLICY = OFF"
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "CREATE USER %DB_USER% FOR LOGIN %DB_USER% "
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "DROP DATABASE IF EXISTS %DB_NAME%"
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -Q "CREATE DATABASE %DB_NAME%"
sqlcmd -S localhost -U SA -P %SA_PASSWORD% -d %DB_NAME% -Q "EXEC sp_changedbowner %DB_USER%"
