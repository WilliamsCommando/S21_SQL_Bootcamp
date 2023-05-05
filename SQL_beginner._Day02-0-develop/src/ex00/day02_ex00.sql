select name, rating from pizzeria
left join person_visits pv on pizzeria.id = pv.pizzeria_id
where visit_date is null;