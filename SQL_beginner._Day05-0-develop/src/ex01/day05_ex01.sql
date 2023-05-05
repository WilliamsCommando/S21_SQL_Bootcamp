set enable_seqscan to off;

explain analyze
    select menu.pizza_name, pizzeria.name as pizzeria_name from pizzeria, menu
    where pizzeria.id = menu.pizzeria_id;
