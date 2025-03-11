show databases;
create database if not exists first_test;
use first_test;
CREATE TABLE person(
	id_person smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum("F", "M"),
	birth_date DATE,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key(id_person)
);

create table favorite_food(
	id_person smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key(id_person, food),
    constraint fk_favorite_food_id_person foreign key(id_person)
    references person(id_person)
);

select * from information_schema.table_constraints
where constraint_schema = "first_test";

insert into person value('4', 'Lio', 'Theking', 'M', '2020-06-03', 'StreetHax', 'Son Pablo', 'SP', 'India', '00000000');

delete from person where id_person=3;

insert into favorite_food values('4', 'lasanha'),
    ('1', 'pizza');


