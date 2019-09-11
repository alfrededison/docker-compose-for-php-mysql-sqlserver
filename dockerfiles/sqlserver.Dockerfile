FROM mcr.microsoft.com/mssql/server:2017-latest-ubuntu

#install Full text search
RUN apt-get update \
    && apt-get install -y curl \
    && curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list | tee /etc/apt/sources.list.d/mssql-server.list \
    && apt-get update \
    && apt-get install -y mssql-server-fts
