
{% set columns = [
    "order_id",
    "order_item_id",
    "store_id",
    "customer_id",
    "employee_id",
    "product_id",
    "total_amount",
    "quantity",
    "unit_price",
    "line_amount"
] %}

SELECT
    {% for col in columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM
    {{ ref("obt_b") }}