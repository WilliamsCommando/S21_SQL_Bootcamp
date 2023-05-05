create table person_audit (
    created timestamp with time zone default now() not null,
    type_event char(1) not null default 'I',
    row_id bigint not null,
    name varchar not null,
    age integer not null,
    gender varchar not null,
    address varchar not null,
    constraint ch_type_event check (type_event = 'I' or type_event = 'U' or type_event = 'D')
);

create or replace function fnc_trg_person_insert_audit()
returns trigger as $person_audits$
    begin if (TG_OP = 'INSERT') then
    insert into person_audit select now(), 'I', NEW.*;
end if;
    return null;
end;
    $person_audits$ language plpgsql;

create trigger trg_person_insert_audit after insert on person
    for each row execute function fnc_trg_person_insert_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');