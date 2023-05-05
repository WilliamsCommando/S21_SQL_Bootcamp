with pizzeria_order as (
        select pizzeria_id, count(m.pizzeria_id), 'order' as action_type from person_order po
        join menu m on m.id = po.menu_id
        group by pizzeria_id
        order by 2 desc limit 3
    ),
     pizzeria_visits as (
        SELECT pizzeria_id, count(pv.pizzeria_id), 'visit' as action_type from person_visits pv
        group by pizzeria_id
        order by 2 desc limit 3
     )
    select p.name, data.count, data.action_type from (
    select * from pizzeria_order
    union all
    select * from pizzeria_visits) as data
    inner join pizzeria as p on data.pizzeria_id = p.id
    order by action_type, 2 desc