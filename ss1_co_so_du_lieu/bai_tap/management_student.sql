create database management_student;
use management_student;

create table classes(
id int auto_increment primary key,
name_class varchar(50)
);

insert into classes (name_class) value
 ("c0924g1"),("c1024g1");
 select * from classes;
 
 
 create table teachers(
 id int auto_increment primary key,
 name_teacher varchar(50),
 age int,
 country varchar(50)
 );
 
 insert into teachers (name_teacher, age, country) value 
 ("Hải TT", "18", "Việt Nam"),
 ("Văn Chánh", "18", "Việt Nam");
 select * from teachers;