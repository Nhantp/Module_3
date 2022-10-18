create database ss02_bt_ban_hang;
use ss02_bt_ban_hang;
create table Customer(
	cID int primary key not null unique,
    cName varchar(20) not null,
    cAge int
);

create table Order1(
	oID int primary key not null  unique,
    cID int,
    oDate datetime,
    oTotalPrice int,
    foreign key (cID) references Customer(cID)
);
drop table Order1;
describe Order1;

create table product(
	pID int primary key not null unique,
    pName varchar(20),
    pPrice int 
);

create table OrderDetail(
	oID int,
    pID int,
    odQTY varchar(20),
    primary key(oID,pID),
    foreign key (oID) references order1(oID),
    foreign key (pID) references product(pID)
);
drop table OrderDetail;
describe OrderDetail;


