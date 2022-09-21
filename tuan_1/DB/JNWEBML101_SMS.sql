USE [master]
GO
CREATE DATABASE [DemoWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DemoWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DemoWeb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoWeb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DemoWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoWeb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DemoWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoWeb] SET  MULTI_USER 
GO
ALTER DATABASE [DemoWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoWeb] SET QUERY_STORE = OFF
GO
USE [DemoWeb]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [DemoWeb]
GO
/****** Object:  Table [dbo].[Airplane]    Script Date: 7-6-2018 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Airplane](
	[AirplaneID] [varchar](10) NOT NULL,
	[Model] [varchar](50) NULL,
	[CruiseSpeed] [float] NULL,
	[AirportID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AirplaneID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Airport]    Script Date: 7-6-2018 10:42:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Airport](
	[AirportID] [varchar](10) NOT NULL,
	[AirportName] [varchar](50) NOT NULL,
	[RunwaySize] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DemoWeb]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DemoWeb](
	[AirportID] [varchar](10) NOT NULL,
	[AirportName] [varchar](50) NOT NULL,
	[RunwaySize] [numeric](5, 3) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblDepartment]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblDepartment](
	[Dept_ID] [int] IDENTITY(1,1) NOT NULL,
	[Dept_Name] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblEmployee]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblEmployee](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Emp_Name] [varchar](50) NULL,
	[Gender] [bit] NULL,
	[Date_Of_Birth] [date] NULL,
	[Dept_ID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TblUser]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblUser](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Airplane]  WITH CHECK ADD FOREIGN KEY([AirportID])
REFERENCES [dbo].[Airport] ([AirportID])
GO
ALTER TABLE [dbo].[TblEmployee]  WITH CHECK ADD FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[TblDepartment] ([Dept_ID])
GO
/****** Object:  StoredProcedure [dbo].[usp_addAirplane]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_addAirplane]
@airplaneId VARCHAR(10),
@model VARCHAR(50),
@cruiseSpeed FLOAT,
@airportId VARCHAR(10)
AS
BEGIn
	INSERT INTO Airplane VALUES (@airplaneId, @model, @cruiseSpeed, @airportId)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addAirplanes]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_addAirplanes]
@airplaneId VARCHAR(10),
@model VARCHAR(50),
@cruiseSpeed FLOAT,
@airportId VARCHAR(10)
AS
BEGIN
	INSERT INTO Airplane VALUES (@airplaneId, @model, @cruiseSpeed, @airportId)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addAirports]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_addAirports]
@airportID VARCHAR(10),
@airportName VARCHAR(50),
@runwaySize FLOAT
AS
BEGIN
	INSERT INTO Airport VALUES(@airportID, @airportName, @runwaySize)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_addEmployee]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_addEmployee]
@empName VARCHAR(50),
@gender BIT,
@dateOfBirth DATE,
@deptID INT
AS
BEGIN
	INSERT INTO TblEmployee VALUES (@empName, @gender, @dateOfBirth, @deptID)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_deleteAirport]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_deleteAirport]
@airportId VARCHAR(10)
AS
BEGIN
	DELETE FROM Airplane WHERE AirportID = @airportId
	DELETE FROM Airport WHERE AirportID = @airportId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAirplaneByAirportId]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAirplaneByAirportId]
@airportId VARCHAR(10)
AS
BEGIN
	SELECT * FROM Airplane WHERE AirportID = @airportId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAirportById]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAirportById]
@airportId VARCHAR(10)
AS
BEGIN
	SELECT * FROM Airport WHERE AirportID = @airportId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAllAirport]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAllAirport]
AS
BEGIN
	SELECT * FROM Airport
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAllDepartment]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAllDepartment]
AS
BEGIN
	SELECT * FROM TblDepartment
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findAllEmployee]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findAllEmployee]
AS
BEGIN
	SELECT * FROM TblEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findUserByEmail]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_findUserByEmail]
@email VARCHAR(100)
AS
BEGIN
	SELECT * FROM TblUser WHERE Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[usp_findUserByUserName]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[usp_findUserByUserName]
@userName VARCHAR(50)
AS
BEGIN
	SELECT * FROM TblUser WHERE UserName = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[usp_getUserByUserName]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_getUserByUserName]
@userName VARCHAR(50)
AS
BEGIN
	SELECT * FROM TblUser WHERE UserName = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[usp_login]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_login]
@userName VARCHAR(50),
@password VARCHAR(50),
@numberRecord INT OUTPUT
AS
BEGIN
	SELECT @numberRecord = COUNT(*) FROM TblUser WHERE UserName = @userName AND Password = @password
END
GO
/****** Object:  StoredProcedure [dbo].[usp_registerUser]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_registerUser]
@firstName VARCHAR(50),
@lastName VARCHAR(50),
@email VARCHAR(100),
@userName VARCHAR(50),
@password VARCHAR(50)
AS
BEGIN
	INSERT INTO TblUser VALUES (@firstName, @lastName, @email, @userName, @password)
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateAirport]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_updateAirport]
@airportId VARCHAR(10),
@airportName VARCHAR(50),
@runwaySize FLOAT
AS
BEGIN
	UPDATE Airport SET AirportName = @airportName, RunwaySize = @runwaySize WHERE AirportID = @airportId
END
GO
/****** Object:  StoredProcedure [dbo].[usp_updateUserProfile]    Script Date: 7-6-2018 10:42:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_updateUserProfile]
@firstName VARCHAR(50),
@lastName VARCHAR(50),
@email VARCHAR(100),
@userName VARCHAR(50)
AS
BEGIN
	UPDATE TblUser SET FirstName = @firstName, LastName = @lastName, Email = @email WHERE UserName = @userName
END
GO
USE [master]
GO
ALTER DATABASE [DemoWeb] SET  READ_WRITE 
GO
