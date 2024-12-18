
create database quan_li_nhan_vien;
use quan_li_nhan_vien;

create table vi_tri(
id_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45) not null
);

create table trinh_do(
id_trinh_do int auto_increment primary key,
trinh_do varchar(45) not null
);

create table bo_phan(
id_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45) not null
);

create table nhan_vien(
id_nhan_vien int auto_increment primary key,
ten_nhan_vien varchar(45) not null,
id_vi_tri int,
id_trinh_do int,
id_bo_phan int,
ngay_sinh date not null,
so_cmnd varchar(45) not null,
luong varchar(45) not null,
sdt varchar(45) not null,
email varchar(100) not null,
dia_chi varchar(200) not null,
foreign key(id_vi_tri) references vi_tri(id_vi_tri),
foreign key(id_trinh_do) references trinh_do(id_trinh_do),
foreign key(id_bo_phan) references bo_phan(id_bo_phan)
);

create table loai_dich_vu(
id_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45) not null
);

create table kieu_thue(
id_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45) not null,
gia int 
);

create table dich_vu(
id_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45) not null,
dien_tich int, 
so_tang int,
so_nguoi_toi_da varchar(45),
chi_phi_thue varchar(45),
id_kieu_thue int,
id_loai_dich_vu int,
trang_thai varchar(45),
foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue), 
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu) 
);

create table loai_khach(
id_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45) not null
);

create table khach_hang(
id_khach_hang int auto_increment primary key,
id_loai_khach int,
ten_khach_hang varchar(45) not null,
ngay_sinh date not null,
so_cmnd_khach_hang varchar(45) not null,
sdt_khach_hang varchar(45) not null,
email_khach_hang varchar(100) not null,
dia_chi_khach_hang varchar(200) not null,
foreign key(id_loai_khach) references loai_khach(id_loai_khach)
);

create table hop_dong(
id_hop_dong int auto_increment primary key,
id_nhan_vien int,
id_khach_hang int,
id_dich_vu int,
ngay_lam_hop_dong date not null,
ngay_ket_thuc date not null,
tien_dat_coc int not null,
tong_tien int,
foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien),
foreign key(id_khach_hang) references khach_hang(id_khach_hang),
foreign key(id_dich_vu) references dich_vu(id_dich_vu)
);

create table dich_vu_di_kem(
id_dich_vu_di_kem int auto_increment primary key,
ten_dich_vu_di_kem varchar(45),
gia int,
don_vi int,
trang_thai_kha_dung varchar(45)
);

create table hop_dong_chi_tiet(
id_hop_dong_chi_tiet int auto_increment primary key,
id_hop_dong int,
id_dich_vu_di_kem int,
so_luong int not null,
foreign key(id_hop_dong) references hop_dong(id_hop_dong),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem)
);

insert into vi_tri (ten_vi_tri) 
values 
    ('Nhân viên lễ tân'),
    ('Nhân viên phục vụ'),
    ('Quản lý'),
    ('Giám đốc');

insert into trinh_do (trinh_do) 
values 
    ('Trung cấp'),
    ('Cao đẳng'),
    ('Đại học'),
    ('Thạc sĩ');

insert into bo_phan (ten_bo_phan) 
values
    ('Bộ phận lễ tân'),
    ('Bộ phận phục vụ'),
    ('Bộ phận quản lý'),
    ('Bộ phận kỹ thuật'); 
    
insert into nhan_vien (ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi) 
values
    ('Nguyễn Văn A', 1, 3, 1, '1990-05-20', '123456789', '10000000', '0909123456', 'nguyenvana@example.com', 'Hà Nội'),
    ('Trần Thị B', 2, 2, 2, '1995-08-15', '234567890', '9000000', '0909876543', 'tranthib@example.com', 'TP HCM'),
    ('Lê Văn C', 3, 4, 3, '1988-12-25', '345678901', '15000000', '0912345678', 'levanc@example.com', 'Đà Nẵng'),
    ('Phạm Thị D', 4, 4, 4, '1985-03-10', '456789012', '20000000', '0987654321', 'phamthid@example.com', 'Hải Phòng');
 
 insert into loai_dich_vu (ten_loai_dich_vu) 
values 
    ('Phòng'),
    ('Villa'),
    ('Nhà');
 
 insert into kieu_thue (ten_kieu_thue, gia) 
values 
    ('Thuê theo giờ', 50000),
    ('Thuê theo ngày', 500000),
    ('Thuê theo tuần', 3000000),
    ('Thuê theo tháng', 12000000);

insert into dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai) 
values 
	('Phòng Deluxe', 30, 1, '2 người', '1000000', 1, 1, 'Còn trống'),
    ('Biệt thự ven biển', 120, 2, '6 người', '5000000', 2, 2, 'Còn trống'),
    ('Nhà gỗ trên núi', 60, 1, '4 người', '3000000', 3, 3, 'Còn trống');

insert into loai_khach (ten_loai_khach) 
values 
    ('Khách vãng lai'),
    ('Khách thân quen'),
    ('Khách VIP');

insert into khach_hang (id_loai_khach, ten_khach_hang, ngay_sinh, so_cmnd_khach_hang, sdt_khach_hang, email_khach_hang, dia_chi_khach_hang) 
values 
    (1, 'Nguyễn Văn E', '1998-07-22', '567890123', '0934567890', 'nguyenvane@example.com', 'Hà Nội'),
    (2, 'Trần Thị F', '1993-04-18', '678901234', '0912123456', 'tranthif@example.com', 'TP HCM'),
    (3, 'Lê Văn G', '2000-11-30', '789012345', '0909876543', 'levang@example.com', 'Đà Nẵng');
    
insert into hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien) 
values 
    (1, 1, 1, '2024-12-10', '2024-12-15', 2000000, 5000000),
    (2, 2, 2, '2024-12-12', '2024-12-18', 3000000, 10000000),
    (3, 3, 3, '2024-12-20', '2024-12-25', 2500000, 8000000);
        
insert into dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung) 
values 
    ('Nước uống', 20000, 1, 'Có sẵn'),
    ('Xe đưa đón', 500000, 1, 'Còn sẵn'),
    ('Dịch vụ dọn phòng', 100000, '2', 'Còn hàng'),
    ('Spa & Massage', 300000, '3', 'Còn hàng'),
    ('Dịch vụ spa', 800000, 1, 'Hết chỗ');

insert into hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong) 
values 
    (1, 1, 5), 
    (1, 3, 2), 
    (2, 2, 3),
    (2, 4, 1), 
    (3, 5, 1), 
    (3, 1, 2), 
    (3, 2, 2);
  
select * from nhan_vien
where (ten_nhan_vien like "H%" or ten_nhan_vien like "T%" or ten_nhan_vien like "K%")
and (ten_nhan_vien) <= 15;

select * from khach_hang
where timestampdiff(year, ngay_sinh, curdate()) between 18 and 50
and dia_chi_khach_hang in ('Đà nẵng', 'Quảng Trị');

select khach_hang.ten_khach_hang, loai_khach.ten_loai_khach, COUNT(hop_dong.id_hop_dong) AS so_lan_dat_phong
from khach_hang
join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
where loai_khach.ten_loai_khach = 'Diamond'
group by khach_hang.id_khach_hang
order by so_lan_dat_phong asc;















