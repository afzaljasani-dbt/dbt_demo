with test as (

    select *
    from {{ ref('stg_customers') }}
)