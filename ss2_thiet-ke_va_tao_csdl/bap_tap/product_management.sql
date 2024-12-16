DROP DATABASE IF EXISTS management_product;
create database management_product;
use management_product;

create table customers(
cID int auto_increment primary key,
cName varchar(50) not null,
cAge int not null
);

create table orders(
oID int auto_increment primary key,
cID int,
oDate date not null,
oTotalPrice decimal(10, 2),
foreign key fk1_cus_odr(cID) references customers(cID) 
);

create table products(
pID int auto_increment primary key,
pName varchar(50) not null,
pPrice float not null
);

create table orderDetail(
oID int,
pID int,
odQTY int not null,
primary key(oID, pID),
foreign key fk1_odr_odt(oID) references orders(oID),
foreign key fk1_prd_odt(pID) references products(pID)
);
