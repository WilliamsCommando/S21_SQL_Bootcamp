with days as
    (select generate_series('2022-01-01', '2022-01-10', '1 day'::interval) as missing_date)
select days.missing_date::date from days
left join (select * from person_visits where person_id < 3) as pv on days.missing_date = pv.visit_date
where pv.visit_date is null;