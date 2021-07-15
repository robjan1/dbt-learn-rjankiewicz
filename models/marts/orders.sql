with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}

),

final as (
select 
orders.order_id,
orders.order_date,
orders.customer_id,
SUM(payments.payment_amount) as amount
from orders
join payments on orders.order_id = payments.order_id
where payments.payment_status = 'success'
group by 
orders.order_id,
orders.customer_id,orders.order_date
)
select * from final

