create table Drones (
	id int primary key identity(1,1),
	[Name] nvarchar(MAX),
	[Rating] decimal(2,1),
	[Price] decimal(6,2) DEFAULT 0,
	[Ex_Tax] decimal(6,2) DEFAULT 0,
	[Reward] smallint NULL DEFAULT 0,
	Brand_Id int foreign key references Brands(id),
	[Product_Code] nvarchar(50) UNIQUE,
	[In_Stock] bit DEFAULT 0,
	[Desc] ntext,
	Features_Id int foreign key references Features(id)
)

create table Brands (
	id int primary key identity(1,1),
	[Name] nvarchar(50)
)

create table Photos (
	id int primary key identity(1,1),
	[Path] varchar UNIQUE,
	Drones_Id int foreign key references Drones(id)
)

create table Features (
	id int primary key identity(1,1),
	[Features] ntext
)

create table Drones_Features (
	id int primary key identity(1,1),
	Features_Id int foreign key references Features(id),
	Drones_Id int foreign key references Drones(id)
)

create table Reviews (
	id int primary key identity(1,1),
	Rating decimal(2,1),
	Comment ntext
)

create table DronesReview (
	id int primary key identity(1,1),
	Drones_Id int foreign key references Drones(id),
	Reviews_Id int foreign key references Reviews(id)
)
