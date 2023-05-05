create view v_price_with_discount as
select name, m.pizza_name, m.price, round(m.price - m.price * 0.1) as discount_price
from person
join person_order on person.id = person_order.person_id
join menu m on m.id = person_order.menu_id
order by 1, 2;