def product_profit(x,y):
    return x-y
 
def model(dbt,session):
 
    dbt.config(materizalized = 'table', schema = 'transforming')
 
    products_df = dbt.ref('stg_products')
 
    products_df = products_df.withColumn("Profits",product_profit(products_df.UnitPrice,products_df.UnitCost))
 
    return products_df