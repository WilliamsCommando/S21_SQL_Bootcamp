-- 1 session
begin transaction isolation level repeatable read;;

-- 2 session
begin transaction isolation level repeatable read;;

-- 1 session
select * from pizzeria where name  = 'Pizza Hut';

-- 2 session
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

-- 1 session
select * from pizzeria where name  = 'Pizza Hut';
commit;
select * from pizzeria where name  = 'Pizza Hut';

-- 2 session
select * from pizzeria where name  = 'Pizza Hut';