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
 [Nombre] Varchar(100) NOT NULL,
 [Direccion] Varchar(max) NOT NULL,
 [Pais] Varchar(100) NULL,
 [Estado] Varchar(100) NULL,
 [Ciudad] Varchar(100) NULL,
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
 [FkIdServicio] Int NULL,
 [Idioma] Varchar(10) NULL
)
go

-- Add keys for table Servicio

ALTER TABLE [Servicio] ADD CONSTRAINT [PK_IdServicio] PRIMARY KEY CLUSTERED ([IdServicio])
go

-- Table PublicacionServicio

CREATE TABLE [PublicacionServicio]
(
 [IdServicio] Int NOT NULL,
 [IdPublicacion] Int NOT NULL
)
go

-- Add keys for table PublicacionServicio

ALTER TABLE [PublicacionServicio] ADD CONSTRAINT [PK_IdPublicacionServicio] PRIMARY KEY ([IdServicio],[IdPublicacion])
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
 [Link] Varchar(max) NULL,
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
 [Tipo] Varchar(1) NOT NULL,
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

ALTER TABLE [PublicacionServicio] ADD CONSTRAINT [FK_PublicacionServicio] FOREIGN KEY ([IdPublicacion]) REFERENCES [Publicacion] ([IdPublicacion])
go

ALTER TABLE [PublicacionServicio] ADD CONSTRAINT [FK_PublicacionServicio2] FOREIGN KEY ([IdServicio]) REFERENCES [Servicio] ([IdServicio])
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

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Lugar](
	[IdLugar] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
	[FkLugar] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Lugar] ON
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (1, N'Venezuela', N'Pais', NULL)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (2, N'Distrito Federal', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (3, N'Amazonas', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (4, N'Anzoátegui', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (5, N'Apure', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (6, N'Aragua', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (7, N'Barinas', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (8, N'Bolívar', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (9, N'Puerto Ayacucho', N'Localidad', 3)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (10, N'San Fernando de Atabapo', N'Localidad', 3)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (11, N'Maroa', N'Localidad', 3)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (12, N'San Carlos de Rio Negro', N'Localidad', 3)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (13, N'San juan de Manapiare', N'Localidad', 3)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (14, N'Caracas', N'Localidad', 2)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (15, N'Barcelona', N'Localidad', 4)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (16, N'San Fernando de Apure', N'Localidad', 5)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (17, N'Maracay', N'Localidad', 6)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (18, N'Barinas', N'Localidad', 7)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (19, N'Ciudad Bolívar', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (20, N'Ciudad Guayana', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (21, N'Puerto Ordaz', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (22, N'San Felix', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (23, N'Upata', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (24, N'Guasipati', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (25, N'El callao', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (26, N'Tumeremo', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (27, N'El Dorado', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (28, N'Santa Elena de Uairen', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (29, N'El Pauji', N'Localidad', 8)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (30, N'Carabobo', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (31, N'Valencia', N'Localidad', 30)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (32, N'Cojedes', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (33, N'San Carlos', N'Localidad', 32)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (34, N'Delta Amacuro', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (35, N'Tucupita', N'Localidad', 34)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (36, N'Curiapo', N'Localidad', 34)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (37, N'Pedernales', N'Localidad', 34)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (38, N'Falcón', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (39, N'Coro', N'Localidad', 38)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (40, N'Guárico', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (41, N'San Juan de Los Morros', N'Localidad', 40)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (42, N'Lara', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (43, N'Barquisimeto', N'Localidad', 42)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (44, N'Mérida', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (45, N'Mérida', N'Localidad', 44)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (46, N'Miranda', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (47, N'Los Teques', N'Localidad', 46)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (48, N'Monagas', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (49, N'Maturín', N'Localidad', 48)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (50, N'Nueva Esparta', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (51, N'La Asunción Isla de Margarita', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (52, N'Porlamar', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (53, N'Pampatar', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (54, N'Juan Griego', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (55, N'Santa Ana', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (56, N'Coche', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (57, N'Cubagua', N'Localidad', 50)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (58, N'Portuguesa', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (59, N'Guanare', N'Localidad', 58)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (60, N'Sucre', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (61, N'Cumaná', N'Localidad', 60)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (62, N'Táchira', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (63, N'San Cristóbal', N'Localidad', 62)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (64, N'Trujillo', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (65, N'Trujillo', N'Localidad', 64)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (66, N'Vargas', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (67, N'Felipe', N'Localidad', 66)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (68, N'Yaracuy', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (69, N'San Felipe', N'Localidad', 68)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (70, N'Zulia', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (71, N'Maracaibo', N'Localidad', 70)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (72, N'Dependencias Federales', N'Estado', 1)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (73, N'Archipiélago Los Monjes', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (74, N'Archipiélago Las Aves', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (75, N'Archipiélago Los Roques', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (76, N'Isla Los Hermanos', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (77, N'Isla Los Frailes', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (78, N'Isla Aves', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (79, N'Isla La Blanquilla', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (80, N'Isla Los Testigos', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (81, N'Isla La Orchila', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (87, N'Isla La Tortuga', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (83, N'Isla La Sola ', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (88, N'Isla de Patos', N'Localidad', 72)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (85, N'4', N'4', 4)
INSERT [dbo].[Lugar] ([IdLugar], [Nombre], [Tipo], [FkLugar]) VALUES (86, N'Clarines', N'Localidad', 4)
SET IDENTITY_INSERT [dbo].[Lugar] OFF
/****** Object:  Default [DF_Lugar_Tipo]    Script Date: 05/11/2011 11:39:10 ******/
ALTER TABLE [dbo].[Lugar] ADD  CONSTRAINT [DF_Lugar_Tipo]  DEFAULT ('Ciudad''Pais''Estado') FOR [Tipo]
GO

