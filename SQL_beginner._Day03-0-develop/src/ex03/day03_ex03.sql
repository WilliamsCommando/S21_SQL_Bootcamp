with male as (select pizzeria.name as pizzeria_name from pizzeria
    join person_visits p on pizzeria.id = p.pizzeria_id
    join person on gender = 'male'
    and person.id = p.person_id
    order by 1),
female as (
    select pizzeria.name as pizzeria_name from pizzeria
    join person_visits on pizzeria.id = person_visits.pizzeria_id
    join person on gender = 'female'
    and person.id = person_visits.person_id
    order by 1)
(select * from female
    except all
    select * from male)
union all
(select * from male
    except all
    select * from female)
order by 1;