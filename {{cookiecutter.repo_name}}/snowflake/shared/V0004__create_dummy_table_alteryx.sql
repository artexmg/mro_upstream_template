USE ROLE SYSADMIN;

/* this is dummy-table to ensure ALTERYX(upstream tool) can connect successfully with the views in Publish schema */
create table if not exists ${environment}_${db_name}.publish.dummy (
dummy_column int
);

grant ownership on table ${environment}_${db_name}.publish.dummy to role ${environment}_ROLE_${db_name}_SVC_EMR_WRITE copy current grants;
