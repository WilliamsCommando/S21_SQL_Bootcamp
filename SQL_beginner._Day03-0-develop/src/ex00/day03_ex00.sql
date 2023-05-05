select menu.pizza_name, menu.price,
    pizzeria.name as pizzeria_name, person_visits.visit_date from
    (select * from person where name = 'Kate') as person
join person_visits on person_visits.person_id = person.id
join pizzeria on pizzeria.id = person_visits.pizzeria_id
join menu on pizzeria.id = menu.pizzeria_id
where price >= 800 and price <= 1000
order by 1, 2, 3;