create database PC;

use PC;

create table Brands(
Id int primary key identity not null,
[Name] varchar(30) not null,
[Rate] decimal(2,1) check(Rate >= 0 and Rate <= 5)
);

select * from Brands

insert into Brands([Name], [Rate])
values('Apple', '4.7'),
('ASUS', '5.0'),
('MSI', '4.2'),
('HP', '3.8'),
('Acer', '3.5')


create table Computers(
Id int primary key identity,
[Model] varchar(30) unique,
[Price] decimal(6,2) check(Price >= 0),
[RelaseDate] datetime default getdate(),
Brands_Id int foreign key references Brands(Id) 
);

select * from Computers

alter table Computers
add Brands_Id int foreign key references Brands(Id) 

insert into Computers([Model],[Price],Brands_Id)
values('Macbook', 3249.99,1),
('ROG',2500.99,2),
('Katana',4199.99,3),
('Pavilion', 2029.99,4),
('Nitro', 2899.99,5)

delete from Computers

SELECT c.*, b.[Name] AS Brand, b.[Rate]
FROM Computers c
JOIN Brands b ON c.Brands_Id = b.Id;


create table RAMs(
Id int primary key identity,
[Memory] int not null
);

select * from RAMs

insert into RAMs([Memory])
values(16),
(32),
(24),
(8),
(12)


create table GPUs(
Id int primary key identity,
[Name] varchar(30) unique,
[Memory] int not null,
Brands_Id int foreign key references Brands(Id) 
);

select * from GPUs

alter table GPUs
add Brands_Id int foreign key references Brands(Id) 

insert into GPUs([Name],[Memory],Brands_Id)
values('M2pro',2,1),
('RTX 3060', 6,2),
('RTX 2070', 4,3),
('Intel Iris', 1,4),
('Radeon', 2,5)

delete from GPUs

SELECT g.*, b.[Name] AS Brand, b.[Rate]
FROM GPUs g
JOIN Brands b ON .Brands_Id = b.Id;


SELECT g.*, b.[Name] AS Brand, b.[Rate]
FROM GPUs g
JOIN Brands b ON g.Brands_Id = b.Id
WHERE b.[Rate] > 4;


