{% snapshot trf_shipments_snapshot %}

{{
    config
(
    target_database = 'qbt',
    target_schema ='shipments',
    unique_key = "orderid || '-' || lineno",

    strategy = 'timestamp',
    updated_at = 'shipmentdate'

)

}}
select * from

{{ ref("stg_shipments") }}

{% endsnapshot %}