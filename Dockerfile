FROM  mcr.microsoft.com/mssql/server:2017-latest
ARG ACCEPT_EULA
ENV ACCEPT_EULA=$ACCEPT_EULA
ARG SA_PASSWORD
ENV SA_PASSWORD=$SA_PASSWORD
ENV DB_USER_PASSWORD=$SA_PASSWORD
ENV DB_NAME=IMIS
ENV DB_USER=IMISUser
RUN mkdir -p /app
COPY script/* /app
WORKDIR /app

ARG SQL_SCRIPT_URL="https://github.com/openimis/database_ms_sqlserver/releases/latest/download/sql-files.zip"
RUN wget $SQL_SCRIPT_URL -O /sql-files.zip
RUN apt-get update && apt-get install unzip -y && rm -rf /var/lib/apt/lists/* && unzip /sql-files.zip -d /app
CMD /bin/bash ./entrypoint.sh