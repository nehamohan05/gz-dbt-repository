
with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        logcost As log_cost,
        CAST(ship_cost AS NUMERIC) AS ship_cost

    from source
  
      

)

select * from renamed