create database demo;
use demo;
create table Products(
	id int auto_increment primary key,
    productCode int,
    productName varchar(45),
    productPrice double,
    productAmount int,
    productDescription varchar(45),
    productStatus bit(1)
);
select *from products;
insert into products(productCode,productName,productPrice, productAmount, productDescription, productStatus)
values
(1,'banh',2000,3,'banh',1),
(3,'keo',4000,2,'keo',1),
(5,'kem',3000,5,'kem',0);
use demo;
create unique index idx_product 
on Products (productCode);
alter table products add index idx_products(productName, productPrice);
explain select *from products;

create view product_view as 
select productCode, productName, productPrice, productStatus from products;
select *from product_view;

update product_view
set productName='nuoc'
where productCode=1;
drop view product_view;

delimiter //
create procedure findAllProduct() 
begin 
select *from products;
end //
delimiter ;
drop procedure findAllProduct;
call findAllProduct();

delimiter //
drop procedure if exists addProduct;
create procedure addProduct(in productCode1 int,in productName1 varchar(45),in productPrice1 double,in productAmount1 int,in productDescription1 varchar(45),in productStatus1 bit(1))
begin
insert into Products (productCode,productName,productPrice,productAmount,productDescription,productStatus)
values(productCode1,productName1,productPrice1,productAmount1,productDescription1,productStatus1);
end //
delimiter ;

call addProduct(6,'dia',7000,9,'dia',0);

delimiter //
drop procedure if exists editProduct;
create procedure editProduct(in id_update int , in new_name varchar(45))
begin
update Products
set productName= new_name
where id=id_update;
end //
delimiter ;
call editProduct(1,'aa');
select *from products;

delimiter //
drop procedure if exists removeProduct;
create procedure removeProduct(in id_remove int )
begin
delete from Products
where id=id_remove;
end //
delimiter ;
call removeProduct(1);
select *from Products;