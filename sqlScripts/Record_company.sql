create database if not exists record_company;
use record_company;
create table if not exists bands(
	id int not null auto_increment,
    name varchar(255),
    year varchar(10),
    primary key(id)
);

create table if not exists albums(
	id int not null auto_increment,
    album_name varchar(255),
    band_id int not null,
    year_released int,
    primary key(id),
    foreign key(band_id) references record_company.bands(id)
);

insert into record_company.bands values(1, "Aerosmith", "1970");
insert into record_company.bands values(2, "Adele", "2002");
insert into record_company.bands values(3, "Green Day", "1987");
insert into record_company.bands values(4, "Guns N Roses", "1985");

insert into record_company.albums values (1, "boulevard of broken dreams", 3, 2004);
insert into record_company.albums values (2, "sweet child o mine", 4, 1993);

select name, album_name, year_released
from bands
join albums on bands.id = albums.band_id;

select name ,row_number() over(order by id desc) as rw
from bands;




