drop database if exists management_product;
create database management_product;
use management_product;

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
product_price float not null
);

create table orders_detail(
order_id int,
product_id int,
order_quantity int not null,
primary key(order_id, product_id),
foreign key fk1_odr_odt(order_id) references orders(order_id),
foreign key fk1_prd_odt(product_id) references products(product_id)
);
