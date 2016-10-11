--******************************************************************************************************
--
--
--			NOTE TO USER!!!!!!!!!!!!!!!!!!!!!
--				
--			this script WILL DELETE the database and ALL
--				data in the database!!! :)
--
--			only run this script after the database data is recorded somewhere... 
--				and stuff :) 
--
--******************************************************************************************************
--******************************************************************************************************
use master
go
if db_id('JustForYou') is not null
	drop database JustForYou
go
create database JustForYou
go

use JustForYou
go

create table Users
(
	[UserID]				int				identity(1,1)			primary key,
	[UserFName]				varchar(40)		not null,
	[UserLName]				varchar(75)		not null,
	[UserEmail]				varchar(150)	not null,
	[UserPassword]			varchar(64)		not null,
	[UserEmailUpdates]		bit				not null,
	[UserAccess]			tinyint			not null
)
go

create table Category
(
	[CategoryID]			int				identity(1,1)			primary key,
	[CategoryName]			varchar(150)	not null
)

create table Products
(
	[ProductID]				int				identity(1,1)			primary key,
	[CategoryID]			int				not null				foreign key references Category(CategoryID),
	[ProductName]			varchar(500)	not null,
	[ProductDescription]	varchar(2000)	not null,
	[ProductImgPath]		varchar(1000)	not null,
	[ProductThumbPath]		varchar(1000)	not null,
	[ProductAltText]		varchar(500)	not null
)

create table Announcments
(
	[AnnouncmentID]				int				identity(1,1)			primary key,
	[AnnouncmentName]			varchar(500)	not null,
	[AnnouncmentDescription]	varchar(2000)	not null,
	[AnnouncmentExpireDate]		datetime		not null,
	[AnnouncmentDate]			datetime		not null
)