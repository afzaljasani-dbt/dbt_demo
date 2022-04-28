

select 
    {{ dbt_utils.surrogate_key(['customer_id', 'order_date']) }} as pk_id,
    customer_id,
    order_date,
    order_status,
    count(*) as total_orders

from {{ ref('stg_orders') }}


group by 1,2,3,4

