{{ config(
    materialized="incremental",
    unique_key="order_item_id"
) }}

{% set columns = [
    "order_item_id",
    "order_id",
    "product_id",
    "quantity",
    "unit_price",
    "line_amount",
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
    delta.`/Volumes/walmart/bronze/bronze_volume/order_items/data/`
{% if is_incremental() %}
    WHERE updated_timestamp > (SELECT COALESCE(MAX(updated_timestamp), '1990-01-01') FROM {{ this }})
{% endif %}