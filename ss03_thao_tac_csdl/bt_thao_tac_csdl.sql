use ss02_bt_ban_hang;
insert into Customer 
values  (1, 'Minh Quan', 10),
		(2,'Ngoc Anh', 20),
        (3, 'Hong Ha', 50);
insert into Order1
values  (1,1,'2006-3-21',null),
		(2,2,'2006-3-23',null),
        (3,1,'2006-3-16',null);
insert into product
values  (1,'May giat',3),
		(2,'Tu lanh',5),
        (3, 'Dieu hoa', 7),
        (4,'Quat',1),
        (5,'Bep dien',2);
insert into OrderDetail
values  (1,1,3),
		(1,3,7),
        (1,4,2),
        (2,1,1),
        (3,1,8),
        (2,5,4),
        (2,3,3);

select o.oID , o.oDate, p.pPrice
from Order1 o join OrderDetail o1 on o.oID=o1.oID join product p on o1.pID=p.pID;

select c.cName as CustomerName, p.pName as produtName
from Customer c join Order1 o on c.cID=o.cID join OrderDetail od on o.oID=od.oID join product p on od.pID=p.pID;
	
select cName as Khach_chua_dat
from customer
where not exists(select *from order1
	where Customer.cID=Order1.cID);

select *from order1;

select o.oID,o.oDate ,sum(o1.odQTY * p.pPrice) as 'Tong hoa don'
from Order1 o join OrderDetail o1 on o.oID=o1.oID join Product p on o1.pID=p.pID
group by oID;

		
		
