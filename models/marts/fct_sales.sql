select
    c.customer_name,
    c.city,
    sum(o.amount) as total_sales,
    count(o.order_id) as total_orders
from {{ ref('stg_orders') }} o
join {{ ref('stg_customers') }} c
    on o.customer_id = c.customer_id
group by c.customer_name, c.city
