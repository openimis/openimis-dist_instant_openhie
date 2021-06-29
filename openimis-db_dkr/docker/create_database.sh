#!/usr/bin/env bash
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "DROP DATABASE IF EXISTS imis"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE DATABASE imis"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d imis -i /openIMIS_ONLINE.sql

#CREATE USER DB
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE LOGIN $DB_USER WITH PASSWORD = '$SA_PASSWORD', CHECK_POLICY = OFF"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE USER $DB_USER FOR LOGIN $DB_USER "
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d $DB_NAME -Q "EXEC sp_changedbowner $DB_USER"
