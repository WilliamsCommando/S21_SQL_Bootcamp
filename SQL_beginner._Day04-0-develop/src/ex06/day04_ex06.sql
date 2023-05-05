create materialized view mv_dmitriy_visits_and_eats as
select pizzeria.name as pizzeria_name from person
join person_visits as pv on person.id = pv.person_id
join pizzeria on pizzeria.id = pv.pizzeria_id
join menu on menu.pizzeria_id = pv.pizzeria_id
where person.name = 'Dmitriy' and menu.price < 800 and pv.visit_date = '2022-01-08'
order by 1;