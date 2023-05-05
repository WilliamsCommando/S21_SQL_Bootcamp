with male as (select distinct pizzeria.name as pizzeria_name from pizzeria
    join person_visits p on pizzeria.id = p.pizzeria_id
    join person on gender = 'male'
    join person_order po on person.id = po.person_id
    join menu m on m.id = po.menu_id
    and p.pizzeria_id = m.pizzeria_id
    and person.id = p.person_id
    order by 1),
female as (
    select distinct pizzeria.name as pizzeria_name from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person_order o on person_visits.person_id = o.person_id
    join menu m2 on m2.id = o.menu_id
    join person on gender = 'female'
    and person_visits.pizzeria_id = m2.pizzeria_id
    and person.id = person_visits.person_id
    order by 1)
(select * from female
    except all
    select * from male)
union
(select * from male
    except all
    select * from female)
order by 1;