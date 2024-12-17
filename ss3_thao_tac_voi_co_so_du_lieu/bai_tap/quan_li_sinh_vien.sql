drop database if exists quan_li_sinh_vien;
create database quan_li_sinh_vien;
use quan_li_sinh_vien;

create table classes(
class_id int auto_increment primary key,
class_name varchar(55) not null,
start_date date not null,
statuss bit
);

create table students(
student_id int auto_increment primary key,
student_name varchar(55) not null,
address varchar(55) not null,
phone varchar(20),
statuss bit,
class_id int not null,
foreign key(class_id) references classes(class_id)
);

create table subjects(
sub_id int auto_increment primary key,
sub_name varchar(55) not null,
credit tinyint not null default 1 check (credit >= 1),
statuss bit default 1  
);

create table marks(
mark_id int auto_increment primary key,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
unique(sub_id, student_id),
foreign key(sub_id) references subjects(sub_id),
foreign key(student_id) references students(student_id)
);

insert into classes 
values(1, "A1", "2003-11-22", 1 ),
(2, "A2", "2003-11-11", 1),
(3, "A3", "2003-12-23", 0);

insert into students(student_name, address, phone, statuss, class_id) values
("Hung", "Ha Noi", "0912113113", 1, 1);
insert into students(student_name, address, statuss, class_id) values
("Hoa", "Hai phong", 1, 1);
insert into students(student_name, address, phone, statuss, class_id) values
("Manh", "HCM", "0123123123", 0, 2);

insert into subjects 
values (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 insert into marks (sub_id, student_id, mark, examtimes)
 values(1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);
 
 select * from students
 where student_name like "h%";
 
 select * from classes
 where month(start_date) = 12;
 
 select * from subjects
 where credit between 3 and 5;
 
 update students
 set class_id = 2
 where student_name = "Hung"
 limit 1;
 
 select st.student_name, sb.sub_name, m.mark
 from marks m
 join students st on m.student_id = st.student_id
 join subjects sb on m.sub_id = sb.sub_id
 order by m.mark desc,
 st.student_name asc;