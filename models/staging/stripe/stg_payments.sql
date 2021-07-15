select 
    id,
    orderid,
    paymentmethod,
    status,
    created,
    _batche_at
from {{ source('stripe', 'payment') }}