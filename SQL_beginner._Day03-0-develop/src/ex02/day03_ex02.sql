select pizza_name, price, p.name as pizzeria_name from menu
left join person_order po on menu.id = po.menu_id
left join pizzeria as p on menu.pizzeria_id = p.id
where po.person_id is null
order by 1, 2;
