with customers as (

     select * from {{ ref('stg_jaffle_shop__customers') }}

),

orders as ( 

    select * from {{ ref('stg_jaffle_shop__orders') }}

),

 payment as (

    select * from {{ref('stg_stripe__payments')}}

)


Select o.order_id,
    o.customer_id,
p.amount from order as o join payment as p 
on o.order_id = p.orderid
group by o.order_id