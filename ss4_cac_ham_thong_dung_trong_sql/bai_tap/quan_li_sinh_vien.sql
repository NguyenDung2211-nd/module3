create database quan_li_sinh_vien_ss4;
use quan_li_sinh_vien_ss4;

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
mark_id int auto_increment unique,
sub_id int not null,
student_id int not null,
mark float default 0 check (mark between 0 and 100),
examtimes tinyint default 1,
primary key(sub_id, student_id),
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
 
 select address, count(student_id) as so_luong_hoc_vien
 from students
 group by address;
 
select st.student_id, st.student_name, avg(m.mark) as diem_trung_binh
from students st join marks m on st.student_id = m.student_id
group by st.student_id, st.student_name
having avg(m.mark) > 15;

select st.student_id, st.student_name, avg(mark)
from students st 
join marks m on st.student_id = m.student_id
group by st.student_id, st.student_name
having avg(mark) >= all (select avg(mark) from marks group by marks.student_id);

select sub_id, sub_name, credit
from subjects
where credit = (select max(credit) from subjects); 

select s.sub_id, s.sub_name, s.credit, m.mark
from subjects s
join marks m on s.sub_id = m.sub_id
where m.mark = (select max(mark) from marks);

select st.student_id, st.student_name, st.address, st.phone,
avg(m.mark) as diem_trung_binh
from students st
join marks m on st.student_id = m.student_id
group by st.student_id, st.student_name, st.address, st.phone
order by diem_trung_binh desc;




