/*
Created: 01/01/2009
Modified: 01/01/2010
Model: MS SQL Server 2008
Database: MS SQL Server 2008
*/

USE MASTER 
GO 

-- Create Database section -------------------------------------------------

IF EXISTS(SELECT NAME FROM SYS.DATABASES WHERE NAME = 'vturistica') 
BEGIN 
	DROP DATABASE vturistica
END 
	CREATE DATABASE vturistica 
GO 

PRINT 'La base de datos: vturistica ha sido creada con exito. Gracias, j2l Team.' 
GO 

USE vturistica 
GO 

-- Create tables section -------------------------------------------------

-- Table Empresa

CREATE TABLE [Empresa]
(
 [IdEmpresa] Int IDENTITY(1,1),
 [Rif] Varchar(15) NOT NULL,
 [Nombre] Varchar(50) NOT NULL,
 [Ciudad] Varchar(15) NOT NULL,
 [Localidad] Varchar(50) NOT NULL,
 [Direccion] Varchar(200) NOT NULL,
 [Website] Varchar(50) NULL,
 [Mail] Varchar(50) NULL
)
go

-- Add keys for table Empresa

ALTER TABLE [Empresa] ADD CONSTRAINT [PK_IdEmpresa] PRIMARY KEY CLUSTERED ([IdEmpresa])
go

-- Table Telefono

CREATE TABLE [Telefono]
(
 [IdTelefono] Int IDENTITY(1,1),
 [Tipo] Varchar(20) NOT NULL,
 [CodigoInt] Int NOT NULL,
 [CodigoLoc] Int NOT NULL,
 [Numero] Int NOT NULL,
 [IdEmpresa] Int NULL,
 [IdContacto] Int NULL
)
go

-- Add keys for table Telefono

ALTER TABLE [Telefono] ADD CONSTRAINT [PK_IdTelefono] PRIMARY KEY CLUSTERED ([IdTelefono])
go

-- Table Categoria

CREATE TABLE [Categoria]
(
 [IdCategoria] Int IDENTITY(1,1),
 [Nombre] Varchar(50) NOT NULL,
 [Descripcion] Varchar(max) NULL,
 [FkIdCategoria] Int NULL,
 [Idioma] Varchar(10) NULL
)
go

-- Add keys for table Categoria

ALTER TABLE [Categoria] ADD CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED ([IdCategoria])
go

-- Table SubCategoria

CREATE TABLE [SubCategoria]
(
 [IdSubCategoria] Int IDENTITY(1,1),
 [Nombre] Varchar(50) NOT NULL,
 [Descripcion] Varchar(max) NULL,
 [IdCategoria] Int NULL,
 [FkIdSubCategoria] Int NULL,
 [Idioma] Varchar(10) NULL
)
go

-- Add keys for table SubCategoria

ALTER TABLE [SubCategoria] ADD CONSTRAINT [PK_SubCategoria] PRIMARY KEY CLUSTERED ([IdSubCategoria])
go

-- Table Publicacion

CREATE TABLE [Publicacion]
(
 [IdPublicacion] Int IDENTITY(1,1),
 [TCredito] Varchar(1) NULL,
 [TDebito] Varchar(1) NULL,
 [Transferencia] Varchar(1) NULL,
 [Efectivo] Varchar(1) NULL,
 [Reservacion] Varchar(1) NULL,
 [Latitud] Varchar(50) NULL,
 [Longitud] Varchar(50) NULL,
 [IdEmpresa] Int NOT NULL,
 [IdSubCategoria] Int NOT NULL
)
go

-- Add keys for table Publicacion

ALTER TABLE [Publicacion] ADD CONSTRAINT [PK_IdPublicacion] PRIMARY KEY CLUSTERED ([IdPublicacion])
go

-- Table Servicio

CREATE TABLE [Servicio]
(
 [IdServicio] Int IDENTITY(1,1),
 [Nombre] Varchar(50) NOT NULL,
 [Descripcion] Varchar(max) NULL,
 [IdPublicacion] Int NULL,
 [FkIdServicio] Int NULL,
 [Idioma] Varchar(10) NULL
)
go

-- Add keys for table Servicio

ALTER TABLE [Servicio] ADD CONSTRAINT [PK_IdServicio] PRIMARY KEY CLUSTERED ([IdServicio])
go

-- Table Precio

CREATE TABLE [Precio]
(
 [IdPrecio] Int IDENTITY(1,1),
 [Tipo] Varchar(15) NOT NULL,
 [Moneda] Varchar(20) NOT NULL,
 [PrecioMax] Int NOT NULL,
 [PrecioMin] Int NOT NULL,
 [IdPublicacion] Int NULL
)
go

-- Add keys for table Precio

ALTER TABLE [Precio] ADD CONSTRAINT [PK_Precio] PRIMARY KEY CLUSTERED ([IdPrecio])
go

-- Table Imagenes

CREATE TABLE [Imagenes]
(
 [IdImagen] Int IDENTITY(1,1),
 [DatosOriginal] Varbinary(max) NOT NULL,
 [DatosTrans] Varbinary(max) NOT NULL,
 [Tipo] Char(1) NOT NULL,
 [Descripcion] Varchar(max) NULL,
 [IdPublicacion] Int NULL,
 [IdPatrocinante] Int NULL
)
go

-- Add keys for table Imagenes

ALTER TABLE [Imagenes] ADD CONSTRAINT [PK_IdImagen] PRIMARY KEY CLUSTERED ([IdImagen])
go

-- Table Patrocinante

CREATE TABLE [Patrocinante]
(
 [IdPatrocinante] Int IDENTITY(1,1),
 [Nombre] Varchar(50) NOT NULL,
 [Descripcion] Varchar(max) NULL
)
go

-- Add keys for table Patrocinante

ALTER TABLE [Patrocinante] ADD CONSTRAINT [PK_IdPatrocinante] PRIMARY KEY CLUSTERED ([IdPatrocinante])
go

-- Table Blog

CREATE TABLE [Blog]
(
 [IdBlog] Int IDENTITY(1,1),
 [Fecha] Datetime NOT NULL,
 [Titulo] Varchar(100) NOT NULL,
 [Descripcion] Varchar(max) NOT NULL
)
go

-- Add keys for table Blog

ALTER TABLE [Blog] ADD CONSTRAINT [PK_IdBlog] PRIMARY KEY CLUSTERED ([IdBlog])
go

-- Table Contacto

CREATE TABLE [Contacto]
(
 [IdContacto] Int IDENTITY(1,1),
 [Nombre] Varchar(100) NOT NULL,
 [Tipo] Varchar(20) NOT NULL,
 [Cargo] Varchar(50) NULL,
 [Mail] Varchar(50) NULL,
 [IdEmpresa] Int NULL,
 [IdPatrocinante] Int NULL
)
go

-- Add keys for table Contacto

ALTER TABLE [Contacto] ADD CONSTRAINT [PK_IdContacto] PRIMARY KEY CLUSTERED ([IdContacto])
go

-- Table Idioma

CREATE TABLE [Idioma]
(
 [IdIdioma] Int IDENTITY(1,1),
 [IdPublicacion] Int NOT NULL,
 [Categoria] Varchar(max) NOT NULL,
 [Descripcion] Varchar(max) NOT NULL,
 [Notas] Varchar(max) NULL,
 [ProcesosEcologicos] Varchar(max) NULL
)
go

-- Add keys for table Idioma

ALTER TABLE [Idioma] ADD CONSTRAINT [PKIdIdioma] PRIMARY KEY CLUSTERED ([IdIdioma])
go

-- Table CarpetaViajera

CREATE TABLE [CarpetaViajera]
(
 [IdUsuario] Varchar(100) NOT NULL,
 [IdPublicacion] Int NOT NULL
)
go

-- Add keys for table CarpetaViajera

ALTER TABLE [CarpetaViajera] ADD CONSTRAINT [PKCarpetaViajera] PRIMARY KEY ([IdUsuario],[IdPublicacion])
go

-- Create relationships section ------------------------------------------------- 

ALTER TABLE [Publicacion] ADD CONSTRAINT [PK_EmpresaPublicacion] FOREIGN KEY ([IdEmpresa]) REFERENCES [Empresa] ([IdEmpresa])
go

ALTER TABLE [Publicacion] ADD CONSTRAINT [PK_SubCategoriaPublicacion] FOREIGN KEY ([IdSubCategoria]) REFERENCES [SubCategoria] ([IdSubCategoria])
go

ALTER TABLE [SubCategoria] ADD CONSTRAINT [FK_IdCategoria] FOREIGN KEY ([IdCategoria]) REFERENCES [Categoria] ([IdCategoria])
go

ALTER TABLE [Precio] ADD CONSTRAINT [FK_PublicacionPrecio] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion])
go

ALTER TABLE [Imagenes] ADD CONSTRAINT [FK_PublicacionImagenes] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion])
go

ALTER TABLE [Imagenes] ADD CONSTRAINT [FK_ImagenesPatrocinante] FOREIGN KEY ([IdPatrocinante]) REFERENCES [Patrocinante] ([IdPatrocinante])
go

ALTER TABLE [Servicio] ADD CONSTRAINT [FK_PublicacionServicio] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion])
go

ALTER TABLE [Telefono] ADD CONSTRAINT [FK_EmpresaTelefono] FOREIGN KEY ([IdEmpresa]) REFERENCES [Empresa] ([IdEmpresa])
go

ALTER TABLE [Contacto] ADD CONSTRAINT [FK_EmpresaContacto] FOREIGN KEY ([IdEmpresa]) REFERENCES [Empresa] ([IdEmpresa])
go

ALTER TABLE [Telefono] ADD CONSTRAINT [FK_ContactoTelefono] FOREIGN KEY ([IdContacto]) REFERENCES [Contacto] ([IdContacto])
go

ALTER TABLE [Contacto] ADD CONSTRAINT [FK_PatrocinanteContacto] FOREIGN KEY ([IdPatrocinante]) REFERENCES [Patrocinante] ([IdPatrocinante])
go

ALTER TABLE [Idioma] ADD CONSTRAINT [FKIdiomaPublicacion] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion])
go

ALTER TABLE [CarpetaViajera] ADD CONSTRAINT [FKCarpetaViajeraPublicacion] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion]) NOT FOR REPLICATION
go



