-- 1 session
begin transaction isolation level repeatable read;;

-- 2 session
begin transaction isolation level repeatable read;;

-- 1 session
select sum(rating) from pizzeria;

-- 2 session
update pizzeria set rating = 1.0 where name = 'Pizza Hut';
commit;

-- 1 session
select sum(rating) from pizzeria;
commit;
select sum(rating) from pizzeria;

-- 2 session
select sum(rating) from pizzeria;