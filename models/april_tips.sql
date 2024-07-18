with april_tips as (
  select
    taxi_id,
    tips_sum
  from {{ ref('monthly_tips') }}
  where year_month = '2018-04-01'
  order by tips_sum desc
  limit 3
)

select * from april_tips
