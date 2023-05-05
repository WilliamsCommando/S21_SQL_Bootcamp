select p.name, m.pizza_name, m.price,
       (m.price - m.price * person_discounts.discount / 100) as discount_price,
       pz.name
from person_discounts
join person as p on person_discounts.person_id = p.id
join menu as m on m.pizzeria_id = person_discounts.pizzeria_id
join pizzeria as pz on m.pizzeria_id = pz.id
order by p.name, m.pizza_name;