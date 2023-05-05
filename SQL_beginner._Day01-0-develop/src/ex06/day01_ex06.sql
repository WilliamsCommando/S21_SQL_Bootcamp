select order_date as action_date,
    (select name from person where person_id = person.id) as person_name from person_order
intersect
select visit_date as action_date,
    (select name from person where person_id = person.id) as person_name from person_visits
order by action_date asc, person_name desc;
