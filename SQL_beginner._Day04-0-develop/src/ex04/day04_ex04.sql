create view v_symmetric_union as
with R as (select person_id from person_visits where visit_date = '2022-01-02'),
S as (select person_id from person_visits where visit_date = '2022-01-06')
select person_id from (select person_id from R except select person_id from S) as sel_r
union
select person_id from (select person_id from S except select person_id from R) as sel_s
order by 1;