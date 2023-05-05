create or replace function fnc_fibonacci (in pstop integer default 10)
returns setof integer language SQL AS $$
    with recursive f(a,b) as (
            values (0,1)
        union all
            select greatest(a,b), a + b as a from f
            where b < pstop
       )
    select a from f;
$$;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
