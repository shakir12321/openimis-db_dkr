#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "RESTORE DATABASE [imis] FROM DISK = N'/bck/imis.bak' WITH REPLACE, MOVE '"$BACKUP_ORIGIN_DATA"' TO '/var/opt/mssql/data/IMIS.mdf', MOVE '"$BACKUP_ORIGIN_LOG"' TO '/var/opt/mssql/data/IMIS_LOG.ldf'"
