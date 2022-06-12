use complex_queries;
drop table teams;
create table teams (team_code varchar(100), team_name varchar(200));
insert into teams values("CSK", "Chennai Super Kings");
insert into teams values("DC", "Delhi Capitals");
insert into teams values("MI", "Mumbai Indians");
insert into teams values("SRH", "Sunrisers Hyderabad");
insert into teams values("GT", "Gujrat Titans");
insert into teams values("RR", "Rajasthan Royals");
insert into teams values("RCB", "Royal Challengers Bangalore");
insert into teams values("KKR", "Kolkata Knight Riders");
insert into teams values("PBKS", "Punjab Kings");
insert into teams values("LSG", "Lucknow Super Giants");

-- teams playing each other only once
with matches as
	(select row_number() over(order by team_name) as ID, team_name, team_code
	from teams)

select team.team_name as team, opponent.team_name as opponent
from matches team
join matches opponent on team.id < opponent.id; 

-- teams playing each other twice
with matches as
	(select row_number() over(order by team_name) as ID, team_name, team_code
	from teams)

select team.team_name as team, opponent.team_name as opponent
from matches team
join matches opponent on team.id <> opponent.id; 