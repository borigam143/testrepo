{{ config(materialized='table')}}

select OrderID,LineNo,ShipperID,CustomerID,ProductID,EmployeeID,
split_part(ShipmentDate,' ',0)::date as shipmentdate
--left(shipmentdate,'10') as shipmentdate
from
{{ env_var('DBT_SOURCEDB','QBT')}}.{{env_var('DBT_SOURCESCHEMA','RAW')}}.shipments