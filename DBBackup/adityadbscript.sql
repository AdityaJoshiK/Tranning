USE [master]
GO
/****** Object:  Database [AdityaPractice]    Script Date: 10-Nov-23 6:42:27 PM ******/
CREATE DATABASE [AdityaPractice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AdityaPractice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdityaPractice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AdityaPractice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\AdityaPractice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AdityaPractice] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AdityaPractice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AdityaPractice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AdityaPractice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AdityaPractice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AdityaPractice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AdityaPractice] SET ARITHABORT OFF 
GO
ALTER DATABASE [AdityaPractice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AdityaPractice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AdityaPractice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AdityaPractice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AdityaPractice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AdityaPractice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AdityaPractice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AdityaPractice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AdityaPractice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AdityaPractice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AdityaPractice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AdityaPractice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AdityaPractice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AdityaPractice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AdityaPractice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AdityaPractice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AdityaPractice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AdityaPractice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AdityaPractice] SET  MULTI_USER 
GO
ALTER DATABASE [AdityaPractice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AdityaPractice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AdityaPractice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AdityaPractice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AdityaPractice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AdityaPractice] SET QUERY_STORE = OFF
GO
USE [AdityaPractice]
GO
/****** Object:  Table [dbo].[BORROW]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BORROW](
	[LOANNO] [int] NULL,
	[CNAME] [varchar](50) NULL,
	[BNAME] [varchar](50) NULL,
	[AMOUNT] [varchar](50) NULL,
	[PHONE] [varchar](50) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRANCH]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH](
	[BNAME] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL,
	[NUMBER] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[ID] [int] NULL,
	[CNAME] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEPOSIT]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEPOSIT](
	[ACTNO] [int] NULL,
	[CNAME] [varchar](50) NULL,
	[BNAME] [varchar](50) NULL,
	[AMOUNT] [decimal](8, 2) NULL,
	[ADATE] [datetime] NULL,
	[NEwamount] [decimal](8, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[DepartmentID] [int] NULL,
	[DateOfBirth] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MANAGER]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MANAGER](
	[ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[CITY] [varchar](50) NULL,
	[STATE] [varchar](50) NULL,
	[COUNTRY] [varchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BORROW] ([LOANNO], [CNAME], [BNAME], [AMOUNT], [PHONE], [Date]) VALUES (1, N'John Doe', N'HDFC Bank', N'10000', N'9876543210', CAST(N'2023-11-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BORROW] ([LOANNO], [CNAME], [BNAME], [AMOUNT], [PHONE], [Date]) VALUES (2, N'Jane Doe', N'ICICI Bank', N'20000', N'8765432109', CAST(N'2023-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[BORROW] ([LOANNO], [CNAME], [BNAME], [AMOUNT], [PHONE], [Date]) VALUES (3, N'Peter Parker', N'SBI Bank', N'30000', N'7654321087', CAST(N'2023-07-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BORROW] ([LOANNO], [CNAME], [BNAME], [AMOUNT], [PHONE], [Date]) VALUES (4, N'Mary Jane Watson', N'Axis Bank', N'40000', N'6543210765', CAST(N'2023-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[BORROW] ([LOANNO], [CNAME], [BNAME], [AMOUNT], [PHONE], [Date]) VALUES (5, N'Bruce Wayne', N'Kotak Mahindra Bank', N'50000', N'5432106543', CAST(N'2023-11-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[BRANCH] ([BNAME], [CITY], [STATE], [COUNTRY], [NUMBER]) VALUES (N'HDFC Bank', N'Mumbai', N'Maharashtra', N'India', N'1234567890')
INSERT [dbo].[BRANCH] ([BNAME], [CITY], [STATE], [COUNTRY], [NUMBER]) VALUES (N'ICICI Bank', N'Delhi', N'Delhi', N'India', N'9876543210')
INSERT [dbo].[BRANCH] ([BNAME], [CITY], [STATE], [COUNTRY], [NUMBER]) VALUES (N'SBI Bank', N'Chennai', N'Tamil Nadu', N'India', N'0987654321')
INSERT [dbo].[BRANCH] ([BNAME], [CITY], [STATE], [COUNTRY], [NUMBER]) VALUES (N'Axis Bank', N'Kolkata', N'West Bengal', N'India', N'1098765432')
INSERT [dbo].[BRANCH] ([BNAME], [CITY], [STATE], [COUNTRY], [NUMBER]) VALUES (N'Kotak Mahindra Bank', N'Bangalore', N'Karnataka', N'India', N'2109876543')
GO
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (1, N'John Doe', N'Mumbai', N'Maharashtra', N'India')
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (2, N'Jane Doe', N'Delhi', N'Delhi', N'India')
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (3, N'Peter Parker', N'Chennai', N'Tamil Nadu', N'India')
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (4, N'Mary Jane Watson', N'Kolkata', N'West Bengal', N'India')
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (5, N'Bruce Wayne', N'Bangalore', N'Karnataka', N'India')
INSERT [dbo].[CUSTOMERS] ([ID], [CNAME], [CITY], [STATE], [COUNTRY]) VALUES (6, N'Aditya', N'Rajkot', N'Gujarat', N'India')
GO
INSERT [dbo].[Department] ([Id], [name]) VALUES (1, N'IT')
INSERT [dbo].[Department] ([Id], [name]) VALUES (2, N'HR')
GO
INSERT [dbo].[DEPOSIT] ([ACTNO], [CNAME], [BNAME], [AMOUNT], [ADATE], [NEwamount]) VALUES (1, N'John Doe', N'HDFC Bank', CAST(20000.00 AS Decimal(8, 2)), CAST(N'2023-11-09T18:12:30.000' AS DateTime), CAST(10000.00 AS Decimal(8, 2)))
INSERT [dbo].[DEPOSIT] ([ACTNO], [CNAME], [BNAME], [AMOUNT], [ADATE], [NEwamount]) VALUES (2, N'Jane Doe', N'ICICI Bank', CAST(30000.00 AS Decimal(8, 2)), CAST(N'2023-11-09T18:12:30.000' AS DateTime), CAST(20000.00 AS Decimal(8, 2)))
INSERT [dbo].[DEPOSIT] ([ACTNO], [CNAME], [BNAME], [AMOUNT], [ADATE], [NEwamount]) VALUES (3, N'Peter Parker', N'SBI Bank', CAST(45000.00 AS Decimal(8, 2)), CAST(N'2023-11-09T18:12:30.000' AS DateTime), CAST(30000.00 AS Decimal(8, 2)))
INSERT [dbo].[DEPOSIT] ([ACTNO], [CNAME], [BNAME], [AMOUNT], [ADATE], [NEwamount]) VALUES (4, N'Mary Jane Watson', N'Axis Bank', CAST(68000.00 AS Decimal(8, 2)), CAST(N'2023-11-09T18:12:30.000' AS DateTime), CAST(40000.00 AS Decimal(8, 2)))
INSERT [dbo].[DEPOSIT] ([ACTNO], [CNAME], [BNAME], [AMOUNT], [ADATE], [NEwamount]) VALUES (5, N'Bruce Wayne', N'Kotak Mahindra Bank', CAST(71000.00 AS Decimal(8, 2)), CAST(N'2023-11-09T18:12:30.000' AS DateTime), CAST(50000.00 AS Decimal(8, 2)))
GO
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Gender], [City], [DepartmentID], [DateOfBirth]) VALUES (1, N'A', N'M', N'Rajkot', 1, CAST(N'2002-10-01T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Gender], [City], [DepartmentID], [DateOfBirth]) VALUES (2, N'B', N'M', N'Surat', 2, CAST(N'2003-07-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Employee] ([EmployeeID], [Name], [Gender], [City], [DepartmentID], [DateOfBirth]) VALUES (3, N'C', N'F', N'Amd', 1, CAST(N'2010-10-10T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[MANAGER] ([ID], [NAME], [CITY], [STATE], [COUNTRY]) VALUES (NULL, N'Aditya', N'Rajkot', N'Gujarat', N'India')
INSERT [dbo].[MANAGER] ([ID], [NAME], [CITY], [STATE], [COUNTRY]) VALUES (NULL, N'John Doe', N'Mumbai', N'Maharashtra', N'India')
INSERT [dbo].[MANAGER] ([ID], [NAME], [CITY], [STATE], [COUNTRY]) VALUES (NULL, N'Jane Doe', N'Delhi', N'Delhi', N'India')
INSERT [dbo].[MANAGER] ([ID], [NAME], [CITY], [STATE], [COUNTRY]) VALUES (NULL, N'Peter Parker', N'Chennai', N'Tamil Nadu', N'India')
INSERT [dbo].[MANAGER] ([ID], [NAME], [CITY], [STATE], [COUNTRY]) VALUES (NULL, N'Mary Jane Watson', N'Kolkata', N'West Bengal', N'India')
GO
/****** Object:  StoredProcedure [dbo].[spGetAllEmployees]    Script Date: 10-Nov-23 6:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[spGetAllEmployees]
as
Begin
 Select EmployeeID, Name, Gender, City, DateOfBirth
 from Employee
End
GO
USE [master]
GO
ALTER DATABASE [AdityaPractice] SET  READ_WRITE 
GO
