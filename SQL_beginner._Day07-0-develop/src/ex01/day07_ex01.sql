select p.name, count(pizzeria_id) as count_of_visits from person_visits
join person p on person_visits.person_id = p.id
group by p.name
order by count_of_visits desc, p.name limit 4;