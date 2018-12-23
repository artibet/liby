# publisher_list
create view publisher_list as
select 
    id,
    pub_name,
    city,
    address,
    zip,
    phone,
    country_id,
    created_at,
    updated_at,
    (select count(*) from book where publisher_id = publisher.id) as books
from
    publisher


# language_list
create view language_list as
select 
    id,
    description,
    created_at,
    updated_at,
    (select count(*) from book where language_id = language.id) as books
from
    language    