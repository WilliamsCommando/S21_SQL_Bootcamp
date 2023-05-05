select coalesce(person.name, '-') as person_name, pv.visit_date, coalesce(piz.name, '-') as pizzeria_name
from (select * from person_visits where visit_date between '2022-01-01' and '2022-01-03') pv
full join person on pv.person_id = person.id
full join pizzeria piz on pv.pizzeria_id = piz.id
order by person_name, pizzeria_name, visit_date;