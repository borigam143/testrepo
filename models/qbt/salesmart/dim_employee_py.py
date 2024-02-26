def model(dbt,session):
    my_employee_df = dbt.ref("trf_employee")
    dbt.config(materialize="table" , schema="salesmart", alias="dim_employee_py")
    return my_employee_df