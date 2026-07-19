{% set columns = [
    "product_id",
    "product_name",
    "category",
    "brand",
    "price",
    "product_created_timestamp",
    "product_updated_timestamp",
    "product_is_active"
] %}

SELECT 
    {% for col in columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM 
    {{ ref('obt_b') }}