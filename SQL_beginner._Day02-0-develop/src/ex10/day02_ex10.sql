select pn1.name as person_name1, pn2.name as person_name2, pn1.address as common_address
from person as pn1
join person as pn2
    on pn1.address = pn2.address
where pn1.address = pn2.address and pn1.id > pn2.id
order by 1, 2, 3;