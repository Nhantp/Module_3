create database ss02_bt_chuyen_erd_sang_qhe;
use ss02_bt_chuyen_erd_sang_qhe;
create table PhieuXuat(
	SoPX int primary key not null auto_increment,
    NgayXuat date
);
describe PhieuXuat;
drop table PhieuXuat;
create table ChiTietPhieuXuat(
	SoPX int ,
    MaVTU int ,
    DGXuat int,
    SLXuat int,
    primary key(SoPX, MaVTU),
	foreign key (SoPX) references PhieuXuat(SoPX) 
);
drop table ChiTietPhieuXuat;

create table VatTu(
	MaVTU int primary key not null auto_increment,
    TenVTU varchar(20),
    SoPX int,
    SoPN int
);
create table ChiTietPhieuNhap(
	MaVTU int,
    SoPN int,
    DGNhap int,
    SLNhap int,
    primary key(MaVTU, SoPN),
    foreign key (MaVTU) references VatTu(MaVTU),
    foreign key (SoPN) references ChiTietPhieuNhap(SoPN)
);
create table PhieuNhap(
	SoPN int primary key not null auto_increment,
    NgayNhap date
);
create table ChiTietDonHang(
	SoDH int,
    MaVTU int,
    primary key(SoDH, MaVTU),
    foreign key (SoDH) references DonDH(SoDH),
    foreign key (MaVTU) references VatTu(MaVTU)
);
create table DonDH (
	SoDH int primary key not null auto_increment,
    NgayDH date,
    MaNCC int,
    foreign key (MaNCC) references NhaCC(MaNCC)
);
create table NhaCC(
	MaNCC int primary key not null auto_increment,
    TenNCC varchar(20),
    DiaChi varchar(20),
    SDT varchar(10)
);
insert into phieuxuat value(1,'2022-10-10');
insert into phieuxuat value(2,"2022-10-11");
insert into phieuxuat value(3,"2022-10-12");
insert into phieuxuat value(4,"2022-10-13");
insert into phieuxuat value(5,"2022-10-14");
insert into phieuxuat value(6,"2022-10-15");
select *from phieuxuat;

insert into chitietphieuxuat value(1,1,200,10);
insert into chitietphieuxuat value(2,2,200,20);
insert into chitietphieuxuat value(3,3,300,30);
insert into chitietphieuxuat value(4,4,400,40);
insert into chitietphieuxuat value(5,5,500,50);
insert into chitietphieuxuat value(6,6,600,60);
select *from chitietphieuxuat;

insert into phieunhap value(1,'2022-11-10');
insert into phieunhap value(2,'2022-11-11');
insert into phieunhap value(3,'2022-11-12');
insert into phieunhap value(4,'2022-11-13');
insert into phieunhap value(5,'2022-11-14');
insert into phieunhap value(6,'2022-11-15');
insert into phieunhap value(7,'2022-11-16');
select *from phieunhap;

insert into vatTu value(1,'a',1,1);
insert into vatTu value(2,'a',2,2);
insert into vatTu value(3,'a',3,3);
insert into vatTu value(4,'a',4,4);
insert into vatTu value(5,'a',5,5);
insert into vatTu value(6,'a',6,6);
select *from vattu;
insert into chitietphieunhap value(1,1,100,10);
select *from chitietphieunhap;
