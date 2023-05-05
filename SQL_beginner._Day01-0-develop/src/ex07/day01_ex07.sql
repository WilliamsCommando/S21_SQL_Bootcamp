select order_date, concat(name, ' (age:', age, ')') as person_information from person
join person_order on person.id = person_order.person_id
order by order_date, person_information;