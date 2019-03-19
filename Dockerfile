FROM  mcr.microsoft.com/mssql/server:2017-latest
ARG ACCEPT_EULA
ENV ACCEPT_EULA=$ACCEPT_EULA
ARG SA_PASSWORD
ENV SA_PASSWORD=$SA_PASSWORD
ARG BACKUP_URL=https://raw.githubusercontent.com/openimis/database_ms_sqlserver/master/Empty%20databases/SQLServer2017/openIMIS_ONLINE_v1.2.0.bak
ARG BACKUP_ORIGIN_DATA=CH_CENTRAL
ENV BACKUP_ORIGIN_DATA=$BACKUP_ORIGIN_DATA
ARG BACKUP_ORIGIN_LOG=CH_CENTRAL_log
ENV BACKUP_ORIGIN_LOG=$BACKUP_ORIGIN_LOG
RUN mkdir /bck
RUN wget $BACKUP_URL -O /bck/imis.bak
COPY script/restore.sh /restore.sh