-- 1 session
begin transaction isolation level repeatable read;;

-- 2 session
begin transaction isolation level repeatable read;;

-- 1 session
update pizzeria set rating = 1 where id = 1;

-- 2 session
update pizzeria set rating = 1 where id = 2;

-- 1 session
update pizzeria set rating = 1 where id = 2;

-- 2 session
update pizzeria set rating = 1 where id = 1;

-- 1 session
commit;

-- 2 session
commit;