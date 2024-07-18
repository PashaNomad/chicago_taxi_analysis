

  create or replace view `valued-lambda-429806-a1`.`dbt_paliferchuk`.`stg_taxi_trips`
  OPTIONS()
  as with base as (
  select
    unique_key,
    taxi_id,
    trip_start_timestamp,
    extract(year from trip_start_timestamp) as year,
    extract(month from trip_start_timestamp) as month,
    tips
  from `bigquery-public-data`.`chicago_taxi_trips`.`taxi_trips`
)

select * from base
where year = 2018;

