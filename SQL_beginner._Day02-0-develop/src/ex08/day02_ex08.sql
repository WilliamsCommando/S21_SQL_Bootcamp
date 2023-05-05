select person.name from person
join person_order po on person.id = po.person_id
join menu on menu.id = po.menu_id
where person.address like any (array['Moscow', 'Samara']) and
      menu.pizza_name like any (array['pepperoni pizza', 'mushroom pizza']) and
      person.gender = 'male'
order by person.name desc;