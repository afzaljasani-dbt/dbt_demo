with cleaned_orders as (

    select 
        o_orderkey as order_id,
        o_custkey as customer_id,

        case when o_orderstatus = 'O'
            then 'Open'
        when o_orderstatus = 'F'
            then 'Fulfilled'
        when o_orderstatus = 'P'
            then 'Pending'
        else NULL
        end as order_status,
        
        o_orderpriority as order_priority
            

    from {{ source('demo_data', 'orders') }}
)

select * from cleaned_orders