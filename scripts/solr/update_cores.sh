#!/bin/bash

echo "update Solr-web configs";
cp /scripts/solrconfig.xml /opt/solr/server/solr/web/conf/;
cp /configs/solr-web/conf/schema.xml /opt/solr/server/solr/web/conf/managed-schema;
cp /configs/solr-web/conf/db-data-config.xml /opt/solr/server/solr/web/conf/;
sed -e 's~sqlserver://[^;]*;~sqlserver://sqlserver;~' -e 's~user=".*"~user="sa"~' -e 's~password=".*"~password="Secret123!"~' -i /opt/solr/server/solr/web/conf/db-data-config.xml;
echo "reload core";
curl "http://localhost:8983/solr/admin/cores?core=web&action=RELOAD";
