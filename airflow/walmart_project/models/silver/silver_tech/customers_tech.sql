{{ config(
    materialized="incremental",
    unique_key="customer_id"
) }}

{% set columns = [
    "customer_id",
    "first_name",
    "last_name",
    "email",
    "phone",
    "city",
    "province",
    "country",
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
    delta.`/Volumes/walmart/bronze/bronze_volume/customers/data/`
{% if is_incremental() %}
    WHERE updated_timestamp > (SELECT COALESCE(MAX(updated_timestamp), '1990-01-01') FROM {{ this }})
{% endif %}