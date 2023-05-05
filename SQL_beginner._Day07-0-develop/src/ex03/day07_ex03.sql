with pizzeria_order as (
        select name, count(name) as cz from person_order as po
        join menu m on m.id = po.menu_id
        join pizzeria p on m.pizzeria_id = p.id
        group by name
        order by 1
    ),
     pizzeria_visits as (
        SELECT pz.name, count(name) as cp from person_visits as pv
        join pizzeria pz on pv.pizzeria_id = pz.id
        group by pz.name
        order by 1
     )
    select (case when pizzeria_visits.name is null then pizzeria_order.name
        else pizzeria_visits.name end),
           ((case when pizzeria_order.cz is null then 0
            else pizzeria_order.cz end) + (case when pizzeria_visits.cp is null then 0
            else pizzeria_visits.cp end)) as total_count
    from pizzeria_order
    full join pizzeria_visits on pizzeria_visits.name = pizzeria_order.name
    order by total_count desc;