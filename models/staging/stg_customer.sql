with customers as (

    select 
        c_custkey as customer_key,
        c_name as customer_name,
        c_address as address,
        c_nationkey as nationkey,
        c_phone as phone_number,
        c_mktsegment as market_segment

    from RAW.TPCH_SF001.CUSTOMER
)

select *
from customers