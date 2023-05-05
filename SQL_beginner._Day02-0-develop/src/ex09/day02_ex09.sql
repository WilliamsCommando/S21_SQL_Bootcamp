select person.name from person
join person_order po on person.id = po.person_id
join menu on menu.id = po.menu_id
where gender = 'female' and menu.pizza_name in ('pepperoni pizza', 'cheese pizza')
group by person.name
having count(menu.pizza_name) > 1;