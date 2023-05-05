create or replace function fnc_trg_person_update_audit()
returns trigger as $person_audit$
    begin if (TG_OP = 'UPDATE') then
    insert into person_audit select now(), 'U', OLD.*;
    return OLD;
end if;
    return null;
end;
    $person_audit$ language plpgsql;

create trigger trg_person_update_audit after insert on person
for each row execute function fnc_trg_person_update_audit();

update person set name = 'Bulat' where id = 10;
update person set name = 'Danil' where id = 10;