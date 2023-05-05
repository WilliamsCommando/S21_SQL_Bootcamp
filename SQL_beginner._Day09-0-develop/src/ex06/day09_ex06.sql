create or replace function fnc_person_visits_and_eats_on_date(
    in pperson varchar default 'Dmitriy',
    in pprice numeric default 500,
    in pdate date default '2022-01-08'::date)

returns table(pizzeria varchar) as $$
    begin
        return query
            select pizzeria.name from pizzeria
                join person_order po on pizzeria.id = po.person_id
                join menu m on m.id = po.menu_id
                join person_visits pv on pizzeria.id = pv.person_id
                join person p on p.id = po.person_id
                where p.name = pperson
                  and m.price < pprice
                  and po.order_date = pdate
                  and pv.visit_date = pdate;
        return;
    end;
$$ language plpgsql;
