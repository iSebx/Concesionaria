
-----------  BASE DE DATOS -----------
Create DataBase DBConcesionaria;
go

use DBConcesionaria;
go

---------- TABLAS -----------
-- PROPIETARIOS --
if Exists (Select * From sysobjects Where Type = 'U' and Name = 'Propietarios')
	drop table Propietarios;

Create Table Propietarios(
	PropID int Primary Key Identity(1,1) NOT NULL,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	DNI varchar(50) NOT NULL,
	Telefono varchar(50) NOT NULL,
	Mail varchar(200) NULL,
	Direccion varchar(100) NOT NULL
)

-- MARCAS --
if Exists (Select * From sysobjects Where Type = 'U' and Name = 'Marcas')
	drop table Marcas;

Create table Marcas (
	MarcaID int Primary Key Identity (1,1) Not Null,
	Nombre varchar(50) Not Null
)
go

-- MODELOS --
if Exists (Select * From sysobjects Where Type = 'U' and Name = 'Modelos')
	drop table Modelos;

create table Modelos (
	ModID int Primary Key Identity (1,1) not null,
	Nombre varchar(150) not null,
	MarcaID int Foreign	Key References Marcas(MarcaID) not null
)
go

-- VEHICULOS --
if Exists (Select * From sysobjects Where Type = 'U' and Name = 'Vehiculos')
	drop table Vehiculos;

create table Vehiculos (
	VehiculoID int Primary Key Identity (1,1) not null,
	ModID int Foreign Key References Modelos(ModID) not null,
	Tipo Varchar(50) not null,
	Color Varchar(50) not null,
	KM int not null,
	PropID int Foreign Key References Propietarios(PropID) not null,
	Precio money not null,
)
go


---------- STORED PROCEDURES ----------
if Exists (Select * From sysobjects Where Type = 'P' and Name = 'Agregar_MarcaModelo')
	drop proc Agregar_MarcaModelo;
go

Create Proc Agregar_MarcaModelo (@MarcaNombre varchar(80), @ModeloNombre varchar(150)) as
begin
	insert into Marcas values (@MarcaNombre);
	if @ModeloNombre is not null
		begin
			declare @id int
			set @id = (select Max(Marcas.MarcaID) from Marcas)
			insert into Modelos values (@ModeloNombre, @id);
		end;
end
go


if Exists (Select * From sysobjects Where Type = 'P' and Name = 'Agregar_Modelo')
	drop proc Agregar_Modelo;
go

Create Proc Agregar_Modelo (@MarcaID int, @ModeloNombre varchar(150)) as
begin
	insert into Modelos (Nombre, MarcaID) values (@ModeloNombre, @MarcaID);
end