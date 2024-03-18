USE [master]
GO
/****** Object:  Database [DBQRT]    Script Date: 20-02-2024 15:34:21 ******/
CREATE DATABASE [DBQRT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBQRT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBQRT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBQRT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBQRT_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBQRT] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBQRT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBQRT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBQRT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBQRT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBQRT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBQRT] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBQRT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBQRT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBQRT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBQRT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBQRT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBQRT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBQRT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBQRT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBQRT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBQRT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBQRT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBQRT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBQRT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBQRT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBQRT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBQRT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBQRT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBQRT] SET RECOVERY FULL 
GO
ALTER DATABASE [DBQRT] SET  MULTI_USER 
GO
ALTER DATABASE [DBQRT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBQRT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBQRT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBQRT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBQRT] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBQRT] SET QUERY_STORE = OFF
GO
USE [DBQRT]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DBQRT]
GO
/****** Object:  User [QRTDBUser#2024]    Script Date: 20-02-2024 15:34:25 ******/
CREATE USER [QRTDBUser#2024] FOR LOGIN [QRTDBUser#2024] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [QRTDBUser#2024]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [QRTDBUser#2024]
GO
ALTER ROLE [db_datareader] ADD MEMBER [QRTDBUser#2024]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [QRTDBUser#2024]
GO
/****** Object:  UserDefinedFunction [dbo].[splitstring]    Script Date: 20-02-2024 15:34:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[splitstring]
(
    @String NVARCHAR(MAX),
    @Delimiter CHAR(1)
)
RETURNS @Result TABLE (Value NVARCHAR(MAX))
AS
BEGIN
    DECLARE @DelimiterPosition INT;

    WHILE CHARINDEX(@Delimiter, @String) > 0
    BEGIN
        SET @DelimiterPosition = CHARINDEX(@Delimiter, @String);
        INSERT INTO @Result (Value) VALUES (SUBSTRING(@String, 1, @DelimiterPosition - 1));
        SET @String = SUBSTRING(@String, @DelimiterPosition + 1, LEN(@String));
    END;

    IF LEN(@String) > 0
        INSERT INTO @Result (Value) VALUES (@String);

    RETURN;
END;
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[Gender] [varchar](10) NULL,
	[UserPassword] [nvarchar](max) NULL,
	[FirstName] [nvarchar](250) NULL,
	[LastName] [nvarchar](250) NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[isActive] [bit] NOT NULL,
	[ActiveSiteID] [uniqueidentifier] NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryIDP] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [nvarchar](max) NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CategoryImagePath] [nvarchar](max) NOT NULL,
	[isActive] [bit] NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CategoryMaster] PRIMARY KEY CLUSTERED 
(
	[CategoryIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CityMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CityMaster](
	[CityIDP] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[StateIDF] [int] NULL,
 CONSTRAINT [PK_CityMaster_1] PRIMARY KEY CLUSTERED 
(
	[CityIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyMaster](
	[CompanyIDP] [uniqueidentifier] NOT NULL,
	[CompanyTypeIDF] [uniqueidentifier] NULL,
	[CountryIDF] [int] NULL,
	[StateIDF] [int] NULL,
	[CityIDF] [int] NULL,
	[CompanyName] [nvarchar](250) NULL,
	[CompanyLogoPath] [nvarchar](max) NULL,
	[HQ_Pincode] [nvarchar](10) NULL,
	[HQ_Address] [nvarchar](500) NULL,
	[ContactEmail] [nvarchar](100) NULL,
	[ContactNumber] [nvarchar](20) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Password] [nvarchar](100) NULL,
	[CEOName] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[isActive] [bit] NULL,
	[GSTINNumber] [varchar](15) NULL,
	[Gender] [nvarchar](10) NULL,
 CONSTRAINT [PK__CompanyM__5ABCA54F8D1EAC01] PRIMARY KEY CLUSTERED 
(
	[CompanyIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyTypeMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyTypeMaster](
	[CompanyTypeIDP] [uniqueidentifier] NOT NULL,
	[CompanyType] [nvarchar](100) NOT NULL,
	[isActive] [bit] NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[CompanyTypeIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CountryIDP] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[CountryCode] [varchar](5) NULL,
 CONSTRAINT [PK_CountryMaster_1] PRIMARY KEY CLUSTERED 
(
	[CountryIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLogs](
	[LogId] [uniqueidentifier] NOT NULL,
	[ErrorMsg] [nvarchar](max) NULL,
	[StackTrace] [nvarchar](max) NULL,
	[EntryDate] [datetime] NULL,
	[UserID] [uniqueidentifier] NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackQuestionsMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackQuestionsMaster](
	[QuestionIDP] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[isActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_FeedbackQuestions Master] PRIMARY KEY CLUSTERED 
(
	[QuestionIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuMaster](
	[MenuItemIDP] [uniqueidentifier] NOT NULL,
	[CategoryIDF] [uniqueidentifier] NOT NULL,
	[SubCategoryIDF] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [nvarchar](max) NULL,
	[ItemName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[IsProductOfDay] [bit] NOT NULL,
	[IndexInCategory] [int] NULL,
	[ItemImagePath] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_MenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuItemIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModifierMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModifierMaster](
	[ModifierIDP] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [uniqueidentifier] NULL,
	[ModifierName] [nvarchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[isActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_ModifierMaster] PRIMARY KEY CLUSTERED 
(
	[ModifierIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderMaster](
	[OrderIDP] [uniqueidentifier] NOT NULL,
	[SeatIDF] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NOT NULL,
	[SiteIDF] [nvarchar](max) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[isModifierAdded] [bit] NOT NULL,
	[TotalAmount] [decimal](10, 2) NOT NULL,
	[ModifierAmount] [decimal](10, 2) NOT NULL,
	[Discount] [decimal](10, 2) NULL,
	[TaxAmount] [decimal](10, 2) NOT NULL,
	[OrderStatus] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_OrderMaster] PRIMARY KEY CLUSTERED 
(
	[OrderIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcErrorLog]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcErrorLog](
	[ExceptionID] [uniqueidentifier] NOT NULL,
	[EntryDateTime] [datetime] NOT NULL,
	[ProcedureName] [nvarchar](255) NOT NULL,
	[ErrorMessage] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ExceptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeatMappingMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeatMappingMaster](
	[SeatIDP] [uniqueidentifier] NOT NULL,
	[SiteIDF] [uniqueidentifier] NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SeatNumber] [nvarchar](20) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[Location] [nvarchar](50) NULL,
	[Seattype] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [uniqueidentifier] NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[QRCode] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SeatIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SitesMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SitesMaster](
	[SiteIDP] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NOT NULL,
	[CountryIDF] [int] NOT NULL,
	[StateIDF] [int] NOT NULL,
	[CityIDF] [int] NOT NULL,
	[SitePinCode] [nvarchar](20) NOT NULL,
	[SiteName] [nvarchar](250) NOT NULL,
	[SiteAddress] [nvarchar](500) NOT NULL,
	[SiteContactNumber] [nvarchar](15) NULL,
	[SiteContactEmail] [nvarchar](100) NULL,
	[IsActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SitesMaster] PRIMARY KEY CLUSTERED 
(
	[SiteIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateMaster](
	[StateIDP] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](50) NULL,
	[CountryIDF] [int] NULL,
 CONSTRAINT [PK_StateMaster_1] PRIMARY KEY CLUSTERED 
(
	[StateIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubCategoryMaster]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategoryMaster](
	[SubCategoryIDP] [uniqueidentifier] NOT NULL,
	[CategoryIDF] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NULL,
	[SiteIDF] [nvarchar](max) NULL,
	[SubCategoryName] [nvarchar](100) NOT NULL,
	[SubCategoryImagePath] [nvarchar](max) NULL,
	[isActive] [bit] NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_SubCategoryMaster] PRIMARY KEY CLUSTERED 
(
	[SubCategoryIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 20-02-2024 15:34:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 20-02-2024 15:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 20-02-2024 15:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 20-02-2024 15:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 20-02-2024 15:34:26 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 20-02-2024 15:34:26 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_CategoryIDP]  DEFAULT (newid()) FOR [CategoryIDP]
GO
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_CreatedBy]  DEFAULT (newid()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[CategoryMaster] ADD  CONSTRAINT [DF_CategoryMaster_UpdatedBy]  DEFAULT (newid()) FOR [UpdatedBy]
GO
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF__CompanyMa__Compa__75A278F5]  DEFAULT (newid()) FOR [CompanyIDP]
GO
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF__CompanyMa__Creat__76969D2E]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CompanyMaster] ADD  CONSTRAINT [DF__CompanyMa__isAct__7A672E12]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[CompanyTypeMaster] ADD  DEFAULT (newid()) FOR [CompanyTypeIDP]
GO
ALTER TABLE [dbo].[CompanyTypeMaster] ADD  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[CompanyTypeMaster] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  CONSTRAINT [DF_ExceptionLogs_LogId]  DEFAULT (newid()) FOR [LogId]
GO
ALTER TABLE [dbo].[ErrorLogs] ADD  CONSTRAINT [DF_ExceptionLogs_LogTime]  DEFAULT (getdate()) FOR [EntryDate]
GO
ALTER TABLE [dbo].[FeedbackQuestionsMaster] ADD  CONSTRAINT [DF_FeedbackQuestionsMaster_QuestionIDP]  DEFAULT (newid()) FOR [QuestionIDP]
GO
ALTER TABLE [dbo].[FeedbackQuestionsMaster] ADD  CONSTRAINT [DF_FeedbackQuestions Master_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[FeedbackQuestionsMaster] ADD  CONSTRAINT [DF_FeedbackQuestions Master_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_Table_1_MenuItemIdP]  DEFAULT (newid()) FOR [MenuItemIDP]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_IsProductOfDay]  DEFAULT ((0)) FOR [IsProductOfDay]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[MenuMaster] ADD  CONSTRAINT [DF_MenuMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ModifierMaster] ADD  CONSTRAINT [DF_Table_1_ModifierIdP]  DEFAULT (newid()) FOR [ModifierIDP]
GO
ALTER TABLE [dbo].[ModifierMaster] ADD  CONSTRAINT [DF_ModifierMaster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[ModifierMaster] ADD  CONSTRAINT [DF_ModifierMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_Table_1_OrderIdP]  DEFAULT (newid()) FOR [OrderIDP]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_OrderDate]  DEFAULT (getdate()) FOR [OrderDate]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_isModifierAdded]  DEFAULT ((0)) FOR [isModifierAdded]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_ModifierAmount]  DEFAULT ((0)) FOR [ModifierAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_TaxAmount]  DEFAULT ((0)) FOR [TaxAmount]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[OrderMaster] ADD  CONSTRAINT [DF_OrderMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[ProcErrorLog] ADD  DEFAULT (newid()) FOR [ExceptionID]
GO
ALTER TABLE [dbo].[ProcErrorLog] ADD  DEFAULT (getdate()) FOR [EntryDateTime]
GO
ALTER TABLE [dbo].[SeatMappingMaster] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[SeatMappingMaster] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[SeatMappingMaster] ADD  DEFAULT (getdate()) FOR [UpdationDate]
GO
ALTER TABLE [dbo].[SitesMaster] ADD  CONSTRAINT [DF_SitesMaster_SiteIDP]  DEFAULT (newid()) FOR [SiteIDP]
GO
ALTER TABLE [dbo].[SitesMaster] ADD  CONSTRAINT [DF_SitesMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SitesMaster] ADD  CONSTRAINT [DF_SitesMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[SubCategoryMaster] ADD  CONSTRAINT [DF_SubCategoryMaster_SubCategoryIdP]  DEFAULT (newid()) FOR [SubCategoryIDP]
GO
ALTER TABLE [dbo].[SubCategoryMaster] ADD  CONSTRAINT [DF_SubCategoryMaster_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[SubCategoryMaster] ADD  CONSTRAINT [DF_SubCategoryMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[CityMaster]  WITH CHECK ADD  CONSTRAINT [FK_CityMaster_StateMaster] FOREIGN KEY([StateIDF])
REFERENCES [dbo].[StateMaster] ([StateIDP])
GO
ALTER TABLE [dbo].[CityMaster] CHECK CONSTRAINT [FK_CityMaster_StateMaster]
GO
ALTER TABLE [dbo].[StateMaster]  WITH CHECK ADD  CONSTRAINT [FK_StateMaster_CountryMaster] FOREIGN KEY([CountryIDF])
REFERENCES [dbo].[CountryMaster] ([CountryIDP])
GO
ALTER TABLE [dbo].[StateMaster] CHECK CONSTRAINT [FK_StateMaster_CountryMaster]
GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_CheckUserStatus]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 02-02-2024
-- Description: Check User Status
-- =============================================
CREATE PROCEDURE [dbo].[AspNetUsers_CheckUserStatus]
    @Email nvarchar(250),
    @OUTVAL int OUTPUT
AS
BEGIN
    BEGIN TRY
        SELECT @OUTVAL = CASE WHEN isActive = 1 THEN 1 ELSE 0 END
        FROM AspNetUsers 
        WHERE Email = @Email
    END TRY
    BEGIN CATCH
        -- Log error or handle it as per your requirement
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_CheckUserStatus', @ErrorMessage;

        -- Set the output value to indicate an error occurred
        SET @OUTVAL = -1; -- Or any other value to indicate an error
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 31-01-2024
-- Description: Delete or Update records from AspNetUsers
-- =============================================

CREATE PROCEDURE [dbo].[AspNetUsers_GeneralAction]
    @id UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    IF @ActionType = 1
    BEGIN
        -- Check if the record exists
        DECLARE @CheckResult NVARCHAR(MAX);
        EXEC dbo.CheckIDExistence @id, 'AspNetUsers', @CheckResult OUTPUT;

        IF @CheckResult IS NOT NULL
        BEGIN
            -- Record exists, set @OUTVAL and return
            SET @OUTVAL = @CheckResult;
            RETURN;
        END

        -- Perform logical delete
        DELETE FROM AspNetUsers
        WHERE Id = @id;

        SET @OUTVAL = 'Record deleted successfully.';
    END
    ELSE
    BEGIN
        -- Update isActive status
        DECLARE @IsActive BIT;
        SELECT @IsActive = isActive FROM AspNetUsers WHERE Id = @id;

        -- Negate the existing isActive value
        SET @IsActive = ~@IsActive;

        -- Execute UpdateIsActive stored procedure to update isActive status
        DECLARE @Output NVARCHAR(MAX);
        EXEC dbo.UpdateIsActive @id, @IsActive, 'AspNetUsers', @Output OUTPUT;

        -- Set success message
        UPDATE AspNetUsers
        SET isActive = ~isActive -- Toggles the isActive status
        WHERE Id = @id;

        -- Concatenate output message with success message
        SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 02-02-2024
-- Description: Select All Users
-- =============================================
CREATE PROCEDURE [dbo].[AspNetUsers_GetAll]  
    @UserId NVARCHAR(128),  
    @CompanyIDF UNIQUEIDENTIFIER,  
    @SiteIDF UNIQUEIDENTIFIER  
AS  
BEGIN  
    BEGIN TRY  
        -- Get the role of the logged-in user  
        DECLARE @UserRole NVARCHAR(128)  
        SELECT @UserRole = R.Name  
        FROM AspNetUsers U  
        INNER JOIN AspNetUserRoles UR ON U.Id = UR.UserId  
        INNER JOIN AspNetRoles R ON UR.RoleId = R.Id  
        WHERE U.Id = @UserId  
  
        -- Query to retrieve users based on the user's role hierarchy and CompanyIDF  
        SELECT U.Id,  
               U.Email,  
               U.isActive,  
               U.Gender,  
               U.FirstName,  
               (U.FirstName + ' ' + ISNULL(U.LastName,'')) AS FullName,  
               FORMAT(U.CreationDate, 'dd-MM-yyyy') AS CreationDate,  
               ISNULL(CurrentRole.Name, 'User') AS CurrentRole,  
               FORMAT(U.UpdationDate, 'dd-MM-yyyy') AS UpdationDate,  
               ISNULL(CM.CompanyName, '-') AS CompanyName,  
               ISNULL(SiteNames.SiteName, '-') AS SiteName -- Get comma-separated site names
        FROM AspNetUsers U  
        LEFT JOIN AspNetUserRoles UR ON U.CreatedBy = UR.UserId  
        LEFT JOIN AspNetRoles CreatedByRole ON UR.RoleId = CreatedByRole.Id  
        LEFT JOIN AspNetUserRoles UR2 ON U.Id = UR2.UserId  
        LEFT JOIN AspNetRoles CurrentRole ON UR2.RoleId = CurrentRole.Id  
        LEFT JOIN CompanyMaster CM ON U.CompanyIDF = CM.CompanyIDP  
        LEFT JOIN (
            SELECT U.SiteIDF, STUFF((
                SELECT ', ' + SM.SiteName
                FROM dbo.splitstring(U.SiteIDF, ',') S
                LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM AspNetUsers U
            GROUP BY U.SiteIDF
        ) AS SiteNames ON U.SiteIDF = SiteNames.SiteIDF
        WHERE  
            (
                -- Admin can see all records
                @UserRole = 'Admin' 
                OR 
                -- CEO can see all records of their company
                (
                    @UserRole = 'CEO' 
                    AND 
                    U.CompanyIDF = @CompanyIDF 
                    AND 
                    U.Id != @UserId -- Exclude CEO's own record
                )
                OR 
                -- Non-admin users can see records based on their roles
                (
                    CurrentRole.Name IN ('GM-Site Wise', 'Operator', 'Chef', 'Waiter', 'User')
                    AND 
                    (
                        U.CompanyIDF = @CompanyIDF 
                        OR 
                        @UserRole = 'Admin'
                    )
                )
            )  
            AND ((U.SiteIDF = @SiteIDF) OR @UserRole = 'Admin'  OR @UserRole = 'CEO') -- Filter by SiteIDF, allowing Admin and CEO to bypass  
        ORDER BY U.CreationDate DESC, U.UpdationDate DESC   
        FOR JSON PATH  
    END TRY  
    BEGIN CATCH  
        -- Log the error using the InsertErrorLog stored procedure  
        DECLARE @ErrorMessage NVARCHAR(MAX);  
        SET @ErrorMessage = ERROR_MESSAGE();  
  
        EXEC InsertProcErrorLog 'AspNetUsers_GetAll', @ErrorMessage;  
        THROW;  
    END CATCH;  
END


GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 01-02-2024
-- Description: Select User By ID
-- =============================================
CREATE PROCEDURE [dbo].[AspNetUsers_GetByID]
    @UserIDP Uniqueidentifier
AS
BEGIN
    BEGIN TRY
        SELECT u.Id,
               u.FirstName,
               u.LastName,
               u.Email,
               u.Gender,
               u.SiteIDF,
               u.CompanyIDF,
			  (u.FirstName + ' ' + ISNULL(u.LastName,'')) as FullName,
               --u.RoleId,
               u.PasswordHash,
               u.PhoneNumber,
               r.Name AS CurrentRole, -- Assuming there's a Name column in your AspNetRoles table
			                  FORMAT(U.CreationDate, 'dd-MM-yyyy') AS CreationDate,
               FORMAT(U.UpdationDate, 'dd-MM-yyyy') AS UpdationDate,
               ISNULL(CM.CompanyName, 'Unknown') AS CompanyName,
               ISNULL(SM.SiteName, 'Unknown') AS SiteName
        FROM AspNetUsers u
        INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
        INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
        LEFT JOIN CompanyMaster CM ON U.CompanyIDF = CM.CompanyIDP
        LEFT JOIN SitesMaster SM ON U.SiteIDF = SM.SiteIDP
        WHERE u.Id = @UserIDP
        FOR JSON PATH
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_GetByID', @ErrorMessage;
        THROW;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetCompanyandSiteID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 05-02-2024
-- Description: Get CompanyID and SiteID
-- =============================================

CREATE PROCEDURE [dbo].[AspNetUsers_GetCompanyandSiteID]
    @Email NVARCHAR(50)
AS
BEGIN
    BEGIN TRY
        DECLARE @UserRole NVARCHAR(128)
        SELECT @UserRole = R.Name
        FROM AspNetUsers U
        INNER JOIN AspNetUserRoles UR ON U.Id = UR.UserId
        INNER JOIN AspNetRoles R ON UR.RoleId = R.Id
        WHERE U.Email = @Email

        IF @UserRole IS NULL
        BEGIN
            -- User not found or has no roles
            SELECT CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS CompanyIDF,
                   '' AS SiteID,
                   '' AS SiteName,
                   CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS ActiveSiteID,
                   '' AS Gender
            RETURN;
        END

         IF @UserRole = 'Admin'
        BEGIN
            -- Admin can see all records, return empty values
            SELECT 
                CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS CompanyIDF,
                '' AS SiteID,
                '' AS SiteName,
                CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS ActiveSiteID,
                U.Gender -- Include Gender for Admin
            FROM AspNetUsers U
            WHERE U.Email = @Email;
            RETURN;
        END

		 IF @UserRole = 'CEO'
        BEGIN
            -- CEO has no site ID, return only company ID
            SELECT 
                ISNULL(U.CompanyIDF, '00000000-0000-0000-0000-000000000000') AS CompanyIDF,
                CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS ActiveSiteID ,
                '' AS SiteName,
                CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS SiteID,
                ISNULL(U.Gender, '') AS Gender
            FROM AspNetUsers U
            WHERE U.Email = @Email;
            RETURN;
        END
        -- For non-admin users, retrieve company and site information
			SELECT ISNULL(u.CompanyIDF, '00000000-0000-0000-0000-000000000000') AS CompanyIDF,
				   ISNULL(s.SiteIDP, '00000000-0000-0000-0000-000000000000') AS SiteID,
				   ISNULL(s.SiteName, '') AS SiteName,
				   ISNULL(u.ActiveSiteID, '00000000-0000-0000-0000-000000000000') AS ActiveSiteID,
				   ISNULL(u.Gender, '') AS Gender
			FROM AspNetUsers u
			CROSS APPLY dbo.splitstring(u.SiteIDf, ',') s_id
			LEFT JOIN SitesMaster s ON s.SiteIDP = s_id.value
			WHERE u.Email = @Email;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_GetCompanyandSiteID', @ErrorMessage;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 30-01-2024
-- Description: Update FirstName and LastName in AspNetUsers table
-- =============================================

CREATE PROCEDURE [dbo].[AspNetUsers_Update]
    @Id nvarchar(128),
    @CompanyIDF uniqueidentifier,
    @SiteIDF nvarchar(max),
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50)=null,
    @Email NVARCHAR(50)=null,
    @UserPassword NVARCHAR(MAX)=null,
    @Gender NVARCHAR(10),
    @Phone NVARCHAR(50)=null,
	@CreatedBy uniqueidentifier,
	@UpdatedBy uniqueidentifier,
    @OUTVAL INT OUTPUT,
    @OUTMESSAGE VARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        DECLARE @RowCount INT;

		DECLARE @ActiveSiteID UNIQUEIDENTIFIER;
        SET @ActiveSiteID = (SELECT CAST(LEFT(@SiteIDF, CHARINDEX(',', @SiteIDF + ',') - 1) AS UNIQUEIDENTIFIER));

        IF (SELECT COUNT(*) FROM AspNetUsers WHERE Id = @Id AND CreatedBy IS NULL) > 0
        BEGIN
            UPDATE AspNetUsers
            SET FirstName = @FirstName,
                LastName = @LastName,
				Gender = @Gender,
				UserPassword = @UserPassword,
                CreatedBy = @CreatedBy,
                CompanyIDF = @CompanyIDF,
                SiteIDF = @SiteIDF,
				ActiveSiteID = @ActiveSiteID
            WHERE Id = @Id;
			SET @OUTVAL = 1;
            SET @OUTMESSAGE = 'New Update successful.';
        END
        ELSE
        BEGIN
            UPDATE AspNetUsers
            SET FirstName = @FirstName,
                LastName = @LastName,
                UpdationDate = GETDATE(),
                UpdatedBy = @UpdatedBy,
                Gender = @Gender,
              --   UserName = CASE 
              --    WHEN @Email IS NOT NULL AND NOT EXISTS (SELECT 1 FROM AspNetUsers WHERE UserName = @Email) THEN @Email 
              --    ELSE UserName 
              --END,
				UserName = CASE WHEN @Email IS NOT NULL THEN @Email ELSE UserName END,
                Email = CASE WHEN @Email IS NOT NULL THEN @Email ELSE Email END,
                UserPassword = CASE WHEN @UserPassword IS NOT NULL THEN @UserPassword ELSE UserPassword END,
                PhoneNumber = @Phone,
                CompanyIDF = @CompanyIDF,
                SiteIDF = @SiteIDF,
				ActiveSiteID = @ActiveSiteID
            WHERE Id = @Id;
        END

        SET @RowCount = @@ROWCOUNT;

        IF @RowCount > 0
        BEGIN
            SET @OUTVAL = 1;
            SET @OUTMESSAGE = 'Update successful.';
        END
        ELSE
        BEGIN
            SET @OUTVAL = 0;
            SET @OUTMESSAGE = 'User not found or no changes made.';
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_Update', @ErrorMessage;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_UpdateActiveSiteID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: Prashant Chauhan
-- Create date: 15-02-2024
-- Description: Update ActiveSiteID
-- =============================================

CREATE PROCEDURE [dbo].[AspNetUsers_UpdateActiveSiteID]
    @Id UNIQUEIDENTIFIER,
    @ActiveSiteID UNIQUEIDENTIFIER,
    @OUTVAL NVARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE AspNetUsers
        SET ActiveSiteID = @ActiveSiteID
        WHERE Id = @Id;

        IF @@ROWCOUNT > 0
            SET @OUTVAL = 'Record Updated Successfully.';
        ELSE
            SET @OUTVAL = 'Record not found for the provided Id.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_UpdateActiveSiteID', @ErrorMessage;

        SET @OUTVAL = 'Error occurred. Please check the logs.';
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[AspNetUsers_UpdateByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Prashant Chauhan
-- Create date: 30-01-2024
-- Description: Update in AspNetUsers table
-- =============================================
CREATE PROCEDURE [dbo].[AspNetUsers_UpdateByID]
    @Id nvarchar(128),
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50)=null,
    @Email NVARCHAR(50),
    @Gender NVARCHAR(10),
    @Phone NVARCHAR(50)=null,
	@UpdatedBy uniqueidentifier,
    @OUTVAL INT OUTPUT,
    @OUTMESSAGE VARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        UPDATE AspNetUsers
        SET FirstName = @FirstName,
            LastName = @LastName,
            Email = @Email,
			PhoneNumber = @Phone,
			Gender = @Gender,
            UserName = @Email,
            UpdatedBy = @UpdatedBy,
			UpdationDate = GETDATE()
        WHERE Id = @Id;
        
        SET @OUTVAL = 1;
        SET @OUTMESSAGE = 'Record updated successfully.';
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'AspNetUsers_UpdateByID', @ErrorMessage; -- Updated procedure name for error logging
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 30-01-2024
-- Description: Delete or Update records from CategoryMaster
-- =============================================

CREATE PROCEDURE [dbo].[CategoryMaster_GeneralAction]
    @CategoryIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    IF @ActionType = 1
    BEGIN
        -- Check if the record exists
        DECLARE @CheckResult NVARCHAR(50);
        EXEC dbo.CheckIDExistence @CategoryIDP, 'CategoryMaster', @CheckResult OUTPUT;

        IF @CheckResult IS NOT NULL
        BEGIN
            -- Record exists, set @OUTVAL and return
            SET @OUTVAL = @CheckResult;
            RETURN;
        END

        -- Perform logical delete
        DELETE FROM CategoryMaster
        WHERE CategoryIDP = @CategoryIDP;

        SET @OUTVAL = 'Record deleted successfully.';
    END
    ELSE
    BEGIN
        -- Update isActive status
        DECLARE @IsActive BIT;
        SELECT @IsActive = isActive FROM CategoryMaster WHERE CategoryIDP = @CategoryIDP;

        -- Negate the existing isActive value
        SET @IsActive = ~@IsActive;

        -- Execute UpdateIsActive stored procedure to update isActive status
        DECLARE @Output NVARCHAR(50);
        EXEC dbo.UpdateIsActive @CategoryIDP, @IsActive, 'CategoryMaster', @Output OUTPUT;

        -- Set success message
        UPDATE CategoryMaster
        SET isActive = ~isActive -- Toggles the isActive status
        WHERE CategoryIDP = @CategoryIDP;

        -- Concatenate output message with success message
        SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <30-01-2024>
-- Description:    <Select all from CategoryMaster>
-- =============================================

CREATE PROCEDURE [dbo].[CategoryMaster_GetAll]
 @CompanyIDF Uniqueidentifier,
 @UserID Uniqueidentifier,
 @SiteIDF Uniqueidentifier
AS
BEGIN
    DECLARE @UserRole NVARCHAR(100)

    -- Retrieve the current role of the user
    SELECT @UserRole = r.Name
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserID;

    SELECT cam.CategoryIDP,
           cam.CategoryName,
           cam.CategoryImagePath,
           ISNULL(CM.CompanyName, 'Unknown') AS CompanyName,
            ISNULL(SiteNames.SiteName, '-') AS SiteName,
           cam.isActive,
           --FORMAT(cam.CreationDate, 'dd-MM-yyyy') AS CreationDate,
		   CONVERT(VARCHAR(10), cam.CreationDate, 120) AS CreationDate, -- 120 is the style code for 'YYYY-MM-DD'
           cam.CreatedBy,
           cam.UpdationDate,
           cam.UpdatedBy,
           @UserRole AS CurrentRole -- Include the current role
    FROM CategoryMaster cam
    LEFT JOIN CompanyMaster CM ON cam.CompanyIDF = CM.CompanyIDP
	 LEFT JOIN (
            SELECT cam.SiteIDF, STUFF((
                SELECT ', ' + SM.SiteName
                FROM dbo.splitstring(cam.SiteIDF, ',') S
                LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM CategoryMaster cam
            GROUP BY cam.SiteIDF
        ) AS SiteNames ON cam.SiteIDF = SiteNames.SiteIDF
    --WHERE ((cam.CompanyIDF = @CompanyIDF) OR @UserRole = 'Admin') and SiteIDF = @SiteIDF
	WHERE 
        -- Allow Admin to see all records
        (@UserRole = 'Admin')
        OR
        -- Allow CEO to see records for their company without specifying a site
        (@UserRole = 'CEO' AND cam.CompanyIDF = @CompanyIDF)
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (cam.CompanyIDF = @CompanyIDF AND cam.SiteIDF = @SiteIDF)
    ORDER BY CreationDate DESC, CategoryName
    FOR JSON PATH;
END


GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <30-01-2024>
-- Description:    <Select all from CategoryMaster>
-- =============================================

CREATE PROCEDURE [dbo].[CategoryMaster_GetByID]
    @CategoryIDP Uniqueidentifier
AS
BEGIN
    BEGIN TRY
        SELECT cm.CategoryIDP,
               cm.CategoryName,
			   cm.CompanyIDF,
			   cms.CompanyName,
			   cm.SiteIDF,
			   sm.SiteName,
               cm.isActive,
			   cm.CategoryImagePath,
               cm.CreationDate,
               cm.CreatedBy,
               cm.UpdationDate,
               cm.UpdatedBy
        FROM CategoryMaster cm
		left join CompanyMaster cms on cm.CompanyIDF = cms.CompanyIDP
		left join SitesMaster sm on cm.SiteIDF = sm.SiteIDP
		
        WHERE CategoryIDP = @CategoryIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        EXEC InsertProcErrorLog 'CategoryMaster_GetByID', @ErrorMessage;

    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetCategoryFromSites]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <19-02-2024>
-- Description:    <Select by SiteIDF from CategoryMaster>
-- =============================================

CREATE PROCEDURE [dbo].[CategoryMaster_GetCategoryFromSites]
  @siteIds nvarchar(max)
AS
BEGIN
  BEGIN TRY
    SELECT DISTINCT cm.CategoryIDP,
                    cm.CategoryName
    FROM CategoryMaster cm
    CROSS APPLY dbo.splitstring(cm.SiteIDF, ',') AS cm_siteid
    CROSS APPLY dbo.splitstring(@siteIds, ',') AS param_siteid
    WHERE cm_siteid.Value IN (SELECT Value FROM dbo.splitstring(@siteIds, ','))
    FOR JSON PATH;
  END TRY
  BEGIN CATCH
    DECLARE @ErrorMessage NVARCHAR(MAX);
    SET @ErrorMessage = ERROR_MESSAGE();

    EXEC InsertProcErrorLog 'CategoryMaster_GetByID', @ErrorMessage;
  END CATCH;
END;



GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 30-01-2024
-- Description: Insert and Update Records Into CategoryMaster
-- =============================================
CREATE PROCEDURE [dbo].[CategoryMaster_Insert_Update]
    @CategoryIDP Uniqueidentifier,
	@CompanyIDF uniqueidentifier,
	@SiteIDF nvarchar(max),
    @CategoryName NVarchar(100),
	@CategoryImagePath Nvarchar(max),
	@OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@CategoryIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO CategoryMaster
                (
                  CategoryName,
				  CompanyIDF,
				  SiteIDF,
				  CategoryImagePath,
                  CreatedBy
				 )
        VALUES (
                 @CategoryName,
				 @CompanyIDF,
				 @SiteIDF,
				 @CategoryImagePath,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE CategoryMaster
        SET CategoryName = @CategoryName,			
			CompanyIDF = @CompanyIDF,
			SiteIDF = @SiteIDF,
			CategoryImagePath = @CategoryImagePath,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE CategoryIDP = @CategoryIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CheckIDExistence]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckIDExistence]
    @ID uniqueidentifier,
    @ExcludeTable nvarchar(100) = NULL,
	@ResultOutput nvarchar(max) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Declare variables
    DECLARE @TableName nvarchar(100)
    DECLARE @ColumnName nvarchar(100)
    DECLARE @Result nvarchar(max) = ''
    
    -- Cursor to iterate through tables and columns
    DECLARE table_cursor CURSOR FOR
    SELECT t.name AS TableName, c.name AS ColumnName
    FROM sys.tables t
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    WHERE c.system_type_id = 36 -- Filter only uniqueidentifier type
    AND t.name <> ISNULL(@ExcludeTable, '') -- Exclude the specified table if provided
    AND t.name NOT IN ('ErrorLogs', 'ProcErrorLog') -- Exclude additional tables
    ORDER BY t.name, c.name
    
    OPEN table_cursor
    
    FETCH NEXT FROM table_cursor INTO @TableName, @ColumnName
    
    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the ID exists in the current table and column
        IF EXISTS (SELECT 1 FROM sys.columns WHERE name = @ColumnName AND object_id = OBJECT_ID(@TableName))
        BEGIN
            DECLARE @SQLQuery nvarchar(max)
            SET @SQLQuery = 'IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@TableName) + ' WHERE ' + QUOTENAME(@ColumnName) + ' = @ID) SET @Result += ''' + @TableName + '.' + @ColumnName + ', '''
            EXEC sp_executesql @SQLQuery, N'@ID uniqueidentifier, @Result nvarchar(max) OUTPUT', @ID, @Result OUTPUT
        END
        
        FETCH NEXT FROM table_cursor INTO @TableName, @ColumnName
    END
    
    CLOSE table_cursor
    DEALLOCATE table_cursor

    -- Remove trailing comma and space if the result is not empty
    IF LEN(@Result) > 0
    BEGIN
        SET @Result = LEFT(@Result, LEN(@Result) - 1)
		SET @ResultOutput = 'Unable to perform action, record already exists in ' + @Result
        PRINT 'Unable to perform action, record already exists in the following table(s) and column(s): ' + @Result
    END
    ELSE
    BEGIN
		SET @ResultOutput = null
        PRINT 'Record does not exist in any table.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CityMaster_GetByStateID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 02-02-24
-- Description: Retrieve cities by StateID from CityMaster
-- =============================================
CREATE PROCEDURE [dbo].[CityMaster_GetByStateID]
    @StateIDF int
AS
BEGIN
    SELECT CityIDP, CityName
    FROM CityMaster
    WHERE StateIDF = @StateIDF
	FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_CheckCompanyExistenceByGSTINNumber]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompanyMaster_CheckCompanyExistenceByGSTINNumber]
@CompanyIDP uniqueidentifier = null,
@GSTINNumber VARCHAR(15)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT COUNT(*) As GSTINNumberCount
        FROM CompanyMaster 
        WHERE (@CompanyIDP IS NULL OR CompanyIDP != @CompanyIDP)
		AND GSTINNumber = @GSTINNumber
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_CheckCompanyExistenceByGSTINNumber', @ErrorMessage;

        -- You can customize the error message based on your requirement
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END





GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_CheckEmailExistence]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 06-02-24
-- Description: Stored Procedure to check if the email exists
-- =============================================
CREATE PROCEDURE [dbo].[CompanyMaster_CheckEmailExistence]
    @CompanyIDP uniqueidentifier = null,
	@Email NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        SELECT COUNT(*) as EmailCount
        FROM CompanyMaster 
        WHERE (@CompanyIDP IS NULL OR CompanyIDP != @CompanyIDP)
		AND ContactEmail = @Email
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_CheckEmailExistence', @ErrorMessage;
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 01-02-2024
-- Description: Delete or Update Status in CompanyMaster
-- =============================================
CREATE PROCEDURE [dbo].[CompanyMaster_GeneralAction]
    @CompanyIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @CompanyIDP, 'CompanyMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM CompanyMaster
            WHERE CompanyIDP = @CompanyIDP;

            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = IsActive FROM CompanyMaster WHERE CompanyIDP = @CompanyIDP;

            -- Negate the existing IsActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update IsActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @CompanyIDP, @IsActive, 'CompanyMaster', @Output OUTPUT;

            -- Set success message
            UPDATE CompanyMaster
            SET IsActive = ~IsActive -- Toggles the IsActive status
            WHERE CompanyIDP = @CompanyIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_GeneralAction', @ErrorMessage;

        SET @OUTVAL = 'Error occurred. Please check the logs.';
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 02-02-24
-- Description: Retrieve all companies from CompanyMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[CompanyMaster_GetAll]
    @UserID UNIQUEIDENTIFIER,
    @CompanyIDF UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SELECT
            cm.CompanyIDP,
            cm.CompanyTypeIdF,
            ct.CompanyType,
            cm.CountryIDF,
            co.CountryName,
            cm.StateIDF,
            st.StateName,
            cm.CityIDF,
            ci.CityName,
            cm.CompanyName,
            cm.CompanyLogoPath,
            cm.HQ_Pincode,
            cm.HQ_Address,
            cm.ContactEmail,
            cm.GSTINNumber,
            cm.ContactNumber,
			cm.Gender,
            FORMAT(cm.RegistrationDate, 'dd-MM-yyyy') AS RegistrationDate,
            cm.Password,
            cm.CEOName,
            cm.isActive,
            FORMAT(cm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            cm.CreatedBy,
            cm.UpdationDate,
            cm.UpdatedBy
        FROM CompanyMaster cm
        LEFT JOIN CompanyTypeMaster ct ON cm.CompanyTypeIdF = ct.CompanyTypeIDP
        LEFT JOIN CountryMaster co ON cm.CountryIDF = co.CountryIDP
        LEFT JOIN StateMaster st ON cm.StateIDF = st.StateIDP
        LEFT JOIN CityMaster ci ON cm.CityIDF = ci.CityIDP
        INNER JOIN AspNetUserRoles aur ON aur.UserId = @UserID
        INNER JOIN AspNetRoles ar ON ar.Id = aur.RoleId
        WHERE cm.CompanyIDP = @CompanyIDF
            Or ar.Name = 'Admin'
        ORDER BY CreatedDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_GetAll', @ErrorMessage;

        -- You can customize the error message based on your requirement
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 02-02-24
-- Description: Retrieve a company by CompanyID from CompanyMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[CompanyMaster_GetByID]
    @CompanyIDP uniqueidentifier
AS
BEGIN
    BEGIN TRY
        SELECT
            cm.CompanyIDP,
            cm.CompanyTypeIdF,
            ct.CompanyType,
            cm.CountryIDF,
            co.CountryName,
            cm.StateIDF,
            st.StateName,
            cm.CityIDF,
            ci.CityName,
            cm.CompanyName,
			cm.Gender,
            cm.CompanyLogoPath,
            cm.HQ_Pincode,
			cm.GSTINNumber,
            cm.HQ_Address,
            cm.ContactEmail,
            cm.ContactNumber,
            CONVERT(VARCHAR(10), cm.RegistrationDate, 120) AS RegistrationDate,
            cm.Password,
            cm.CEOName,
            cm.isActive,
            CONVERT(VARCHAR(10), cm.CreationDate, 120) AS CreatedDate,
            cm.CreatedBy,
            cm.UpdationDate,
            cm.UpdatedBy
        FROM CompanyMaster cm
        LEFT JOIN CompanyTypeMaster ct ON cm.CompanyTypeIdF = ct.CompanyTypeIDP
        LEFT JOIN CountryMaster co ON cm.CountryIDF = co.CountryIDP
        LEFT JOIN StateMaster st ON cm.StateIDF = st.StateIDP
        LEFT JOIN CityMaster ci ON cm.CityIDF = ci.CityIDP
        WHERE cm.CompanyIDP = @CompanyIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_GetByID', @ErrorMessage;

        -- You can customize the error message based on your requirement
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 02-02-24
-- Description: Insert and Update Records Into CompanyMaster
-- =============================================
-- Stored Procedure: [dbo].[CompanyMaster_Insert_Update]
CREATE PROCEDURE [dbo].[CompanyMaster_Insert_Update]
    @CompanyIDP uniqueidentifier,
    @CompanyTypeIdF uniqueidentifier,
    @CountryIDF int,
    @StateIDF int,
    @CityIDF int,
    @CompanyName NVARCHAR(250),
    @CompanyLogoPath NVARCHAR(MAX),
    @HQPincode NVARCHAR(10),
    @HQAddress NVARCHAR(500),
    @ContactEmail NVARCHAR(100),
    @ContactNumber NVARCHAR(20),
	@Gender NVARCHAR(10) = NULL,
	@RegistrationDate nvarchar(100),
    @Password NVARCHAR(100)=null,
    @CEOName NVARCHAR(100),
    @CreatedBy uniqueidentifier,
    @OUTVAL uniqueidentifier OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    --@UpdationDate DateTime = NULL,
    @UpdatedBy uniqueidentifier = NULL,
	@GSTINNumber VARCHAR(15)
AS
BEGIN
    BEGIN TRY
        IF (@CompanyIDP = '00000000-0000-0000-0000-000000000000')
        BEGIN
            DECLARE @NewCompanyID UNIQUEIDENTIFIER = NEWID()
			    --SET @RegistrationDate = TRY_CONVERT(datetime, @RegistrationDate);

            INSERT INTO CompanyMaster
            (
               CompanyIDP,
               CompanyTypeIdF,
               CountryIDF,
               StateIDF,
               CityIDF,
               CompanyName,
               CompanyLogoPath,
               HQ_Pincode,
               HQ_Address,
               ContactEmail,
               ContactNumber,
			   Gender,
               RegistrationDate,
               Password,
               CEOName,
               CreatedBy,
               GSTINNumber
            )
            VALUES
            (
               @NewCompanyID,
               @CompanyTypeIdF,
               @CountryIDF,
               @StateIDF,
               @CityIDF,
               @CompanyName,
               @CompanyLogoPath,
               @HQPincode,
               @HQAddress,
               @ContactEmail,
               @ContactNumber,
			   @Gender,
               --cast(@RegistrationDate as datetime),
			   CONVERT(DATETIME, @RegistrationDate, 105),
			   --@RegistrationDate,
               @Password,
               @CEOName,
               @CreatedBy,
               @GSTINNumber
            );
			
            SET @OUTVAL = @NewCompanyID;
            --SET @OUTMESSAGE = 'Record Saved Successfully.';

			DECLARE @SiteInsertUpdateOUTVAL UNIQUEIDENTIFIER;  
			-- Insert "Head Office" site
			EXEC [dbo].[SitesMaster_Insert_Update]
			'00000000-0000-0000-0000-000000000000',
                @NewCompanyID,
                @CountryIDF,
                @StateIDF,
                @CityIDF,
                'Head Office', -- SiteName
                @HQPincode,
                @HQAddress,
                @ContactEmail,
                @ContactNumber,
                @CreatedBy,
				@SiteInsertUpdateOUTVAL OUTPUT,
                @OUTMESSAGE OUTPUT;

				SET @OUTMESSAGE = @SiteInsertUpdateOUTVAL;
        END
        ELSE
        BEGIN
            UPDATE CompanyMaster
            SET
                CompanyTypeIdF = @CompanyTypeIdF,
                CountryIDF = @CountryIDF,
                StateIDF = @StateIDF,
                CityIDF = @CityIDF,
                CompanyName = @CompanyName,
                CompanyLogoPath = @CompanyLogoPath,
                HQ_Pincode = @HQPincode,
                HQ_Address = @HQAddress,
                ContactEmail = @ContactEmail,
                ContactNumber = @ContactNumber,
				Gender = @Gender,
                -- Password = @Password,
                CEOName = @CEOName,
                RegistrationDate =  CONVERT(DATETIME, @RegistrationDate, 105),
                UpdationDate = GETDATE(),
                UpdatedBy = @UpdatedBy
            WHERE CompanyIDP = @CompanyIDP;

            SET @OUTVAL = @CompanyIDP;
            --SET @OUTMESSAGE = 'Record Updated Successfully.';

			-- Retrieve SiteID of the "Head Office"
            DECLARE @HeadOfficeSiteID UNIQUEIDENTIFIER
            SELECT @HeadOfficeSiteID = SiteIDP
            FROM SitesMaster
            WHERE CompanyIDF = @CompanyIDP
              AND SiteName = 'Head Office';

            -- Call SitesMaster_Insert_Update to update "Head Office" site
          DECLARE @SiteUpdateOUTVAL UNIQUEIDENTIFIER;  -- Declare variable to store the output value of SitesMaster_Insert_Update
          DECLARE @SITEOUTMESSAGE Varchar(50);  

		-- Call SitesMaster_Insert_Update to update "Head Office" site
				EXEC [dbo].[SitesMaster_Insert_Update]
					@HeadOfficeSiteID,
					@CompanyIDP,
					@CountryIDF,
					@StateIDF,
					@CityIDF,
					'Head Office', -- SiteName
					@HQPincode,
					@HQAddress,
					@ContactEmail,
					@ContactNumber,
					@UpdatedBy, -- Use UpdatedBy instead of CreatedBy for updating
					@SiteUpdateOUTVAL OUTPUT,  -- Output parameter to store the SiteID
					@SITEOUTMESSAGE OUTPUT;  -- Output parameter to store the message

		-- Set the output value of SitesMaster_Insert_Update as the output message
		SET @OUTMESSAGE = @SiteUpdateOUTVAL;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyMaster_Insert_Update', @ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CompanyTypeMaster_GeneralAction]
    @CompanyTypeIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(max) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @CompanyTypeIDP, 'CompanyTypeMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM CompanyTypeMaster
            WHERE CompanyTypeIDP = @CompanyTypeIDP;

            SET @OUTVAL = 'Record deleted Successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM CompanyTypeMaster WHERE CompanyTypeIDP = @CompanyTypeIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @CompanyTypeIDP, @IsActive, 'CompanyTypeMaster', @Output OUTPUT;

            -- Set success message
            UPDATE CompanyTypeMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE CompanyTypeIDP = @CompanyTypeIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed Successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CompanyTypeMaster_GeneralAction', @ErrorMessage;

        SET @OUTVAL = 'Error occurred. Please check the logs.';
    END CATCH
END;

GO
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <Prashant Chauhan>
-- Create date: <30-01-2024>
-- Description:    <Select all from CompanyTypeMaster>
-- =============================================
CREATE PROCEDURE [dbo].[CompanyTypeMaster_GetAll]
AS
BEGIN
    SELECT CompanyTypeIDP,
           CompanyType,
           isActive,
           FORMAT(CreationDate, 'dd-MM-yyyy') AS CreationDate,
           CreatedBy,
           UpdationDate,
           UpdatedBy
    FROM CompanyTypeMaster
	ORDER BY CreationDate DESC
    FOR JSON PATH
END

GO
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Prashant Chauhan
-- Create date: 30-01-2024
-- Description: Select CompanyTypeMaster By ID
-- =============================================
CREATE PROCEDURE [dbo].[CompanyTypeMaster_GetByID]
    @CompanyTypeIDP Uniqueidentifier
AS
BEGIN
    SELECT CompanyTypeIDP,
           CompanyType,
           isActive,
           CreationDate,
           CreatedBy,
           UpdationDate,
           UpdatedBy
    FROM CompanyTypeMaster
    WHERE CompanyTypeIDP = @CompanyTypeIDP
	FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 30-01-2024
-- Description: Insert and Update Records Into CompanyTypeMaster
-- =============================================
CREATE PROCEDURE [dbo].[CompanyTypeMaster_Insert_Update]
    @CompanyTypeIDP Uniqueidentifier,
    @CompanyType NVarchar(100),
    @OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@CompanyTypeIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO CompanyTypeMaster
                (
                  CompanyType,
                  CreatedBy
				 )
        VALUES (
                 @CompanyType,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE CompanyTypeMaster
        SET CompanyType = @CompanyType,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE CompanyTypeIDP = @CompanyTypeIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[CountryMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountryMaster_GetAll]
AS
BEGIN
    SELECT CountryIDP, 
		   CountryName, 
		   CountryCode
    FROM CountryMaster
	 FOR JSON PATH;
END
GO
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FeedbackQuestionsMaster_GeneralAction]
    @QuestionIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @QuestionIDP, 'FeedbackQuestionsMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM FeedbackQuestionsMaster WHERE QuestionIDP = @QuestionIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = IsActive FROM FeedbackQuestionsMaster WHERE QuestionIDP = @QuestionIDP;

            -- Negate the existing IsActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update IsActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @QuestionIDP, @IsActive, 'FeedbackQuestionsMaster', @Output OUTPUT;

            -- Set success message
            UPDATE FeedbackQuestionsMaster
            SET IsActive = ~IsActive -- Toggles the IsActive status
            WHERE QuestionIDP = @QuestionIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'FeedbackQuestionsMaster_GeneralAction', @ErrorMessage;

        -- Set @OUTVAL to the error message
        SET @OUTVAL = 'An error occurred: ' + @ErrorMessage;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi vagadiya
-- Create date: 06-02-24
-- Description: Retrieve all question from FeedbackQuestionsMaster
-- =============================================
CREATE PROCEDURE [dbo].[FeedbackQuestionsMaster_GetAll]
 @CompanyIDF Uniqueidentifier,
 @UserID Uniqueidentifier
AS
BEGIN
	 DECLARE @UserRole NVARCHAR(100)

    -- Retrieve the current role of the user
    SELECT @UserRole = r.Name
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserID;
    BEGIN TRY
        SELECT
			fq.QuestionIDP,
			fq.CompanyIDF,
			fq.QuestionText,
			ISNULL(CM.CompanyName, '-') AS CompanyName,
            fq.isActive,
            FORMAT(fq.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            fq.CreatedBy,
            fq.UpdationDate,
            fq.UpdatedBy,
			@UserRole AS CurrentRole -- Include the current role
        FROM FeedbackQuestionsMaster fq
        LEFT JOIN CompanyMaster cm ON fq.CompanyIDF = cm.CompanyIDP
		 WHERE (fq.CompanyIDF = @CompanyIDF OR fq.CompanyIDF = '00000000-0000-0000-0000-000000000000') OR @UserRole = 'Admin'
        ORDER BY CreatedDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'FeedbackQuestionsMaster_GetAll', @ErrorMessage;

        -- You can customize the error message based on your requirement
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 06-02-24
-- Description: Retrieve a questions by QuestionIDP from FeedbackQuestionsMaster with additional information
-- =============================================
Create PROCEDURE [dbo].[FeedbackQuestionsMaster_GetByID]
    @QuestionIDP uniqueidentifier
AS
BEGIN
    BEGIN TRY
        SELECT
            fq.QuestionIDP,
			fq.CompanyIDF,
			fq.QuestionText,
            fq.isActive,
            FORMAT(fq.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            fq.CreatedBy,
            fq.UpdationDate,
            fq.UpdatedBy
        FROM FeedbackQuestionsMaster fq
        LEFT JOIN CompanyMaster cm ON fq.CompanyIdF = cm.CompanyIDP
        
        WHERE fq.QuestionIDP = @QuestionIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'FeedbackQuestionsMaster_GetByID', @ErrorMessage;

        -- You can customize the error message based on your requirement
        SELECT 'Error occurred. Please check the logs.' AS ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 06-02-2024
-- Description: Insert and Update Records Into FeedbackQuestionsMaster
-- =============================================
Create PROCEDURE [dbo].[FeedbackQuestionsMaster_Insert_Update]
    @QuestionIDP Uniqueidentifier,
	@CompanyIDF Uniqueidentifier,
    @QuestionText NVarchar(max),
    @OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@QuestionIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO FeedbackQuestionsMaster
                (
                   CompanyIDF,
				   QuestionText,
				   CreatedBy
				 )
        VALUES (
                 @CompanyIDF,
				 @QuestionText,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE FeedbackQuestionsMaster
        SET CompanyIDF = @CompanyIDF,
			QuestionText = @QuestionText,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE QuestionIDP = @QuestionIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[InsertErrorLog]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================  
-- Author: Aditya Joshi  
-- Create date: 03-02-2024  
-- Description: [InsertErrorLog] 
-- =============================================  

CREATE PROCEDURE [dbo].[InsertErrorLog]
    @ErrorMsg NVARCHAR(MAX),
    @StackTrace NVARCHAR(MAX),
	@UserID uniqueidentifier,
	@CompanyIDF uniqueidentifier = null,
	@SiteIDF uniqueidentifier = null,
    @OutVal NVARCHAR(10) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
       INSERT INTO ErrorLogs (ErrorMsg, StackTrace, UserID, CompanyIDF, SiteIDF)
	   VALUES (@ErrorMsg, @StackTrace, @UserID, @CompanyIDF, @SiteIDF);

        
        SET @OutVal = 'Success'; -- Return 'Success' as string if the operation is successful
    END TRY
    BEGIN CATCH
        SET @OutVal = 'Failure'; -- Return 'Failure' as string if an error occurs
    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[InsertProcErrorLog]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertProcErrorLog]
    @ProcedureName NVARCHAR(255),
    @ErrorMessage NVARCHAR(MAX)
AS
BEGIN
    SET NOCOUNT ON;
    
        INSERT INTO ProcErrorLog (ProcedureName, ErrorMessage)
        VALUES (@ProcedureName, @ErrorMessage);
END;
GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Prashant Chauhan
-- Create date: 19-02-24
-- Description: Delete or Update Status in MenuMaster
-- =============================================
CREATE PROCEDURE [dbo].[MenuMaster_GeneralAction]
    @MenuItemIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @MenuItemIDP, 'MenuMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM MenuMaster
            WHERE MenuItemIDP = @MenuItemIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM MenuMaster WHERE MenuItemIDP = @MenuItemIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @MenuItemIDP, @IsActive, 'MenuMaster', @Output Output;

            -- Set success message
            UPDATE MenuMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE MenuItemIDP = @MenuItemIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'MenuMaster_GeneralAction', @ErrorMessage;

        -- Set output value to indicate error
        SET @OUTVAL = 'An error occurred: ' + @ErrorMessage;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <13-02-2024>
-- Description:    <Select all from MenuMaster>
-- =============================================
CREATE PROCEDURE [dbo].[MenuMaster_GetAll]
@CompanyIDF Uniqueidentifier,
@SiteIDF Uniqueidentifier,
@UserID Uniqueidentifier
AS
BEGIN
	DECLARE @UserRole NVARCHAR(100)

    -- Retrieve the current role of the user
    SELECT @UserRole = r.Name
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserID;
    BEGIN TRY
        SELECT mm.MenuItemIDP,
			   cm.CategoryName,
               sm.SubCategoryName,
			   ISNULL(cms.CompanyName, 'Unknown') AS CompanyName,
			   ISNULL(SiteNames.SiteName, '-') AS SiteName,
			   mm.ItemName,
			   mm.Description,
			   mm.Price,
			   mm.IsProductOfDay,
			   mm.IndexInCategory,
			   mm.ItemImagePath,
			   mm.isActive,
			   mm.CompanyIDF,
			   MM.SiteIDF,
               FORMAT(mm.CreationDate, 'dd-MM-yyyy') AS CreationDate,
               mm.CreatedBy,
               mm.UpdationDate,
               mm.UpdatedBy,
			   @UserRole AS CurrentRole -- Include the current role
        FROM MenuMaster mm
        Left JOIN CategoryMaster cm ON mm.CategoryIDF = cm.CategoryIDP
		Left JOIN SubCategoryMaster sm ON mm.SubCategoryIDF = sm.SubCategoryIDP
		LEFT JOIN CompanyMaster cms ON mm.CompanyIDF = cms.CompanyIDP
		 LEFT JOIN (
            SELECT mm.SiteIDF, STUFF((
                SELECT ', ' + SM.SiteName
                FROM dbo.splitstring(mm.SiteIDF, ',') S
                LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM MenuMaster mm
            GROUP BY mm.SiteIDF
        ) AS SiteNames ON mm.SiteIDF = SiteNames.SiteIDF
        WHERE ((mm.CompanyIDF = @CompanyIDF AND mm.SiteIDF = @SiteIDF) OR @UserRole = 'Admin' OR (@UserRole = 'CEO' AND mm.CompanyIDF = @CompanyIDF))
		
        ORDER BY mm.CreationDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'MenuMaster_GetAll', @ErrorMessage;
    END CATCH
END 


-- EXEC MenuMaster_GetAll @CompanyIDF='00000000-0000-0000-0000-000000000000', @SiteIDF='00000000-0000-0000-0000-000000000000', @UserID='a35ca135-4c38-42a2-8aec-da4d4746aad9';
GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi vagadiya
-- Create date: 13-02-24
-- Description: Retrieve a Menu by MenuID from MenuMaster with additional information
-- =============================================
Create PROCEDURE [dbo].[MenuMaster_GetByID]
    @MenuItemIDP UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
        SELECT 
            mm.MenuItemIDP,
			mm.CategoryIDF,
			mm.SubCategoryIDF,
            mm.CompanyIDF,
			mm.SiteIDF,
			mm.ItemName,
			mm.Description,
			mm.Price,
			mm.IsProductOfDay,
			mm.IndexInCategory,
			mm.ItemImagePath,
            mm.isActive,
            FORMAT(mm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            mm.CreatedBy,
            mm.UpdationDate,
            mm.UpdatedBy
        FROM 
            MenuMaster mm      
        WHERE 
            mm.MenuItemIDP = @MenuItemIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'MenuMaster_GetByID', @ErrorMessage;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 13-02-2024
-- Description: Insert and Update Records Into MenuMaster
-- =============================================

CREATE PROCEDURE [dbo].[MenuMaster_Insert_Update]
    @MenuItemIDP Uniqueidentifier,
	@CategoryIDF Uniqueidentifier,
	@SubCategoryIDF Uniqueidentifier,
	@CompanyIDF Uniqueidentifier,
	@SiteIDF nvarchar(max),
	@ItemName nvarchar(250),
	@Description nvarchar(max),
	@Price decimal(10,2),
	@ItemImagePath nvarchar(max),
	@OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@MenuItemIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO MenuMaster
                (
				  CategoryIDF,
				  SubCategoryIDF,
				  CompanyIDF,
				  SiteIDF,
				  ItemName,
				  Description,
				  Price,
				  ItemImagePath,
                  CreatedBy
				 )
        VALUES (
                 @CategoryIDF,
				  @SubCategoryIDF,
				  @CompanyIDF,
				  @SiteIDF,
				  @ItemName,
				  @Description,
				  @Price,
				  @ItemImagePath,
                  @CreatedBy
				 )
        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE MenuMaster
        SET 
			CategoryIDF = @CategoryIDF,
			SubCategoryIDF = @SubCategoryIDF,
			CompanyIDF = @CompanyIDF,
			SiteIDF = @SiteIDF,
			ItemName = @ItemName,
			Description =@Description,
			Price = @Price,
			ItemImagePath = @ItemImagePath,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE MenuItemIDP = @MenuItemIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 12-02-24
-- Description: Delete or Update Status in ModifierMaster
-- =============================================
CREATE PROCEDURE [dbo].[ModifierMaster_GeneralAction]
    @ModifierIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @ModifierIDP, 'ModifierMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM ModifierMaster
            WHERE ModifierIDP = @ModifierIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM ModifierMaster WHERE ModifierIDP = @ModifierIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @ModifierIDP, @IsActive, 'ModifierMaster', @Output Output;

            -- Set success message
            UPDATE ModifierMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE ModifierIDP = @ModifierIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'ModifierMaster_GeneralAction', @ErrorMessage;

        -- Set output value to indicate error
        SET @OUTVAL = 'An error occurred: ' + @ErrorMessage;
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <12-02-2024>
-- Description:    <Select all from ModifierMaster>
-- =============================================
CREATE PROCEDURE [dbo].[ModifierMaster_GetAll] 
@CompanyIDF Uniqueidentifier,
@UserID Uniqueidentifier
AS
BEGIN
	DECLARE @UserRole NVARCHAR(100)

    -- Retrieve the current role of the user
    SELECT @UserRole = r.Name
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserID;
    BEGIN TRY
        SELECT mm.ModifierIDP,              
               mm.ModifierName,
			   mm.Price,
               mm.isActive,
			    ISNULL(CMS.CompanyName, 'Unknown') AS CompanyName,
				
               FORMAT(mm.CreationDate, 'dd-MM-yyyy') AS CreationDate,
               mm.CreatedBy,
               mm.UpdationDate,
               mm.UpdatedBy,
			   @UserRole AS CurrentRole -- Include the current role
        FROM ModifierMaster mm
		LEFT JOIN CompanyMaster CMS ON mm.CompanyIDF = CMS.CompanyIDP
		
        WHERE (mm.CompanyIDF = @CompanyIDF) OR @UserRole = 'Admin'
        ORDER BY mm.CreationDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'ModifierMaster_GetAll', @ErrorMessage;
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 12-02-24
-- Description: Retrieve a modifier by ModifierID from ModifierMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[ModifierMaster_GetByID]
    @ModifierIDP UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;
        SELECT 
            mm.ModifierIDP,
            mm.CompanyIDF,
            mm.ModifierName,
			cm.CompanyName,
			mm.Price,
            mm.isActive,
            FORMAT(mm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            mm.CreatedBy,
            mm.UpdationDate,
            mm.UpdatedBy
        FROM 
            ModifierMaster mm
			left join CompanyMaster cm on cm.CompanyIDP = MM.CompanyIDF
        WHERE 
            mm.ModifierIDP = @ModifierIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'ModifierMaster_GetSiteByID', @ErrorMessage;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ModifierMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 12-02-2024
-- Description: Insert and Update Records Into ModifierMaster
-- =============================================

CREATE PROCEDURE [dbo].[ModifierMaster_Insert_Update]
    @ModifierIDP Uniqueidentifier,	
	@CompanyIDF Uniqueidentifier,
    @ModifierName NVarchar(100),
	@Price decimal(10,2),
	@OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@ModifierIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO ModifierMaster
                (
                  ModifierName,
				  Price,
				  CompanyIDF,			  
                  CreatedBy
				 )
        VALUES (
                 @ModifierName,
				 @Price,
				 @CompanyIDF,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE ModifierMaster
        SET ModifierName = @ModifierName,
			Price = @Price,
			CompanyIDF = @CompanyIDF,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE ModifierIDP = @ModifierIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 19-02-2024
-- Description: Retrieve all seat mappings from SeatMappingMaster
-- =============================================
CREATE PROCEDURE [dbo].[SeatMappingMaster_GetAll]
    @CompanyIDF UNIQUEIDENTIFIER,
    @UserID UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SELECT
            sm.SeatIdP,
            sm.SiteIdF,
            sm.CompanyIdF,
            cm.CompanyName,
            s.SiteName,
            sm.SeatNumber,
			sm.QRCode,
            FORMAT(sm.CreationDate, 'dd-MM-yyyy') AS CreationDate,
            sm.ModificationDate,
            sm.Location,
            sm.Seattype,
            sm.IsActive,
            sm.CreatedBy,
            sm.UpdationDate,
            sm.UpdatedBy
        FROM 
            SeatMappingMaster sm
        LEFT JOIN CompanyMaster cm ON sm.CompanyIdF = cm.CompanyIDP
        LEFT JOIN SitesMaster s ON sm.SiteIdF = s.SiteIDP
        WHERE 
            (@UserID IN (SELECT UserId FROM AspNetUserRoles WHERE RoleId = (SELECT Id FROM AspNetRoles WHERE Name = 'Admin'))) -- Check if user is admin
            OR
            (sm.CompanyIdF = @CompanyIDF) -- Retrieve records associated with CompanyId for non-admin users
        ORDER BY 
            sm.CreationDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SeatMappingMaster_GetAll', @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 19-02-24
-- Description: Insert and Update Records Into SeatMappingMaster
-- =============================================
CREATE PROCEDURE [dbo].[SeatMappingMaster_Insert_Update]
    @SeatIDP UNIQUEIDENTIFIER,
    @SiteIDF UNIQUEIDENTIFIER,
    @CompanyIDF UNIQUEIDENTIFIER,
    @SeatNumber NVARCHAR(20),
    @Location NVARCHAR(50),
    @Seattype NVARCHAR(50),
    @CreatedBy UNIQUEIDENTIFIER = NULL,
    @UpdationDate DATETIME = NULL,
    @UpdatedBy UNIQUEIDENTIFIER = NULL,
    @QRCode NVARCHAR(255),
    @OUTVAL UNIQUEIDENTIFIER OUTPUT,
    @OUTMESSAGE VARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF (@SeatIDP = '00000000-0000-0000-0000-000000000000')
        BEGIN
            DECLARE @NewSeatID UNIQUEIDENTIFIER = NEWID();

            INSERT INTO SeatMappingMaster
            (
                SeatIDP,
                SiteIDF,
                CompanyIDF,
                SeatNumber,
                Location,
                Seattype,
                CreatedBy,
                UpdationDate,
                UpdatedBy,
                QRCode
            )
            VALUES
            (
                @NewSeatID,
                @SiteIDF,
                @CompanyIDF,
                @SeatNumber,
                @Location,
                @Seattype,
                @CreatedBy,
                @UpdationDate,
                @UpdatedBy,
                @QRCode
            );

            SET @OUTVAL = @NewSeatID;
            SET @OUTMESSAGE = 'Record Saved Successfully.';
        END
        ELSE
        BEGIN
            UPDATE SeatMappingMaster
            SET
                SiteIDF = @SiteIDF,
                CompanyIDF = @CompanyIDF,
                SeatNumber = @SeatNumber,
                Location = @Location,
                Seattype = @Seattype,
                CreatedBy = @CreatedBy,
                UpdationDate = getdate(),
                UpdatedBy = @UpdatedBy,
                QRCode = @QRCode
            WHERE SeatIDP = @SeatIDP;

            SET @OUTVAL = @SeatIDP;
            SET @OUTMESSAGE = 'Record Updated Successfully.';
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SeatMappingMaster_Insert_Update', @ErrorMessage;

        -- Set error output values
        SET @OUTVAL = '00000000-0000-0000-0000-000000000000'; -- Change this to match the datatype of SeatIDP
        SET @OUTMESSAGE = @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SitesMaster_GeneralAction]
    @SiteIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @SiteIDP, 'SitesMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM SitesMaster
            WHERE SiteIDP = @SiteIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM SitesMaster WHERE SiteIDP = @SiteIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @SiteIDP, @IsActive, 'SitesMaster', @Output OUTPUT;

            -- Set success message
            UPDATE SitesMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE SiteIDP = @SiteIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_GeneralAction', @ErrorMessage;

        -- Set @OUTVAL to indicate error occurred
        SET @OUTVAL = 'An error occurred. Please contact the administrator.';
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 03-02-2024
-- Description: Retrieve all sites from SitesMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[SitesMaster_GetAll]
    @CompanyIDF uniqueidentifier,
    @UserID uniqueidentifier
AS
BEGIN
    BEGIN TRY
       SELECT
		sm.SiteIDP,
		sm.CompanyIDF,
		ISNULL(cm.CompanyName, 'N/A') AS CompanyName,
		sm.CountryIDF,
		ISNULL(co.CountryName, 'N/A') AS CountryName,
		sm.StateIDF,
		ISNULL(st.StateName, 'N/A') AS StateName,
		sm.CityIDF,
		ISNULL(ci.CityName, 'N/A') AS CityName,
		ISNULL(sm.SitePinCode, 'N/A') AS SitePinCode,
		ISNULL(sm.SiteName, 'N/A') AS SiteName,
		ISNULL(sm.SiteAddress, 'N/A') AS SiteAddress,
		ISNULL(sm.SiteContactEmail, 'N/A') AS SiteContactEmail,
		ISNULL(sm.SiteContactNumber, 'N/A') AS SiteContactNumber,
		ISNULL(sm.isActive, 'N/A') AS isActive,
		FORMAT(sm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
		ISNULL(sm.CreatedBy, 'N/A') AS CreatedBy,
		sm.UpdationDate,
		sm.UpdatedBy
		FROM SitesMaster sm
		LEFT JOIN CompanyMaster cm ON sm.CompanyIdF = cm.CompanyIDP
		LEFT JOIN CountryMaster co ON sm.CountryIDF = co.CountryIDP
		LEFT JOIN StateMaster st ON sm.StateIDF = st.StateIDP
		LEFT JOIN CityMaster ci ON sm.CityIDF = ci.CityIDP
        WHERE 
            (@UserID IN (SELECT UserId FROM AspNetUserRoles WHERE RoleId = (SELECT Id FROM AspNetRoles WHERE Name = 'Admin'))) -- Check if user is admin
            OR
            (sm.CompanyIDF = @CompanyIDF) -- Retrieve records associated with CompanyId for non-admin users
        ORDER BY sm.CreationDate DESC
        FOR JSON PATH
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_GetAll', @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 05-02-24
-- Description: Retrieve a Site by SiteID from SitesMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[SitesMaster_GetByID]
    @SiteID UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        SELECT 
            sm.SiteIDP,
            sm.CompanyIDF,
            cm.CompanyName,
            sm.CountryIDF,
            co.CountryName,
            sm.StateIDF,
            st.StateName,
            sm.CityIDF,
            ci.CityName,
            sm.SitePinCode,
            sm.SiteName,
            sm.SiteAddress,
            sm.SiteContactEmail,
            sm.SiteContactNumber,
            sm.isActive,
            FORMAT(sm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            sm.CreatedBy,
            sm.UpdationDate,
            sm.UpdatedBy
        FROM 
            SitesMaster sm
        INNER JOIN 
            CompanyMaster cm ON sm.CompanyIDF = cm.CompanyIDP
        INNER JOIN 
            CountryMaster co ON sm.CountryIDF = co.CountryIDP
        INNER JOIN 
            StateMaster st ON sm.StateIDF = st.StateIDP
        INNER JOIN 
            CityMaster ci ON sm.CityIDF = ci.CityIDP
        WHERE 
            sm.SiteIDP = @SiteID
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_GetSiteByID', @ErrorMessage;
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetSitesByCompany]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 16-02-24
-- Description: Retrieve a Sites By CompanyID
-- =============================================
CREATE PROCEDURE [dbo].[SitesMaster_GetSitesByCompany]
    @CompanyIDF UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        SELECT s.SiteIDP, s.SiteName
        FROM SitesMaster s
        INNER JOIN CompanyMaster c ON s.CompanyIDF = c.CompanyIDP
        WHERE c.CompanyIDP = @CompanyIDF
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_GetSitesByCompany', @ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 05-02-24
-- Description: Insert and Update Records Into SitesMaster
-- =============================================
CREATE PROCEDURE [dbo].[SitesMaster_Insert_Update]
    @SiteIDP UNIQUEIDENTIFIER,
    @CompanyIDF UNIQUEIDENTIFIER,
    @CountryIDF INT,
    @StateIDF INT,
    @CityIDF INT,
    @SiteName NVARCHAR(250),
    @SitePinCode NVARCHAR(10),
    @SiteAddress NVARCHAR(500),
    @SiteContactEmail NVARCHAR(100),
    @SiteContactNumber NVARCHAR(15),
    @CreatedBy UNIQUEIDENTIFIER = NULL,
    @OUTVAL UNIQUEIDENTIFIER OUTPUT,
    @OUTMESSAGE VARCHAR(50) OUTPUT,
    @UpdationDate DATETIME = NULL,
    @UpdatedBy UNIQUEIDENTIFIER = NULL
AS
BEGIN
    BEGIN TRY
        IF (@SiteIDP = '00000000-0000-0000-0000-000000000000')
        BEGIN
            DECLARE @NewSiteID UNIQUEIDENTIFIER = NEWID();

            INSERT INTO SitesMaster
            (
                SiteIDP,
                CompanyIDF,
                CountryIDF,
                StateIDF,
                CityIDF,
                SiteName,
                SitePinCode,
                SiteAddress,
                SiteContactEmail,
                SiteContactNumber,
                CreatedBy
            )
            VALUES
            (
                @NewSiteID,
                @CompanyIDF,
                @CountryIDF,
                @StateIDF,
                @CityIDF,
                @SiteName,
                @SitePinCode,
                @SiteAddress,
                @SiteContactEmail,
                @SiteContactNumber,
                @CreatedBy
            );

            SET @OUTVAL = @NewSiteID;
            SET @OUTMESSAGE = 'Record Saved Successfully.';

            UPDATE AspNetUsers
            SET SiteIDF = @NewSiteID
            WHERE Id = @CreatedBy;
        END
        ELSE
        BEGIN
            DECLARE @UpdateCompany UNIQUEIDENTIFIER;
            SET @UpdateCompany = (SELECT CompanyIDF FROM SitesMaster WHERE SiteIDP = @SiteIDP AND SiteName = 'Head Office');

			DECLARE @OldSiteContactEmail NVARCHAR(255);
			SELECT @OldSiteContactEmail = SiteContactEmail
			FROM SitesMaster
			WHERE SiteIDP = @SiteIDP;

            UPDATE SitesMaster
            SET
				 CompanyIDF = CASE WHEN @CompanyIDF != '00000000-0000-0000-0000-000000000000' THEN @CompanyIDF ELSE CompanyIDF END,
                CountryIDF = @CountryIDF,
                StateIDF = @StateIDF,
                CityIDF = @CityIDF,
                SiteName = @SiteName,
                SitePinCode = @SitePinCode,
                SiteAddress = @SiteAddress,
                SiteContactEmail = @SiteContactEmail,
                SiteContactNumber = @SiteContactNumber,
                UpdationDate = GETDATE(),
                UpdatedBy = @UpdatedBy
            WHERE SiteIDP = @SiteIDP;

            SET @OUTVAL = @SiteIDP;
            SET @OUTMESSAGE = 'Record Updated Successfully.';

            IF @UpdateCompany IS NOT NULL
            BEGIN
                UPDATE CompanyMaster 
                SET  
                    CountryIDF = @CountryIDF,
                    StateIDF = @StateIDF,
                    CityIDF = @CityIDF,
                    HQ_Pincode = @SitePinCode,
                    HQ_Address = @SiteAddress,
                    ContactEmail = @SiteContactEmail,
                    ContactNumber = @SiteContactNumber,
                    UpdatedBy = @UpdatedBy,
                    UpdationDate = GETDATE()
                WHERE CompanyIDP = @UpdateCompany;
            END

			 -- Update AspNetUsers by email
			UPDATE AspNetUsers
			SET Email=@SiteContactEmail,
			   UserName = CASE WHEN @SiteContactEmail IS NOT NULL THEN @SiteContactEmail ELSE UserName END,
			   PhoneNumber = @SiteContactNumber
			WHERE Email = @OldSiteContactEmail; 
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_Insert_Update', @ErrorMessage;
        
		 ---- Set error output values
   --     SET @OUTVAL = 0;
   --     SET @OUTMESSAGE = @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[StateMaster_GetByCountryID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 02-02-24
-- Description: Retrieve states by CountryID from StateMaster
-- =============================================

CREATE PROCEDURE [dbo].[StateMaster_GetByCountryID]
    @CountryIDF int
AS
BEGIN
    SELECT StateIDP, StateName
    FROM StateMaster
    WHERE CountryIDF = @CountryIDF
	FOR JSON PATH
END
GO
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GeneralAction]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 01-02-2024
-- Description: Delete or Update records from SubCategoryMaster
-- =============================================

CREATE PROCEDURE [dbo].[SubCategoryMaster_GeneralAction]
    @SubCategoryIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @SubCategoryIDP, 'SubCategoryMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM SubCategoryMaster
            WHERE SubCategoryIDP = @SubCategoryIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM SubCategoryMaster WHERE SubCategoryIDP = @SubCategoryIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @SubCategoryIDP, @IsActive, 'SubCategoryMaster', @Output Output;

            -- Set success message
            UPDATE SubCategoryMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE SubCategoryIDP = @SubCategoryIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SubCategoryMaster_GeneralAction', @ErrorMessage;

        -- Set the output value to indicate failure
        SET @OUTVAL = 'An error occurred. Please check the error log for details.';
    END CATCH;
END;

GO
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetAll]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <01-02-2024>
-- Description:    <Select all from SubCategoryMaster>
-- =============================================
CREATE PROCEDURE [dbo].[SubCategoryMaster_GetAll]
    @CompanyIDF UNIQUEIDENTIFIER,
    @SiteIDF UNIQUEIDENTIFIER,
    @UserID UNIQUEIDENTIFIER
AS
BEGIN
    DECLARE @UserRole NVARCHAR(100)

    -- Retrieve the current role of the user
    SELECT @UserRole = r.Name
    FROM AspNetUsers u
    INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
    INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
    WHERE u.Id = @UserID;

    BEGIN TRY
        SELECT sm.SubCategoryIDP,
               sm.CategoryIDF,
               cm.CategoryName,
               sm.SubCategoryName,
               sm.isActive,
               sm.SubCategoryImagePath,
               ISNULL(CMS.CompanyName, '-') AS CompanyName,
               ISNULL(SiteNames.SiteName, '-') AS SiteName,
               FORMAT(sm.CreationDate, 'dd-MM-yyyy') AS CreationDate,
               sm.CreatedBy,
               sm.UpdationDate,
               sm.UpdatedBy,
               @UserRole AS CurrentRole -- Include the current role
        FROM SubCategoryMaster sm
        INNER JOIN CategoryMaster cm ON sm.CategoryIDF = cm.CategoryIDP
        LEFT JOIN CompanyMaster CMS ON sm.CompanyIDF = CMS.CompanyIDP
       LEFT JOIN (
            SELECT sm.SiteIDF, STUFF((
                SELECT ', ' + SM.SiteName
                FROM dbo.splitstring(sm.SiteIDF, ',') S
                LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM SubCategoryMaster sm
            GROUP BY sm.SiteIDF
        ) AS SiteNames ON sm.SiteIDF = SiteNames.SiteIDF
        WHERE 
            (cm.isActive = 1) 
            AND 
            (
                @UserRole = 'Admin' 
                OR 
                (@UserRole = 'CEO' AND sm.CompanyIDF = @CompanyIDF)
                OR 
                ((sm.CompanyIDF = @CompanyIDF) AND (sm.SiteIDF = @SiteIDF))
            )
        ORDER BY sm.CreationDate DESC, sm.SubCategoryName
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SubCategoryMaster_GetAll', @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetByID]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 01-02-2024
-- Description: Select SubCategoryMaster By ID
-- =============================================
CREATE PROCEDURE [dbo].[SubCategoryMaster_GetByID]
    @SubCategoryIDP Uniqueidentifier
AS
BEGIN
    SELECT sm.SubCategoryIDP,
		   sm.CategoryIDF,
		   sm.SiteIDF,
		   sms.SiteName,
		   sm.CompanyIDF,
		   cms.CompanyName,
		   cm.CategoryName,
           sm.SubCategoryName,
		   sm.SubCategoryImagePath,
           sm.isActive,
           sm.CreationDate,
           sm.CreatedBy,
           sm.UpdationDate,
           sm.UpdatedBy
    FROM SubCategoryMaster sm
	left join CategoryMaster cm on sm.CategoryIDF = cm.CategoryIDP
	left join SitesMaster sms on sm.SiteIDF = sms.SiteIDP
	left join CompanyMaster cms on sm.CompanyIDF = cms.CompanyIDP
    WHERE SubCategoryIDP = @SubCategoryIDP
	For JSON Path
END
GO
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetSubCategoryFromCategory]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author: Prashant Chauuhan
-- Create date: 20-02-2024
-- Description: Select SubCategoryMaster From Category
-- =============================================
CREATE PROCEDURE [dbo].[SubCategoryMaster_GetSubCategoryFromCategory]
    @CategoryIDF Uniqueidentifier
AS
BEGIN
    SELECT SubCategoryIDP,
           SubCategoryName,
           isActive
    FROM SubCategoryMaster
    WHERE CategoryIDF = @CategoryIDF AND isActive = 1
	For JSON Path
END
GO
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_Insert_Update]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 01-02-2024
-- Description: Insert and Update Records Into SubCategoryMaster
-- =============================================

CREATE PROCEDURE [dbo].[SubCategoryMaster_Insert_Update]
    @SubCategoryIDP Uniqueidentifier,
	@CategoryIDF Uniqueidentifier,
	@CompanyIDF Uniqueidentifier,
	@SiteIDF nvarchar(max),
    @SubCategoryName NVarchar(100),
	@SubCategoryImagePath Nvarchar(max),
	@OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@SubCategoryIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO SubCategoryMaster
                (
                  SubCategoryName,
				  CategoryIDF,
				  CompanyIDF,
				  SiteIDF,
				  SubCategoryImagePath,
                  CreatedBy
				 )
        VALUES (
                 @SubCategoryName,
				 @CategoryIDF,
				 @CompanyIDF,
				 @SiteIDF,
				 @SubCategoryImagePath,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE SubCategoryMaster
        SET SubCategoryName = @SubCategoryName,
			CategoryIDF = @CategoryIDF,
			CompanyIDF = @CompanyIDF,
			SiteIDF = @SiteIDF,
			SubCategoryImagePath = @SubCategoryImagePath,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE SubCategoryIDP = @SubCategoryIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsActive]    Script Date: 20-02-2024 15:34:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateIsActive]
    @ID uniqueidentifier,
    @isActive bit,
    @ExcludeTable nvarchar(100) = NULL,
    @ResultOutput nvarchar(max) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    -- Declare variables
    DECLARE @TableName nvarchar(100)
    DECLARE @ColumnName nvarchar(100)
    DECLARE @Result nvarchar(max) = ''

    -- Cursor to iterate through tables and columns
    DECLARE table_cursor CURSOR FOR
    SELECT t.name AS TableName, c.name AS ColumnName
    FROM sys.tables t
    INNER JOIN sys.columns c ON t.object_id = c.object_id
    WHERE c.system_type_id = 36 -- Filter only uniqueidentifier type
    AND t.name <> ISNULL(@ExcludeTable, '') -- Exclude the specified table if provided
    AND t.name NOT IN ('ErrorLogs', 'ProcErrorLog') -- Exclude additional tables
    AND EXISTS (SELECT 1 FROM sys.columns WHERE name = 'isActive' AND object_id = t.object_id) -- Check if isActive column exists
    ORDER BY t.name, c.name

    OPEN table_cursor

    FETCH NEXT FROM table_cursor INTO @TableName, @ColumnName

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Check if the ID exists in the current table and column
        IF EXISTS (SELECT 1 FROM sys.columns WHERE name = @ColumnName AND object_id = OBJECT_ID(@TableName))
        BEGIN
            -- Check if the current table is not the excluded table
            IF @TableName <> @ExcludeTable
            BEGIN
                DECLARE @SQLQuery nvarchar(max)
                SET @SQLQuery = 'IF EXISTS (SELECT 1 FROM ' + QUOTENAME(@TableName) + ' WHERE ' + QUOTENAME(@ColumnName) + ' = @ID) '
                              + 'BEGIN '
                              + '   UPDATE ' + QUOTENAME(@TableName) + ' SET isActive = @isActive WHERE ' + QUOTENAME(@ColumnName) + ' = @ID; '
                              + '   SET @Result = @Result + ''' + @TableName + '.' + @ColumnName + ', '' '
                              + 'END'
                EXEC sp_executesql @SQLQuery, N'@ID uniqueidentifier, @isActive bit, @Result nvarchar(max) OUTPUT', @ID, @isActive, @Result OUTPUT
            END
        END

        FETCH NEXT FROM table_cursor INTO @TableName, @ColumnName
    END

    CLOSE table_cursor
    DEALLOCATE table_cursor

    -- Remove trailing comma and space if the result is not empty
    IF LEN(@Result) > 0
    BEGIN
        SET @Result = LEFT(@Result, LEN(@Result) - 1)
        SET @ResultOutput = ' Also, reflected in ' + @Result
        PRINT @ResultOutput
    END
    ELSE
    BEGIN
        SET @ResultOutput = NULL
        PRINT 'Record does not exist in any table.'
    END
END
GO
USE [master]
GO
ALTER DATABASE [DBQRT] SET  READ_WRITE 
GO
