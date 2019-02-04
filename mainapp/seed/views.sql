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
    (select count(*) from lend where lend.user_id = auth_user.id) as lends,
    (select count(*) from comment where comment.user_id = auth_user.id) as comments,
    (select count(*) from hold where hold.user_id = auth_user.id) as holds
from auth_user
;


# num_entries per book
create or replace view num_entries as
select
    book.id as book_id,
    count(entry.book_id) as entries
from
    book left outer join entry on book.id = entry.book_id
where
    entry.cancel_date is null
group by
    book.id
;


# active lends per book
create or replace view active_lends as
select
    book.id as book_id,
    (select 
        count(*)
     from 
        lend, 
        entry
     where
        lend.entry_id = entry.id and
        entry.book_id = book.id and
        lend.return_date is null) as lends
from
    book 
;


# book_data
create or replace view book_data as
select 
    book.id as book_id,
    num_entries.entries as num_entries,
    active_lends.lends as active_lends,
    num_entries.entries - active_lends.lends as available,
    (select count(*) from hold where hold.book_id = book.id and hold.status_id = 0) as active_holds,
    (select count(*) from lend, entry where lend.entry_id = entry.id and entry.book_id = book.id) as total_lends,
    (select count(*) from comment where comment.book_id = book.id) as num_comments,
    ifnull((select count(*) from comment where comment.book_id = book.id and stars=1), 0) as num_stars1,
    ifnull((select count(*) from comment where comment.book_id = book.id and stars=2), 0) as num_stars2,
    ifnull((select count(*) from comment where comment.book_id = book.id and stars=3), 0) as num_stars3,
    ifnull((select count(*) from comment where comment.book_id = book.id and stars=4), 0) as num_stars4,
    ifnull((select count(*) from comment where comment.book_id = book.id and stars=5), 0) as num_stars5,
    ifnull((select sum(stars) from comment where comment.book_id = book.id), 0) as sum_stars
from
    book,
    num_entries,
    active_lends
where
    book.id = num_entries.book_id and
    book.id = active_lends.book_id
;
    
# book_newest
create or replace view book_newest as
select
    id as book_id
from
    book
where
    exists (select book_id from entry where book.id = entry.book_id) 
order by created_at desc
;


# Κορυφαίοι τίτλοι
create or replace view book_top_titles as
select
    book_id,
    ifnull((sum_stars / num_comments), 0) as grade
from
    book_data
where
    exists (select book_id from entry where book_data.book_id = entry.book_id) 
order by
    (sum_stars / num_comments) desc, grade asc
;

# Προτιμήσεις αναγνωστών (σύνολο δανεισμών)
create or replace view book_best_choices as
select
    book_id,
    total_lends
from
    book_data
where
    exists (select book_id from entry where book_data.book_id = entry.book_id) 
order by
    total_lends desc
;


# Δεδομένα δανεισμών
create or replace view lend_data as
select
    id as lend_id,
    datediff(curdate(), date_add(lend_date, interval lend_days day)) as delay
from
    lend
;