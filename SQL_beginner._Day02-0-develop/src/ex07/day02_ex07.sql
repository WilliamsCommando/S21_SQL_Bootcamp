select pz.name as pizzeria_name from person
join person_visits pv on person.id = pv.person_id
join pizzeria pz on pz.id = pv.pizzeria_id
join menu m on m.pizzeria_id = pv.pizzeria_id
where person.name = 'Dmitriy' and pv.visit_date = '2022-01-08' and m.price < 800;