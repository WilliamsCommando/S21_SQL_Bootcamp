select pizzeria.name, count(menu_id), round(avg(price)), max(price), min(price) from pizzeria
join menu m on pizzeria.id = m.pizzeria_id
join person_order po on m.id = po.menu_id
group by pizzeria.name
order by pizzeria.name;