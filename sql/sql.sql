USE [master]
GO
/****** Object:  Database [Website]    Script Date: 11/12/2023 4:06:08 PM ******/
CREATE DATABASE [Website]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Website', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Website.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Website_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Website_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Website] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Website].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Website] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Website] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Website] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Website] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Website] SET ARITHABORT OFF 
GO
ALTER DATABASE [Website] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Website] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Website] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Website] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Website] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Website] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Website] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Website] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Website] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Website] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Website] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Website] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Website] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Website] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Website] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Website] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Website] SET RECOVERY FULL 
GO
ALTER DATABASE [Website] SET  MULTI_USER 
GO
ALTER DATABASE [Website] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Website] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Website] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Website] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Website] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Website] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Website', N'ON'
GO
ALTER DATABASE [Website] SET QUERY_STORE = ON
GO
ALTER DATABASE [Website] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Website]
GO
/****** Object:  User [.]    Script Date: 11/12/2023 4:06:08 PM ******/
CREATE USER [.] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/12/2023 4:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[Avatar] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/12/2023 4:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Avatar] [nvarchar](100) NULL,
	[Price] [nvarchar](50) NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/12/2023 4:06:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (1, N'Nón', N'Thời trang', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (2, N'Túi Xách', N'Thời trang', NULL)
INSERT [dbo].[Category] ([Id], [Name], [Description], [Avatar]) VALUES (3, N'Đồng Hồ', N'Thời trang', NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Name], [Avatar], [Price], [CategoryId]) VALUES (3005, N'nón thoi trang', N'non1_20231112022931.png', N'202', 1)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [Price], [CategoryId]) VALUES (3006, N'non thoi trang1', N'non3_20231112023057.png', N'300', 1)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [Price], [CategoryId]) VALUES (3007, N'tui xach nu', N'tũiach1_20231112023640.png', N'500', 2)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [Price], [CategoryId]) VALUES (3008, N'Dong ho thoi trang', N'dongho2_20231112023722.png', N'1000', 3)
INSERT [dbo].[Product] ([Id], [Name], [Avatar], [Price], [CategoryId]) VALUES (3009, N'dong ho2', N'dongho1_20231112032442.jpg', N'3000', 3)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (1, N'Nhat', N'Truong', N'TruongNhat202@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Nhatt', N'Truongg', N'nhatruong123@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
INSERT [dbo].[Users] ([idUser], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'nhat', N'truongg', N'nhattruong1234@gmail.com', N'e10adc3949ba59abbe56e057f20f883e')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
USE [master]
GO
ALTER DATABASE [Website] SET  READ_WRITE 
GO
