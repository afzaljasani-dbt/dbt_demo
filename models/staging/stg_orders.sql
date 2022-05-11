with cleaned_orders as (

    select 
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderdate as order_date,

        case when o_orderstatus = 'O'
            then 'Open'
        when o_orderstatus = 'F'
            then 'Fulfilled'
        when o_orderstatus = 'P'
            then 'Processed'
        else NULL
        end as order_status,
        
        o_orderpriority as order_priority,
        
        -- using macro here
        {{ cents_to_dollars('o_totalprice') }} as amount
            

    from {{ source('demo_data', 'orders') }}
)

select * from cleaned_orders