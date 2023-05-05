with numb as (select address,
    round(max(age::numeric) - (min(age::numeric) / max(age::numeric)), 2) as formula,
    round(avg(age::numeric), 2) as average
    from person
    group by address)
select address, formula, average, formula > average as comparison from numb
order by address;