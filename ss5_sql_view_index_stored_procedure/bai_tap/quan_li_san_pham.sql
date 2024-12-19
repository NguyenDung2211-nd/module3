create database demo_ss5;
use demo_ss5;

create table products(
id int auto_increment primary key,
product_code varchar(6) not null,
product_name varchar(45) not null,
product_price decimal(10,2) not null,
product_amount int not null,
product_description varchar(255),
product_status bit
);

insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values
("prd1", "nước mắm", "50000.00", 3, "mặn như mắm", 1),
("prd2", "đường", "40000.00", 5, "ngọt như đường", 1),
("prd3", "tương ớt", "50000.00", 6, "hơi cay", 1);

create unique index index_product_code on products(product_code);
create index index_product_name_price on products(product_name, product_price);

explain select * from products where product_code = "prd1";
explain select * from products where product_name = "nước mắm" and product_price = "50000.00";

create view view_product as
select product_code, product_name, product_price, product_status
from products;

create or replace view view_product as
select product_code, product_name, product_price, product_status, product_amount
from products;

drop view view_product;

select * from view_product;

delimiter //
create procedure getallproducts()
begin 
select * from products;
end //
delimiter ;
call getallproducts;

delimiter //
create procedure addproducts(
in p_code varchar(6),
in p_name varchar(45),
in p_price decimal(10,2),
in p_amount int,
in p_description varchar(255),
in p_status bit
)
begin
insert into products(product_code, product_name, product_price, product_amount, product_description, product_status)
values (p_code, p_name, P_price, p_amount, p_description, p_status);
end //
delimiter ;

call addproducts("prd4", "bánh quy bơ", "20000.00", 7, "Bánh ngọt liệm luôn", 1);

delimiter //
create procedure updateproducts(
in p_id int,
in p_code varchar(6),
in p_name varchar(45),
in p_price decimal(10,2),
in p_amount int,
in p_description varchar(255),
in p_status bit
)
begin
update products
set 
product_code = p_code,
product_name = p_name,
product_price = p_price,
product_amount = p_amount,
product_description = p_description,
product_status = p_status
where id = p_id;
end //
delimiter ;

call updateproducts(2, "prd2", "Đường phèn", "35000.00", 0, "vừa cứng vừa quá ngọt, dở kinh.", 0);

delimiter //
create procedure deleteproducts(
in p_id int
)
begin
delete from products
where id = p_id;
end //
delimiter ;

call deleteproducts(4);

select * from products;

