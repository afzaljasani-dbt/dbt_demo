def model(dbt, session):

    # DataFrame representing an upstream model
    upstream_model = dbt.ref("my_first_dbt_model")

    # DataFrame representing an upstream source
    upstream_source = dbt.source("demo_data", "customer")

    final_df = upstream_source
    
    return final_df

    