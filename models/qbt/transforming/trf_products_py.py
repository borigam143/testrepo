
def product_profit(x,y):
    return x-y

def model(dbt,session):

    dbt.config(materialized = "table", schema = "env_var('DBT_TRANSFORMDB','TRANSFORMING')")

    products_df = dbt.ref("stg_products")

    products_df = products_df.withColumn("profits",product_profit (products_df.UnitPrice,products_df.UnitCost) )

    return products_df