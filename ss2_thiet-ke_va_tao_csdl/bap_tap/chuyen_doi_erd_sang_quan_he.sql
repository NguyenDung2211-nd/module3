drop database if exists quan_li_don_hang;
create database quan_li_don_hang;
use quan_li_don_hang;

create table phieu_xuat(
    so_phieu_xuat int not null primary key,
    ngay_xuat date not null
);

create table vat_tu(
    ma_vat_tu int not null primary key,
    ten_vat_tu varchar (200) not null
);

create table don_dat_hang(
    so_don_hang int not null primary key,
    ngay_dat_hang date not null
);

create table phieu_nhap(
    so_phieu_nhap int not null primary key,
    ngay_nhap date not null
);

create table nha_cung_cap(
    ma_nha_cung_cap int not null primary key,
    ten_nah_cung_cap varchar (200) not null,
    dia_chi varchar (200) not null
);

create table nha_cung_cap_sdt(
    ma_nha_cung_cap int not null,
    sdt varchar (15) not null,
    primary key (ma_nha_cung_cap, sdt),
    foreign key (ma_nha_cung_cap) references nha_cung_cap (ma_nha_cung_cap)
);

create table chi_tiet_phieu_xuat(
    so_phieu_xuat int not null,
    ma_vat_tu int not null,
    d_g_xuat decimal (10, 2),
    so_luong_xuat int not null,
    primary key (so_phieu_xuat, ma_vat_tu),
    foreign key (so_phieu_xuat) references phieu_xuat (so_phieu_xuat),
    foreign key (ma_vat_tu) references vat_tu (ma_vat_tu)
);

create table chi_tiet_phieu_nhap(
    ma_vat_tu int not null,
    so_phieu_nhap int not null,
    d_g_nhap decimal (10, 2),
    so_luong_nhap int not null,
    primary key (ma_vat_tu, so_phieu_nhap),
    foreign key (so_phieu_nhap) references phieu_nhap (so_phieu_nhap),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table chi_tiet_don_dat_hang(
    ma_vat_tu int not null,
    so_don_hang int not null,
    primary key (ma_vat_tu, so_don_hang),
    foreign key (so_don_hang) references don_dat_hang(so_don_hang),
    foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table cung_cap(
    ma_nha_cung_cap int not null,
    so_don_hang int not null,
    primary key (ma_nha_cung_cap, so_don_hang),
    foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap),
    foreign key (so_don_hang) references don_dat_hang(so_don_hang)
);
