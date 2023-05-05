create view v_generated_dates as
select date(generated_date) as generated_date
from generate_series('2022-01-01'::date, '2022-01-31', '1 day') as generated_date
order by 1;