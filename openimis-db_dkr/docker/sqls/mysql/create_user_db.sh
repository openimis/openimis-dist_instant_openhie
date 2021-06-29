/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE LOGIN $DB_USER WITH PASSWORD = '$SA_PASSWORD', CHECK_POLICY = OFF"
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q "CREATE USER $DB_USER FOR LOGIN $DB_USER "
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -d $DB_NAME -Q "EXEC sp_changedbowner $DB_USER"
