select pizza_name, pizzeria.name as pizzeria_name from menu
join person_order on menu.id = person_order.menu_id
join pizzeria on pizzeria.id = menu.pizzeria_id
where person_order.person_id = 1 or person_order.person_id = 4
order by 1, 2;