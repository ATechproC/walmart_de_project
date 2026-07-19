{% set columns = [
    "employee_id",
    "employee_first_name",
    "employee_last_name",
    "employee_email",
    "employee_job_title",
    "employee_salary",
    "employee_created_timestamp",
    "employee_updated_timestamp",
    "employee_is_active"
] %}

SELECT 
    {% for col in columns %}
        {{ col }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM 
    {{ ref('obt_b') }}