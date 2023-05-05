with andrey as (
    select id from person where name = 'Andrey'
)
select visits.pizzeria_name from
(    select p.name as pizzeria_name from person_order
    join menu m on person_order.menu_id = m.id
    join pizzeria p on m.pizzeria_id = p.id
    where person_order.person_id = (select id from andrey)) as orders
right join (
select p.name as pizzeria_name from person_visits
join pizzeria p on person_visits.pizzeria_id = p.id
where person_visits.person_id = (select id from andrey)) as visits
on orders.pizzeria_name = visits.pizzeria_name
where orders.pizzeria_name is null
order by 1;
