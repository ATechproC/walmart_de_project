{{ config(
    materialized="incremental",
    unique_key="order_id"
) }}

{% set columns = [
    "order_id",
    "customer_id",
    "store_id",
    "order_timestamp",
    "payment_method",
    "order_status",
    "total_amount",
    "created_timestamp",
    "updated_timestamp",
    "is_active"
] %}

SELECT
    {% for col in columns %}
        {{ col }},
    {% endfor %}
    CURRENT_TIMESTAMP() AS processed_at
FROM
    delta.`/Volumes/walmart/bronze/bronze_volume/orders/data/`
{% if is_incremental() %}
    WHERE updated_timestamp > (SELECT COALESCE(MAX(updated_timestamp), '1990-01-01') FROM {{ this }})
{% endif %}