{%- set market_segment_var = ['BUILDING', 'AUTOMOBILE', 'MACHINERY'] -%}
 
 with customers as (

     select * from {{ ref('stg_customers') }}
 ),

 pivoted as (

     select 
        customer_key,

        -- create list of market segments


        {% for market_segment in market_segment_var %}

        sum(CASE WHEN  market_segment = '{{ market_segment }}' then 1 ELSE 0 END) as {{ market_segment }}_count
        {% if not loop.last %}
            ,
        {% endif %}
        
        {% endfor %}
     
     from customers 
     group by 1
 )

 select * from pivoted


--  select
--         customer_key,
--         sum(CASE WHEN  market_segment = 'AUTOMOBILE' then 1 ELSE 0 END) as automobile_count,
--         sum(CASE WHEN  market_segment = 'MACHINERY' then 1 ELSE 0 END) as machinery_count,
--         sum(CASE WHEN  market_segment = 'BUILDING' then 1 ELSE 0 END) as automobile_count
--     from customers


