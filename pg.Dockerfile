FROM postgres:14.5
COPY init.sql /docker-entrypoint-initdb.d/
