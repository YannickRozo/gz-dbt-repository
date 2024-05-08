select *
from {{ ref("stg_raw__adworks") }}
union all
select *
from {{ ref("stg_raw__bing") }}
union all
select *
from {{ ref("stg_raw__criteo") }}
union all
select *
from {{ ref("stg_raw__facebook") }}
