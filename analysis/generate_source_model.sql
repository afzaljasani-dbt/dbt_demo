-- args passed in: schema, database
{{ codegen.generate_source('TPCH_SF001', 'RAW') }}

-- alternative is dbt CLI option
-- dbt run-operation generate_source --args '{"schema_name": "TPCH_SF001", "database_name": "RAW"}'