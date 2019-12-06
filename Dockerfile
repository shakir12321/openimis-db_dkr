FROM  mcr.microsoft.com/mssql/server:2017-latest
ARG ACCEPT_EULA
ENV ACCEPT_EULA=$ACCEPT_EULA
ARG SA_PASSWORD
ENV SA_PASSWORD=$SA_PASSWORD
ARG SQL_SCRIPT_URL=https://github.com/openimis/database_ms_sqlserver/raw/master/Empty%20databases/openIMIS_ONLINE.sql
RUN wget $SQL_SCRIPT_URL -O /openIMIS_ONLINE.sql
COPY script/* /
