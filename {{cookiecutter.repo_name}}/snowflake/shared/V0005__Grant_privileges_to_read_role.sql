USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS ${environment}_ROLE_${environment}_${db_name}_READ;
GRANT SELECT ON ALL VIEWS IN SCHEMA ${environment}_${db_name}.PUBLISH TO ROLE ${environment}_ROLE_${environment}_${db_name}_READ;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA ${environment}_${db_name}.PUBLISH TO ROLE ${environment}_ROLE_${environment}_${db_name}_READ;
