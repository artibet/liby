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
;


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
;    


# author_list
create view author_list as
select
    id,
    author_name,
    bio,
    email,
    created_at,
    updated_at,
    (select count(*) from book_authors where author_id = author.id) as books
from
    author
;


# category_list
create view category_list as
select
    id,
    description,
    created_at,
    updated_at,
    (select count(*) from book_categories where category_id = category.id) as books
from
    category
;

# user_list
create view user_list as
select  
    id,
    username,
    first_name,
    last_name,
    email,
    password,
    is_superuser,
    is_staff,
    last_login,
    date_joined,
    is_active,
    (select count(*) from lend where lend.id = auth_user.id) as lends,
    (select count(*) from comment where comment.user_id = auth_user.id) as comments,
    (select count(*) from hold where hold.user_id = auth_user.id) as holds,
    (select count(*) from suggestion where suggestion.user_id = auth_user.id) as suggestions
from auth_user
;