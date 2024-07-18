with top_taxis as (
  select
    taxi_id
  from {{ ref('april_tips') }}
),
monthly_tips as (
  select
    mt.*
  from {{ ref('monthly_tips') }} mt
  join top_taxis tt on mt.taxi_id = tt.taxi_id
),
tips_with_change as (
  select
    taxi_id,
    year_month,
    tips_sum,
    lag(tips_sum) over (partition by taxi_id order by year_month) as prev_tips_sum,
    100.0 * (tips_sum - lag(tips_sum) over (partition by taxi_id order by year_month)) / nullif(lag(tips_sum) over (partition by taxi_id order by year_month), 0) as tips_change
  from monthly_tips
)

select
  taxi_id,
  year_month,
  tips_sum,
  tips_change
from tips_with_change
