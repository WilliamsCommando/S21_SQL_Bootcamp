drop function fnc_persons_male();
drop function fnc_persons_female();

create or replace function fnc_persons(in pgender varchar default 'female')
returns setof person as $$
    select * from person where gender = pgender
$$ language sql;