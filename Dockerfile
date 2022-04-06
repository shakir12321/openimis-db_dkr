FROM  mcr.microsoft.com/mssql/server:2017-latest
ARG ACCEPT_EULA
ENV ACCEPT_EULA=$ACCEPT_EULA
ARG SA_PASSWORD
ENV SA_PASSWORD=$SA_PASSWORD
ARG SQL_SCRIPT_URL=https://github.com/openimis/database_ms_sqlserver/releases/download/v1.7.0-rc0/sql-files-v1.7.0-rc0.zip
RUN wget $SQL_SCRIPT_URL -O /sql-files.zip
COPY script/* /
RUN apt-get update && apt-get install unzip -y
RUN unzip /sql-files.zip -d /
