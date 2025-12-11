with 

source as (

    select * from {{ source('raw', 'ship') }}

),

renamed as (

    select
        orders_id,
        shipping_fee,
        shipping_fee_1,
        logcost,
        CAST(ship_cost AS NUMERIC) AS ship_cost

    from source
    WHERE shipping_fee <> shipping_fee_1
       OR (shipping_fee IS NULL AND shipping_fee_1 IS NOT NULL)
       OR (shipping_fee IS NOT NULL AND shipping_fee_1 IS NULL)

)

select * from renamed