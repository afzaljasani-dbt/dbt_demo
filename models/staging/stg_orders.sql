with cleaned_orders as (

    select 
        o_orderkey as order_id,
        o_custkey as customer_id,
        o_orderdate as order_date,
        o_orderstatus as status_code,

        case when o_orderstatus = 'O'
            then 'Open'
        when o_orderstatus = 'F'
            then 'Fulfilled'
        when o_orderstatus = 'P'
            then 'Pending'
        else NULL
        end as order_status,
        
        o_orderpriority as order_priority,
        
        -- using macro here
        {{ cents_to_dollars('o_totalprice') }} as amount
            

    from  {{ source('tpch', 'orders') }}
)

select * from cleaned_orders