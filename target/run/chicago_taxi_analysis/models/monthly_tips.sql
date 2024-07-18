

  create or replace view `valued-lambda-429806-a1`.`dbt_paliferchuk`.`monthly_tips`
  OPTIONS()
  as with monthly_tips as (
  select
    taxi_id,
    date_trunc(trip_start_timestamp, month) as year_month,
    sum(tips) as tips_sum
  from `valued-lambda-429806-a1`.`dbt_paliferchuk`.`stg_taxi_trips`
  group by taxi_id, year_month
)

select * from monthly_tips;

