select productid,
sum(profit) as totalamount
from {{ ref('trf_products')}}
group by productid
having not (totalamount>=0)