select person.name as person_name, pizza_name, pizzeria.name as pizzeria_name from person_order
join person on person.id = person_order.person_id
join menu on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
order by 1, 2, 3;