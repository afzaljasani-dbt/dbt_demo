-- example to show querying a metric directly in dbt cloud

select * 
from {{ metrics.calculate(
    metric('revenue'),
    grain='week',
    dimensions=['order_priority']
) }}