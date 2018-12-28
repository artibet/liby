# publisher_list
create or replace view publisher_list as
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
create or replace view language_list as
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
create or replace view author_list as
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
create or replace view category_list as
select
    id,
    description,
    created_at,
    updated_at,
    (select count(*) from book_categories where category_id = category.id) as books
from
    category
;

# user_data
create or replace view user_data as
select  
    id as user_id,
    (select count(*) from lend where lend.id = auth_user.id) as lends,
    (select count(*) from comment where comment.user_id = auth_user.id) as comments,
    (select count(*) from hold where hold.user_id = auth_user.id) as holds,
    (select count(*) from suggestion where suggestion.user_id = auth_user.id) as suggestions
from auth_user
;

# book_data
create or replace view book_data as
select 
    id as book_id,
    (select count(*) from hold where hold.id = book.id and hold.status_id = 0) as active_holds,
    (select count(*) from entry where entry.book_id = book.id and entry.cancel_date is null) as num_entries,
    (select count(*) from lend, entry where lend.entry_id = entry.id and entry.book_id = book.id) as num_lends,
    (select count(*) from comment where comment.book_id = book.id) as num_comments,
    (select sum(stars) from comment where comment.book_id = book.id) as sum_stars,
    (select count(*) from lend, entry where lend.entry_id = entry.id and entry.book_id = book.id and lend.return_date is null) as on_lend
from
    book
;
    
# Recent 10 new editions
# book_newest
create or replace view book_newest as
select
    id as book_id
from
    book
where exists (select book_id from entry where book.id = entry.book_id) 
order by created_at desc
limit 10
;

# 
