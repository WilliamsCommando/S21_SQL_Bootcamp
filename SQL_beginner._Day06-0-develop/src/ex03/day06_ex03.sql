set enable_seqscan = off;

create unique index idx_person_discounts_unique on person_discounts (person_id, pizzeria_id);

explain analyze
select person_id, pizzeria_id from person_discounts;