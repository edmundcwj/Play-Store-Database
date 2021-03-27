create table apps(name varchar(100), category varchar(100), genre varchar(100), price float, type varchar(10), id int, primary key(id));
create table reviews(name varchar(100), rating real, review int, content varchar(50));
create table versions (id int, latest date, version char(10), android_version char(10), install int, size float, primary key(id));
create table sentiment (name varchar(100), comment vachar(500), pov varchar(50));


select name as app_name, price from apps where type = 'Paid' and name in(select name from reviews where rating > 4);
select name as app_name, strftime('%Y', latest) as last_update from apps a, versions v where a.id = v.id and install > 5000000 and name in(select name from reviews where review > 200000);
select avg(rating) from reviews where content like '%Mature%';
select name, count(pov) as num_of_positive from reviews r, sentiment s where review > 100000 and r.name = s.name and s.pov like 'Positive' group by s.name having num_of_positive > 100;
select category, sum(review) as total_reviews from apps a, reviews r where a.name = r.name group by category order by total_reviews desc;
select category, count(*) from apps where type like 'Free' group by category order by count(genre) desc;
select name as app_name, genre, v.install as total_downloads from apps a, versions v where type = 'Free' and a.id = v.id and v.install > 10000000 and app_name in(select name from reviews where rating >= 3);

insert into apps values
('Attack on Titan', 'GAME', 'Action', 5.00, 'Paid', 10843),
('Say What Messenger', 'COMMUNICATION', 'communication', 0.00, 'Free', 10844);

insert into reviews values
('Attack on Titan', 4.1 , 402126, 'Teen'),
('Say What Messenger', 2.2, 1567, 'Everyone');

insert into versions values
(10843, '2017-1-1', '6.1.1', '4.0.3', 1000000, 110),
(10844, '2018-10-10', '1.2.1', '4.0.3', 5000000, 23);

insert into sentiment values
('Attack on Titan', 'Gameplay is smooth', 'Positive'),
('Attack on Titan', 'Worst game ever', 'Negative'),
('Say What Messenger', 'The new update makes it crash', 'Negative'),
('Say What Messenger', 'Love the new emojis', 'positive');

update reviews set rating = 3.8 where name like 'Attack on Titan';
update versions set version = '1.2.2' where id = 10844;




