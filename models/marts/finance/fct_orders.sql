with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

 payments as (

    select * from {{ref('stg_stripe__payments')}}

)


Select o.order_id,
    o.customer_id,
p.amount from orders as o join payments as p 
on o.order_id = p.orderid
