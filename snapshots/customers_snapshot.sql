{% snapshot customers_snapshot %}

{{
    config(
      target_database='analytics',
      target_schema='snapshots',
      unique_key='c_custkey',

      strategy='check',
      check_cols = 'all',
    )
}}

select * from {{ source('tpch', 'customer') }}

{% endsnapshot %}