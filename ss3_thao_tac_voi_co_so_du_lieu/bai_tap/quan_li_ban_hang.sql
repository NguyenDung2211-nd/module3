drop database if exists quan_li_ban_hang;
create database quan_li_ban_hang;
use quan_li_ban_hang;

create table customers(
customer_id int auto_increment primary key,
customer_name varchar(50) not null,
customer_age int not null
);

create table orders(
order_id int auto_increment primary key,
customer_id int,
order_date date not null,
order_total_price decimal(10, 2),
foreign key fk1_cus_odr(customer_id) references customers(customer_id) 
);

create table products(
product_id int auto_increment primary key,
product_name varchar(50) not null,
product_price int not null
);

create table orders_detail(
order_id int,
product_id int,
order_quantity int not null,
primary key(order_id, product_id),
foreign key fk1_odr_odt(order_id) references orders(order_id),
foreign key fk1_prd_odt(product_id) references products(product_id)
);

insert into customers(customer_name, customer_age) 
values("Minh Quan", 10),
("Ngoc Anh", 20),
("Hong Ha", 50);

insert into orders(customer_id, order_date)
values(1, "2006-03-21"),
(2, "2006-03-23"),
(1, "2006-03-16");

insert into products(product_name, product_price)
values("May Giat", 3),
("Tu Lanh", 5),
("Dieu Hoa", 7),
("Quat", 1),
("Bep Dien", 2);

insert into orders_detail(order_id, product_id, order_quantity) 
values(1,1,3),(1,3,7),(1,4,2),(2,1,1),
(3,1,8),(2,5,4),(2,3,3);

update orders odr
set odr.order_total_price = (
    select sum(od.order_quantity * prd.product_price) 
    from orders_detail od
    join products prd on od.product_id = prd.product_id
    where od.order_id = odr.order_id
)
limit 1;
select 
    order_id as order_id, 
    order_date as order_date, 
    order_total_price as order_total_price 
from orders;

select ctm.customer_id,
ctm.customer_name,
ctm.customer_age
from customers ctm
join orders odr on ctm.customer_id = odr.customer_id;
select ctm.customer_id, ctm.customer_name,
prd.product_id, prd.product_name,
prd.product_price, od.order_quantity
from customers ctm
join orders odr on ctm.customer_id = odr.customer_id
join orders_detail od on odr.order_id = od.order_id
join products prd on od.product_id = prd.product_id
order by ctm.customer_id, prd.product_id;

select ctm.customer_name 
from customers ctm
left join orders odr on ctm.customer_id = odr.customer_id
where odr.order_id is null;


