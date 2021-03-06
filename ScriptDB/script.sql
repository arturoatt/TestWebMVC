USE [master]
GO
/****** Object:  Database [TestWebMVC]    Script Date: 17/08/2021 11:03:38 p. m. ******/
CREATE DATABASE [TestWebMVC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestWebMVC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestWebMVC.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TestWebMVC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TestWebMVC_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TestWebMVC] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestWebMVC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestWebMVC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestWebMVC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestWebMVC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestWebMVC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestWebMVC] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestWebMVC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestWebMVC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestWebMVC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestWebMVC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestWebMVC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestWebMVC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestWebMVC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestWebMVC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestWebMVC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestWebMVC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestWebMVC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestWebMVC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestWebMVC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestWebMVC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestWebMVC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestWebMVC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestWebMVC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestWebMVC] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TestWebMVC] SET  MULTI_USER 
GO
ALTER DATABASE [TestWebMVC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestWebMVC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestWebMVC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestWebMVC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TestWebMVC] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TestWebMVC] SET QUERY_STORE = OFF
GO
USE [TestWebMVC]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 17/08/2021 11:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[Active] [bit] NOT NULL,
	[RegisterDate] [smalldatetime] NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityRole]    Script Date: 17/08/2021 11:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityRole](
	[ActivityId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 17/08/2021 11:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[Active] [bit] NOT NULL,
	[RegisterDate] [smalldatetime] NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 17/08/2021 11:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Exp] [varchar](8) NOT NULL,
	[Alias] [varchar](40) NOT NULL,
	[Name] [varchar](120) NOT NULL,
	[Active] [bit] NOT NULL,
	[RegistreDate] [smalldatetime] NOT NULL,
	[UpdateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 17/08/2021 11:03:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Activity] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (1, N'Administrar Usuarios ', N'Permite Crear, actualizar, eliminar usuarios', 1, CAST(N'2017-08-21T00:00:00' AS SmallDateTime), CAST(N'2017-08-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Activity] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (2, N'Consulta', N'Permite realizar consulta de catálogos', 1, CAST(N'2017-08-21T00:00:00' AS SmallDateTime), CAST(N'2017-08-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Activity] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (3, N'Generar reporte de 
Usuarios. ', N'Permite generar reportes para impresión', 1, CAST(N'2017-08-21T00:00:00' AS SmallDateTime), CAST(N'2017-08-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[ActivityRole] ([ActivityId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[ActivityRole] ([ActivityId], [RoleId]) VALUES (2, 3)
INSERT [dbo].[ActivityRole] ([ActivityId], [RoleId]) VALUES (3, 2)
INSERT [dbo].[Role] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (1, N'Administrador', N'Administración de Aplicación', 1, CAST(N'2021-08-17T00:00:00' AS SmallDateTime), CAST(N'2021-08-17T00:00:00' AS SmallDateTime))
INSERT [dbo].[Role] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (2, N'Impresor', N'Impresor', 1, CAST(N'2017-08-21T00:00:00' AS SmallDateTime), CAST(N'2017-08-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[Role] ([Id], [Name], [Description], [Active], [RegisterDate], [UpdateDate]) VALUES (3, N'Consulta', N'Puede ver consultas del sistema', 1, CAST(N'2017-08-21T00:00:00' AS SmallDateTime), CAST(N'2017-08-21T00:00:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (1, N'Exp001', N'Rafa', N'Rafael Jimenez Herrera', 1, CAST(N'2021-08-17T20:46:00' AS SmallDateTime), CAST(N'2021-08-17T20:46:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (2, N'Exp002', N'Hila', N'Hilario Ponce de Leon', 1, CAST(N'2021-08-17T22:21:00' AS SmallDateTime), CAST(N'2021-08-17T22:21:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (3, N'Exp003', N'Geli', N'Felipe Lopez Machuca ', 1, CAST(N'2021-08-17T22:21:00' AS SmallDateTime), CAST(N'2021-08-17T22:21:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (4, N'Exp004', N'Lau', N'Laura Leon', 1, CAST(N'2021-08-17T22:22:00' AS SmallDateTime), CAST(N'2021-08-17T22:22:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (5, N'Exp005', N'Paca', N'Paquita Barrios Hernandez ', 0, CAST(N'2021-08-17T22:22:00' AS SmallDateTime), CAST(N'2021-08-17T22:22:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (6, N'Exp006', N'Arturo', N'Arturo terceros', 1, CAST(N'2021-08-17T22:23:00' AS SmallDateTime), CAST(N'2021-08-17T22:23:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (7, N'Exp007', N'Carmen', N'Carmen Licea', 1, CAST(N'2021-08-17T22:23:00' AS SmallDateTime), CAST(N'2021-08-17T22:23:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (8, N'Exp008', N'Ruben', N'Rubén Hernandez', 0, CAST(N'2021-08-17T22:24:00' AS SmallDateTime), CAST(N'2021-08-17T22:24:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (9, N'Exp009', N'Jordi', N'Jordi Rosado', 0, CAST(N'2021-08-17T22:24:00' AS SmallDateTime), CAST(N'2021-08-17T22:24:00' AS SmallDateTime))
INSERT [dbo].[User] ([Id], [Exp], [Alias], [Name], [Active], [RegistreDate], [UpdateDate]) VALUES (10, N'Exp010', N'Calderon', N'Andres Calderon Peña ', 0, CAST(N'2021-08-17T22:24:00' AS SmallDateTime), CAST(N'2021-08-17T22:24:00' AS SmallDateTime))
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (1, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (2, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (3, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (4, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (5, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (7, 3)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (8, 2)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (9, 1)
INSERT [dbo].[UserRole] ([UserId], [RoleId]) VALUES (10, 3)
ALTER TABLE [dbo].[ActivityRole]  WITH CHECK ADD  CONSTRAINT [FK_ActivityRole_Activity] FOREIGN KEY([ActivityId])
REFERENCES [dbo].[Activity] ([Id])
GO
ALTER TABLE [dbo].[ActivityRole] CHECK CONSTRAINT [FK_ActivityRole_Activity]
GO
ALTER TABLE [dbo].[ActivityRole]  WITH CHECK ADD  CONSTRAINT [FK_ActivityRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[ActivityRole] CHECK CONSTRAINT [FK_ActivityRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
USE [master]
GO
ALTER DATABASE [TestWebMVC] SET  READ_WRITE 
GO