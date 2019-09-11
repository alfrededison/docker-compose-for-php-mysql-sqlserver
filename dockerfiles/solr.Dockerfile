FROM solr:7

RUN wget -P contrib/dataimporthandler-extras/lib/ https://github.com/microsoft/mssql-jdbc/releases/download/v7.2.2/mssql-jdbc-7.2.2.jre8.jar
