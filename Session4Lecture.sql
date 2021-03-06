USE [master]
GO
/****** Object:  Database [Session4Lecture]    Script Date: 2018-11-27 11:39:40 ******/
CREATE DATABASE [Session4Lecture]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Session4Lecture', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Session4Lecture.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Session4Lecture_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Session4Lecture_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Session4Lecture] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Session4Lecture].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Session4Lecture] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Session4Lecture] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Session4Lecture] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Session4Lecture] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Session4Lecture] SET ARITHABORT OFF 
GO
ALTER DATABASE [Session4Lecture] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Session4Lecture] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Session4Lecture] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Session4Lecture] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Session4Lecture] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Session4Lecture] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Session4Lecture] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Session4Lecture] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Session4Lecture] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Session4Lecture] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Session4Lecture] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Session4Lecture] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Session4Lecture] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Session4Lecture] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Session4Lecture] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Session4Lecture] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Session4Lecture] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Session4Lecture] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Session4Lecture] SET  MULTI_USER 
GO
ALTER DATABASE [Session4Lecture] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Session4Lecture] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Session4Lecture] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Session4Lecture] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Session4Lecture] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Session4Lecture] SET QUERY_STORE = OFF
GO
USE [Session4Lecture]
GO
/****** Object:  Table [dbo].[City]    Script Date: 2018-11-27 11:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Population] [decimal](18, 2) NOT NULL,
	[CountryID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2018-11-27 11:39:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[HeadOfState] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([ID], [Name], [Population], [CountryID]) VALUES (1, N'Stockholm', CAST(1.10 AS Decimal(18, 2)), 1)
INSERT [dbo].[City] ([ID], [Name], [Population], [CountryID]) VALUES (2, N'Gothenburg', CAST(0.60 AS Decimal(18, 2)), 1)
INSERT [dbo].[City] ([ID], [Name], [Population], [CountryID]) VALUES (3, N'Jönköping', CAST(0.15 AS Decimal(18, 2)), 1)
INSERT [dbo].[City] ([ID], [Name], [Population], [CountryID]) VALUES (4, N'New York', CAST(10.20 AS Decimal(18, 2)), 2)
INSERT [dbo].[City] ([ID], [Name], [Population], [CountryID]) VALUES (5, N'Budva', CAST(0.05 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([ID], [Name], [HeadOfState]) VALUES (1, N'Sweden', N'Stefan')
INSERT [dbo].[Country] ([ID], [Name], [HeadOfState]) VALUES (2, N'USA', N'Donald')
INSERT [dbo].[Country] ([ID], [Name], [HeadOfState]) VALUES (3, N'Montenegro', N'Milo')
SET IDENTITY_INSERT [dbo].[Country] OFF
USE [master]
GO
ALTER DATABASE [Session4Lecture] SET  READ_WRITE 
GO
