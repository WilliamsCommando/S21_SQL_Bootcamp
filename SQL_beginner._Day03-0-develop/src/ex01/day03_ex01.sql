select id from menu
except
select person_order.menu_id from person_order
order by id;