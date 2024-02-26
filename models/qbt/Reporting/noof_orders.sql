{{ config(materialized='view',schema='reporting') }}

with customers as
(
    select customerid,companyname,contactname,city
    from {{ ref("dim_customers") }}
)
,

orders as
(
    select orderid, customerid,orderdate,linesalesamount
    from {{ ref("fact_orders") }}
)
,
customer_orders as
(
    select customers.companyname as companyname,
            customers.contactname as contactname,
            customers.city as city,
            min(orders.orderdate) as firstorderdate,
            max(orders.orderdate) as recentorderdate,
            count(orders.orderid) as totalorders,
            sum(orders.linesalesamount) as totalsales
        from customers inner join orders 
        ---on customers.customerid=orders.customerid
        group by companyname,contactname,city
)
,
final as 
(
    select * from customer_orders
)
select * from final