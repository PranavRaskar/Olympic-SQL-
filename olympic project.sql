create database project1;
use project1;

create table olympics(
ID int,
Name varchar(500),
Sex varchar(10),
Age int,
Height int,
Weight int,
Team varchar(350),
NOC varchar(100),
Games varchar(500),
Year int,
Season varchar(400),
City varchar(300),
Sport varchar(500),
Event varchar(400),
Medal varchar(200));

select * from olympics;

show variables like "secure_file_priv";

load data infile "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Athletes_Transformed.csv"
into table olympics
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * form olympics;
select * from olympics;

-- 1.how many medal counts present for entire data
select medal,count(*) as medalcount from olympics
where medal <> 'NoMedal'
group by medal;

-- 2.count of unique sports present in Olympics
select count(distinct Sport) as unique_sports from olympics;


-- 3.how many different medals won by team India
select count(distinct medal ) as medal_won_india from olympics
where team = "india";


-- 4.event wise medals won by India show from highest to lowest medals won in order
select event, count(*) as total_medal from olympics
where team = "india"
group by event
order by total_medal desc;


-- 5. event wise medals won by India in order of year
SELECT year,event, medal FROM olympics
WHERE team = 'India'
ORDER BY year asc;


-- 6. country who won maximum medals.
select team,count(*)as max_won  from olympics
group by team
order by max_won desc
limit 1;

-- 7.top 10 countries who won gold
select team,count(*)as won_gold from olympics
where medal="gold"
group by team
order by won_gold desc
limit 10;


--  8. in which year did United states won most gold medal

select year ,count(medal ) as medal_count from olympics
where team="United states" and medal="gold"
group by Year
order by medal_count desc
limit 1;

-- 9. In which sports United States has most medals.
select Sport ,count(medal ) as medal_count from olympics
where team="United states" 
group by sport
order by medal_count desc
limit 1;


-- 10.top three players who won most medals along with their sports and country
select name, sport,team ,count(medal) as total_medals from olympics
group by name ,sport,team
order by total_medals desc
limit 3;


-- 11. player with most gold medals in cycling along with his country.
select name,team,sport ,count(medal) as total_medals from olympics
where sport ="cycling" and medal="gold"
group by name , team ,sport
order by total_medals desc
limit 1;


-- 12. player with most medals (Gold+Silver+Bronze) in Basketball also show his country.
select name,sport ,count(*) as total_medals from olympics
where sport ="basketball"
group by name ,sport
order by total_medals desc
limit 1;

-- 13. the count of different medals of the top basketball player Teresa Edwards
select name , medal,count(*) from olympics
where name= "Teresa Edwards"
group by medal;



-- 14. medals won by male,female each year , Export this data and plot graph in excel
select sex,Year,count(medal) as medal_count from olympics
group by sex ,Year
order by sex,Year; 