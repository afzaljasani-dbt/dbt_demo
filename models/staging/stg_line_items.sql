with line_items as (

    select * 
    
    from {{ source('demo_data', 'lineitem') }}
)

select * from line_items

{{ limit_data_in_dev('l_shipdate') }}