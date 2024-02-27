{{config(materialized= 'view', schema= env_var('DBT_SALESMART','SALESMART'))}}


select
ss.orderid,
ss.lineno,
ss.shipmentdate,
ss.valid_from,
ss.valid_to,
s.companyname
from

{{ ref("trf_shipments_snapshot")}} as ss
inner join 
{{ ref("shippers")}} as s
on ss.shipperid=s.shipperid