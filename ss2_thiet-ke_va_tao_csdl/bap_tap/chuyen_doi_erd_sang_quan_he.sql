create database quan_li_don_hang;
use quan_li_don_hang;

create table phieuxuat(
    soPX int not null primary key,
    ngayxuat date 
);

create table vattu(
    maVTU int not null primary key,
    tenVTU varchar (200) 
);

create table donDH(
    soDH int not null primary key,
    ngayDH date
);

create table phieunhap(
    soPN int not null primary key,
    ngaynhap date
);

create table nhaCC(
    maNCC int not null primary key,
    tenNCC varchar (200),
    diachi varchar (200)
);

create table nhaCC_sdt(
    maNCC int not null,
    sdt varchar (200) not null,
    primary key (maNCC, sdt),
    foreign key (maNCC) references nhaCC (maNCC)
);

create table chitietphiexuat(
    soPX int not null,
    maVTU int not null,
    DGXuat decimal (10, 2),
    SLXuat int,
    primary key (soPX, maVTU),
    foreign key (soPX) references phieuxuat (soPX),
    foreign key (maVTU) references vattu (maVTU)
);

create table chitietphieunhap(
    maVTU int not null,
    soPN int not null,
    DGNhap decimal (10, 2),
    SLNhap int,
    primary key (maVTU, soPN),
    foreign key (soPN) references phieunhap (soPN),
    foreign key (maVTU) references vattu(maVTU)
);

create table chitietdondathang(
    maVTU int not null,
    soDH int not null,
    primary key (maVTU, soDH),
    foreign key (soDH) references donDH(soDH),
    foreign key (maVTU) references vattu(maVTU)
);

create table cungcap(
    maNCC int not null,
    soDH int not null,
    primary key (maNCC, soDH),
    foreign key (maNCC) references nhaCC(maNCC),
    foreign key (soDH) references donDH(soDH)
);
