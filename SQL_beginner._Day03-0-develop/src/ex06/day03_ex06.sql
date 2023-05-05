with pizza as (
select pizza_name, price, p.name as pizzeria_name from menu
join pizzeria p on p.id = menu.pizzeria_id)

select p1.pizza_name as pizza_name,
p1.pizzeria_name as pizzeria_name_1,
p2.pizzeria_name as pizzeria_name_2,
p2.price as price from pizza as p1
inner join pizza as p2 on p1.pizza_name = p2.pizza_name
where p1.pizza_name = p2.pizza_name and
      p1.price = p2.price and
      p1.pizzeria_name != p2.pizzeria_name
order by 1;