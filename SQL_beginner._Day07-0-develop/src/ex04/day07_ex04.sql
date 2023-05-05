with count_visits as (select name, count(pizzeria_id) as pi from person
    join person_visits pv on person.id = pv.person_id
    group by name
    )
select count_visits.name, count_visits.pi from person
join count_visits on person.name = count_visits.name
and count_visits.pi > 3;