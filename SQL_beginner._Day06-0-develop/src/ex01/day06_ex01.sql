insert into person_discounts
select row_number() over() as id,
    p.person_id as person_id,
    m.pizzeria_id as pizzeria_id,
    (case when count(m.pizzeria_id) = 1 then 10.5
      when count(m.pizzeria_id) = 2 then 22
      else 30 end) from person_order as p
left join menu m on m.id = p.menu_id
group by p.person_id, m.pizzeria_id;