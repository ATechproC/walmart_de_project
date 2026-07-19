{{ config(
    materialized="incremental",
    unique_key="store_id"
) }}

{% set columns = [
    "store_id",
    "store_name",
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
    delta.`/Volumes/walmart/bronze/bronze_volume/stores/data/`
{% if is_incremental() %}
    WHERE updated_timestamp > (SELECT COALESCE(MAX(updated_timestamp), '1990-01-01') FROM {{ this }})
{% endif %}