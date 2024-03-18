USE [master]
GO
/****** Object:  Database [DBQRT]    Script Date: 26-02-2024 16:14:15 ******/
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
/****** Object:  User [QRTDBUser#2024]    Script Date: 26-02-2024 16:14:20 ******/
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
/****** Object:  UserDefinedFunction [dbo].[splitstring]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[CartMaster]    Script Date: 26-02-2024 16:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartMaster](
	[CartIDP] [uniqueidentifier] NOT NULL,
	[MenuItemIDF] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NOT NULL,
	[SiteIDF] [uniqueidentifier] NOT NULL,
	[IsOrdered] [bit] NULL,
	[Quantity] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_CartMaster] PRIMARY KEY CLUSTERED 
(
	[CartIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
	[priorityIndex] [int] NULL,
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
/****** Object:  Table [dbo].[CityMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[CompanyMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[CompanyTypeMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[ErrorLogs]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[FeedbackQuestionsMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[MenuMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
	[Seasonal] [nvarchar](100) NULL,
	[ItemImagePath] [nvarchar](max) NULL,
	[isActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
	[QuantitySpecification] [nvarchar](100) NULL,
	[IsVeg] [bit] NULL,
 CONSTRAINT [PK_MenuMaster] PRIMARY KEY CLUSTERED 
(
	[MenuItemIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModifierMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[OrderMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[ProcErrorLog]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[SeatMappingMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
	[isActive] [bit] NULL,
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
/****** Object:  Table [dbo].[SitesMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[StateMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[SubCategoryMaster]    Script Date: 26-02-2024 16:14:21 ******/
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
/****** Object:  Table [dbo].[TaxesMaster]    Script Date: 26-02-2024 16:14:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaxesMaster](
	[TaxIDP] [uniqueidentifier] NOT NULL,
	[CompanyIDF] [uniqueidentifier] NOT NULL,
	[SiteIDF] [nvarchar](max) NOT NULL,
	[TaxName] [nvarchar](100) NOT NULL,
	[TaxRate] [decimal](10, 2) NOT NULL,
	[isActive] [bit] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[UpdationDate] [datetime] NULL,
	[UpdatedBy] [uniqueidentifier] NULL,
 CONSTRAINT [PK_TaxesMaster] PRIMARY KEY CLUSTERED 
(
	[TaxIDP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202401300652506_InitialCreate', N'QRT.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE436127D5F20FF20E82959382D5F7606B3463B81D3B6B3C68E2F3BED09F236604BECB63012A548946363912FDB87FDA4FD852D4AD48D1789EA96BBDBC1008316593C552C16C962B1E8FFFDE7BFD31F9FC3C07AC249EA47E4CC3E9A1CDA16266EE4F96475666774F9FD07FBC71FBEF9CBF4D20B9FAD5F4ABA1346072D497A663F521A9F3A4EEA3EE210A593D07793288D9674E246A183BCC8393E3CFCBB7374E46080B001CBB2A69F3242FD10E71FF0398B888B639AA1E026F27090F272A899E7A8D62D0A711A23179FD9FFFAF43029A86CEB3CF0114830C7C1D2B61021114514E43BFD9CE2394D22B29AC750808287971803DD120529E6729FD6E4A65D383C665D70EA8625949BA5340A07021E9D709D3862F3B5346B573A03AD5D8276E90BEB75AEB933FBDAC379D1A7280005880C4F6741C288CFEC9B8AC5791ADF623A291B4E0AC8AB04E07E8F92AF9326E28165DCEEA0B2A1E3C921FB7760CDB28066093E2338A3090A0EACFB6C11F8EE3FF1CB43F41593B393A3C5F2E4C3BBF7C83B79FF377CF2AED953E82BD0B50AA0E83E89629C806C7859F5DFB69C763B476C58356BB429B402B604D3C1B66ED0F3474C56F41126CAF107DBBAF29FB1579670E3FA4C7C983DD08826197CDE6641801601AEEA9D4E9EECFF0EAEC7EFDE8FC2F5163DF9AB7CE805FE30711298579F7090D7A68F7E5C4CAFD6787FE164574914B2EFB67D15B55FE65196B8AC339196E401252B4CDBD24D9DDA788D4C9A418D6FD625EAFE9B369354366F2529EBD03A33A164B1EDD950CAFBBA7C8D2DEE3C8E61F072D3621AE932B87A939A08AD0E2CA8AB4DE5C8D4540874E1CFBCF25D86C80F4658FA0CB880B7B1F4931057BDFC2902434364B0CCF7284D61E67BFF40E96387E8F07304D1E7D8CD1230C8394561FCEADCEE1F23826FB370C1EC7C7BBC461B9A87DFA32BE4D228B924ACD5C6781F23F76B94D14BE25D208A3F53B704649F0F7E680E308A38E7AE8BD3F40A8C197BB3089CE912F09AD093E3C1706C61DAB5EB310B901FAA7D0F6109FD5292D6FE879A42F24134642A3FA44BD48FD1CA2766A296A47A510B8A5E5139D95051199899A49C522F684ED02B6741359A67978FD0F8AE5D0EBBFFBEDD669BB76E2D68A8710E2B24FE19139CC032E6DD234A7142EA1130593776E12CE4C3C798BEFADE9473FA0505D9D8ACD69A0DF92230FE6CC861F77F36E46242F193EF31AFC4E0C0531203BC11BDFA2CD53FE704C9B63D1D5ADDDC36F3EDAC01BAE9729EA691EBE7B34011EAE2818AB6FCE0C359FD518BA23762E4033A0686EEB32D0F4AA06FB6685477E402079862EBDC2D42813394BAC893D5081DF2060856EEA80AC1EA08485BB8BF4A3CC1D271C21A2176084A61A6FA84CAD3C227AE1FA3A0574B424BC32D8CF5BDE221D65CE01813C6B0571326CCD5010F2640C54718943E0D4D9D86C5751BA2C66BD58D799F0B5B8FBB1487D88A4DF6F8CE1ABBE4FEDBAB1866B7C6B6609CDD2A3111401BBCDB8581F2B38AA9018807977D3350E1C4A43150EE526DC540DB1ADB8181B655F2E60CB438A29A8EBF705EDD37F36C1F94B7BFAD77AA6B07B6D9D2C79E9966E17B421B0A2D70229BE7C58255E267AA389C819CFC7C967257573411063EC7B41DB2A9FD5DA51FEA74838846D405581B5A0F28BFF69380A4093540B83296D7291DF72206C09671B74E58BEF60BB00D1B90B19BD79F0D42FD25A9689C46A78FAA67953548466E745868E0280C425CBCDA1D37508A2E2E2B2BC6C4171EE20D373AC607A343413D9EAB4649656746D752699AFD5A523964435CB28DB424B84F1A2D959D195D4BDC46FB95A4700A06B8051BA9A8BD858F34D9CA4847B5DB547553A7C886E2055347933635BD4171EC9355238D8A9758F322876AF6FD7C7892515860386EAAC835AAA4AD38D128412B2CD4026B90F4CA4F527A81285A2016E79979A144A6DC5B35CB7FC9B2B97DCA8358EE032535FB5DB4685CD6B7F658D909E16DAFA06721F364F2F0B962DCD5CD2D96CE8602942822F6B328C842A277ACF4AD8B7BBB66FBA24446983A82FC92E3246949726FDB2A371A1079326C383895BFB2FE00E921746A2EBDCDA6A2751EA81EA50C4835517441AA9D0D98CE71311A24D1171C3E46BD08AF338F78024A1380170DC468E43048608D3A73D4769A4913B35D638E28E492342185AA01523633465A42362BD6C2D368544D61CE41CE1169A2CBB5E6C88A6C9126B4A27A0D6C85CC629D39AA22A1A409ACA836C7AEB34BC4C5738F772AED0965F056551C5E37DBAB3418AFB3128EB3D535EEE89B408DE28158FC165E02E3E57B6945DA13DC602B2A62159B59910643BFD2B46EB5DB0B4DE755BC1EB37555DD5ACCBBAEEAF578C36CF5552D423AB8892415F7EA00271CD4A6FCD0D4FF08463A451524B655AA1136F29794E270C20826F3DF8259E063B66C97043788F84B9CD2223DC33E3E3C3A16DED3ECCFDB16274DBD4071E8D43D70698FD91632ADC8134ADC4794C8790F1BBCFFA841A590F235F1F0F399FDEFBCD5691E9D60BFF2E203EB3AFD4CFCDF32A87848326CFD21E7718E930F6FF002A312F48F37F1B4C15CE5D7BF7E299A1E5877094CA753EB5050F43AC3DF7EF030489AA2E906D2ACFD0CE2EDCEB6D69B0325AA305BD67F62B0F0E928CF0B4A29BF0DD1F3774345533E21D80851F14C602CBC5154A87B06B00E96F60980079F347F0230ACB3EA2701EB88A67D0EE093E160E26300F365A86CB9C37D487150DAC69294EBB937997AA3CCCA5DEF4D52CEF546135DCEAB1E00376AEEF4662ECA1BCB491E6DEB54A41C8F86BD4BBB7FF53CE37D492DAE9DF6DD66146F3389B8E3E2E84F953BBC07D96E8AEC9DDD67086FDBD67491DF3D4FB31C9607BC67C6C6B7F9DD67FB6EDBD87401E23D37B64139BD7B666BBBDA3F776C69C65BE8CE3374E56423CD0D8E2A8ADC97815B84DCE1F8BF88C0080A8FB27838A94EF9EA4A57ED615893E899EA73CD44C6D2C491F84A14DD6C87F5956FF89D9DE534DD6C35199A5DBCF9FADFC99BD374F3D6E43DEE2277589979A8CAE7EE59C7BAD2A4DE52AE70AB273DA9E97D3E6BE775FC5B4A0D1E4529ADD9A3B95D7E3B99C0A3A864CCA93320F357BE2886BDB3F1371561FF4EFD550DC1FEC222C16E6BD7AC68AEC9322A376F41A2924488D0DC608A3CD852CF13EA2F914BA19A05A0F397DF79508F5D832CB0774DEE321A6714BA8CC345D00A783127A08B7F9EDEDC96797A17B3AF748C2E80983E0BDCDF919F323FF02AB9AF1431210D04F32E78B8978D256561DFD54B85741B114320AEBECA297AC0611C00587A47E6E809AF231B98DF47BC42EE4B1D01D481F40F445BEDD30B1FAD1214A61CA36E0F9F60C35EF8FCC3FF0147DE7B545A540000, N'6.4.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'8E3194B7-3293-4AAD-8400-92EBD4296F8A', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'F3CF8A99-B384-4218-B8A2-679C7F9F683D', N'CEO')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'E9F13736-56E3-4D31-BB92-F1D4A3643E56', N'Chef')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'55B00FAC-C805-44B3-80E3-3337B82EAA33', N'GM-Site Wise')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'51DAFF68-D4FF-4E29-972E-085459EB28EC', N'Operator')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'0B294A06-4B35-4C5A-9614-0F7C9CDED588', N'User')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1C7EF9E6-F05D-4759-971F-3E7CDD2DC5F8', N'Waiter')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ae367c6e-3b1e-4b45-91fd-f77049fa8482', N'0B294A06-4B35-4C5A-9614-0F7C9CDED588')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'078b13cc-5bf4-408d-a2b0-bbdac3ac4c27', N'1C7EF9E6-F05D-4759-971F-3E7CDD2DC5F8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7957ebe6-007b-4674-8e33-5aaa7689265a', N'1C7EF9E6-F05D-4759-971F-3E7CDD2DC5F8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ad71fc0d-5d96-4e4a-8037-02aebeb2df31', N'1C7EF9E6-F05D-4759-971F-3E7CDD2DC5F8')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'03add488-8eee-4bdb-848b-f5871aff3be6', N'51DAFF68-D4FF-4E29-972E-085459EB28EC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'05de934b-ee78-41b0-bd47-460e504739db', N'51DAFF68-D4FF-4E29-972E-085459EB28EC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'aea6f5b5-275d-4385-9b8f-3199c44cccca', N'51DAFF68-D4FF-4E29-972E-085459EB28EC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd19c23df-4a11-45ac-a02e-96fd4a275a7f', N'51DAFF68-D4FF-4E29-972E-085459EB28EC')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'09d4f975-575d-4bc5-b5e5-d23a28d82a6d', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'140e8efc-26d7-4282-8e5e-74658e44cf9b', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'446f5b6d-207a-4922-b7c9-e5b9d31a4964', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4ce4902a-e2ef-4467-b7d5-d4093d5aacfb', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'615f5bd1-319e-469a-ac74-490290d67e38', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'db471536-af3c-43d3-895a-f0e5cacfbe62', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', N'55B00FAC-C805-44B3-80E3-3337B82EAA33')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'46092e15-4d8e-40ce-889f-86af68409667', N'8E3194B7-3293-4AAD-8400-92EBD4296F8A')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'94ce4e3b-23be-4720-98d0-9c3f78ae6603', N'8E3194B7-3293-4AAD-8400-92EBD4296F8A')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'8E3194B7-3293-4AAD-8400-92EBD4296F8A')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ea80801e-d8d6-464e-a77a-975fb4bd02e0', N'8E3194B7-3293-4AAD-8400-92EBD4296F8A')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1484c001-2bf0-4427-acbd-6c9731ca9925', N'E9F13736-56E3-4D31-BB92-F1D4A3643E56')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'16e2d929-a56a-430e-b833-47a14a591811', N'E9F13736-56E3-4D31-BB92-F1D4A3643E56')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8e02711f-2162-40de-a5b5-f3dab7dd1df9', N'E9F13736-56E3-4D31-BB92-F1D4A3643E56')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'F3CF8A99-B384-4218-B8A2-679C7F9F683D')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'23302c8f-bc36-4a79-8a30-8f33a9536d22', N'F3CF8A99-B384-4218-B8A2-679C7F9F683D')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31e78ca3-7708-43ac-b576-0aa1de1f9f80', N'F3CF8A99-B384-4218-B8A2-679C7F9F683D')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ab49f82a-269f-4e61-9aca-171a749b2a8f', N'F3CF8A99-B384-4218-B8A2-679C7F9F683D')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ac59b16f-7567-472a-9a92-3742af812e13', N'F3CF8A99-B384-4218-B8A2-679C7F9F683D')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'chris@mcdonald.com', 0, N'ANTEDokXgB1al4FQpP2T6XsmZ0UBqL7Tg4zxDmrQ/KmyizohrW1nNV3zMKJbp2YuxA==', N'2aed3063-7cb2-4564-8db9-c1d73ddfd16a', N'8928304199', 0, 0, NULL, 0, 0, N'chris@mcdonald.com', N'Male', N'Admin@123', N'Chris', N'Kempczinski', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'DEAE5355-E9D9-4B99-A3F9-7BEE6A000890', CAST(N'2024-02-14T10:53:49.497' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:49:41.553' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'03add488-8eee-4bdb-848b-f5871aff3be6', N'nandini.desai@mcdonald.com', 0, N'AGDUzAJqrhr6p8Xaz728pM0RNN+b8PGuGCbzuJfFblSI4nTs/qgKrpsGabldakGDYw==', N'eed30c8c-7bdb-431f-902f-feca31efce6b', N'9144568989', 0, 0, NULL, 1, 0, N'nandini.desai@mcdonald.com', N'Female', N'Admin@123', N'Nandini', N'Desai', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'deae5355-e9d9-4b99-a3f9-7bee6a000890,6cb14b37-9cd4-457c-b4a5-86083c17e156', CAST(N'2024-02-25T16:56:51.280' AS DateTime), N'09d4f975-575d-4bc5-b5e5-d23a28d82a6d', CAST(N'2024-02-25T18:21:09.783' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'deae5355-e9d9-4b99-a3f9-7bee6a000890')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'05de934b-ee78-41b0-bd47-460e504739db', N'shalini.gupta@mcdonald.com', 0, N'AOt5S8VZzsHsXCdd7nOi+Cj13xggurP2RA+b8EWutN/t1yMrSjtFj/Y61nD+OWtmOw==', N'f84d97f3-fb35-4108-ba36-f0236ccd0897', N'8928304199', 0, 0, NULL, 1, 0, N'shalini.gupta@mcdonald.com', N'Female', N'Admin@123', N'Shalini', N'Gupta', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-24T13:34:50.737' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T18:26:08.620' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'dc46044f-e764-4a07-b065-8b085fd71533')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'078b13cc-5bf4-408d-a2b0-bbdac3ac4c27', N'deepak.mehra@mcdonald.com', 0, N'AA9yJY+D4vV2r9vJPYehtl9Ig4uDefNr3Cx9FTEXRTIk718M/7LrFH8MdWJrhUcAmQ==', N'dff41b2e-7c90-45fd-9215-37bc0e6692c3', N'1111111111', 0, 0, NULL, 1, 0, N'deepak.mehra@mcdonald.com', N'Female', N'Admin@123', N'Deepak', N'Mehra', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159,157e00a8-3198-48c9-b68f-d68acf90c549', CAST(N'2024-02-16T08:20:15.340' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T18:24:51.780' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'96948819-7f12-4a5b-82f1-b007efc6b159')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'09d4f975-575d-4bc5-b5e5-d23a28d82a6d', N'rohan.sharma@gmail.com', 0, N'APiN9p8RstsH9IorfHT1i01vEF2ipaYDdvOWC5r0A6xT12FRcqo3r1ly8AYaoddTHg==', N'075947e2-8a16-4326-ac8c-42fdc4af6dca', N'9721313588', 0, 0, NULL, 1, 0, N'rohan.sharma@gmail.com', N'Male', N'Admin@123', N'Rohan', N'Sharma', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'deae5355-e9d9-4b99-a3f9-7bee6a000890', CAST(N'2024-02-25T16:50:01.747' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL, 1, N'deae5355-e9d9-4b99-a3f9-7bee6a000890')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'140e8efc-26d7-4282-8e5e-74658e44cf9b', N'prashant.chauhan@mcdonald.com', 0, N'ANkhbRjNmd5fXfXWC3Os4wtucidjB664J0HoXWkpBAxipA7xqo9m03wS8c40InlwHg==', N'297269ce-9cd8-4904-8a44-5dacf3be359d', N'9090901990', 0, 0, NULL, 1, 0, N'prashant.chauhan@mcdonald.com', N'Male', N'Admin@123', N'Prashant', N'Chauhan', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-24T11:26:50.543' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T18:22:31.127' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'dc46044f-e764-4a07-b065-8b085fd71533')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'1484c001-2bf0-4427-acbd-6c9731ca9925', N'viveksingh@mcdonald.com', 0, N'ANZYvIIfSGIw/edjwFIoHISBSEoJWGkQUtfd9p0naxOdxgcnGxHG0gcw7KgeqJxhYQ==', N'd7057d2e-8394-4cba-9b07-1fd97201a015', N'1111111111', 0, 0, NULL, 1, 0, N'viveksingh@mcdonald.com', N'Male', N'Admin@123', N'Vivek', N'Singh', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,157e00a8-3198-48c9-b68f-d68acf90c549', CAST(N'2024-02-15T17:30:21.037' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T18:27:33.920' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'f41fc129-a275-4802-8571-5901470a288b')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'16e2d929-a56a-430e-b833-47a14a591811', N'kavita.malhotra@mcdonald.com', 0, N'ABGwmVEkEhxaADnxIFvtFeQoha4Uv1t53VQhUCgfiDNDjgA0NQQ061RqnuRKw9d6lQ==', N'034ab97a-17e4-4445-bceb-d38b85ad8550', N'1111111111', 0, 0, NULL, 1, 0, N'kavita.malhotra@mcdonald.com', N'Female', N'Admin@123', N'Kavita', N'Malhotra', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', CAST(N'2024-02-15T16:49:11.307' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T18:28:37.953' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'e166be98-ed02-4ded-9cec-17778d6d90ce')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'23302c8f-bc36-4a79-8a30-8f33a9536d22', N'abcdsef@gmail.com', 0, N'AHvtkxdep4ZttDuVuYO5YAbB5C7XqWTQ4f3N2DAXAI1MPRgR78lZxSB5lbJgx4y1eA==', N'33dc6149-e558-416d-9f01-56dd5b73c108', N'9999999999', 0, 0, NULL, 0, 0, N'abcdsef@gmail.com', N'Male', N'Admin@123', N'aaaaaaaaaaa', NULL, N'5a990481-bf8b-4be3-bf5c-0dbcdc105719', N'CC8FE6C2-F507-49BF-9DBC-5CA3BC8DA868', CAST(N'2024-02-14T16:52:46.977' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'31e78ca3-7708-43ac-b576-0aa1de1f9f80', N'arjunmehra@gmail.com', 0, N'ABpkW0Ko+LPGiSLjlWZdGc3m9rGD2vgaQrzArW9WSHV4nr6R1UZH6GLrmQpecRyZnQ==', N'581c37fd-a066-4476-93ba-f9eb2a8a7cf3', N'2222222222', 0, 0, NULL, 0, 0, N'arjunmehra@gmail.com', N'Male', N'Admin@123', N'Arjun', N'Mehra', N'f8436d66-20e2-4943-ae74-0e5018512212', N'8a618792-fad2-4783-8abd-59fea8ef02b8,d1fe709c-4b61-4a44-aa48-6e35459308ef', CAST(N'2024-02-16T17:26:56.970' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T11:15:29.390' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'8a618792-fad2-4783-8abd-59fea8ef02b8')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'446f5b6d-207a-4922-b7c9-e5b9d31a4964', N'chaman.chatrapati@mcdonald.com', 0, N'ANNVihDcPUwkrlmME4YHuQbZT2CFucBbRryZ7Kq7VuBvdF24qL3x+p8RAx/Ms0QVOg==', N'48f8b15e-3053-4673-99b8-5f9c9cf3acff', N'1221212222', 0, 0, NULL, 1, 0, N'chaman.chatrapati@mcdonald.com', N'Male', N'Admin@123', N'Chaman', N'Chatrapati', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-15T15:02:46.610' AS DateTime), N'aea6f5b5-275d-4385-9b8f-3199c44cccca', CAST(N'2024-02-25T18:30:10.533' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'96948819-7f12-4a5b-82f1-b007efc6b159')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'46092e15-4d8e-40ce-889f-86af68409667', N'aditya@qrt.com', 0, N'AF4dta7fJ7fab08MO3pGwEpDOTHToe+Wb3iOqY5B9UNuDqJRliolauKJjFxUIg440g==', N'b4492ffa-5132-4c36-8a2b-5a50ea3165a8', N'1212121212', 0, 0, NULL, 1, 0, N'aditya@qrt.com', N'Male', N'Admin@123', N'Aditya', N'Joshi', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-14T10:48:24.430' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-14T10:50:11.540' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', N'prashant@gmail.com', 0, N'AHQseJvGkEqK3ioG+QCxzI/HBAVjJFWKvenR9yPuC9eCZnitvKeFCUK/AVvPS0e7UQ==', N'321bdf1c-3c64-48e6-95dc-89e7a11656ea', N'9090909090', 0, 0, NULL, 1, 0, N'prashant@gmail.com', N'Male', N'Admin@123', N'Prashant', N'Chauhan', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', CAST(N'2024-02-16T13:01:09.080' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', CAST(N'2024-02-26T13:09:49.577' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'8caf47de-0e0d-428f-9872-b6caf0744fa8')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'4ce4902a-e2ef-4467-b7d5-d4093d5aacfb', N'a@a.com', 0, N'AL990ReOe2/sbPfNpwnHSu3vgW6C6k3tPjN2VBSZGgSAeEDOTgEUCVOFnrSMAAqvSA==', N'a4af21b8-9272-47e3-ad20-8137372ac308', N'8928304199', 0, 0, NULL, 1, 0, N'a@a.com', N'Male', N'Admin@123', N'AJ', N'aa', N'f8436d66-20e2-4943-ae74-0e5018512212', N'8a618792-fad2-4783-8abd-59fea8ef02b8,d1fe709c-4b61-4a44-aa48-6e35459308ef', CAST(N'2024-02-16T17:49:12.190' AS DateTime), N'31e78ca3-7708-43ac-b576-0aa1de1f9f80', CAST(N'2024-02-16T17:50:20.600' AS DateTime), N'31e78ca3-7708-43ac-b576-0aa1de1f9f80', 1, N'8a618792-fad2-4783-8abd-59fea8ef02b8')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'615f5bd1-319e-469a-ac74-490290d67e38', N'arjun.sengupta@mcdonald.com', 0, N'AA93CK9jdaKRYliWjliGb9HOYEgZXniYLgav1pDTKNu98XMpoAhVzmPvKpVlFbkMvQ==', N'2b89dc69-a619-48e5-b369-e0bf7f049ffd', N'8928304199', 0, 0, NULL, 1, 0, N'arjun.sengupta@mcdonald.com', N'Male', N'Admin@123', N'Arjun', N'Sengupta', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899,f41fc129-a275-4802-8571-5901470a288b,96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-24T12:01:35.660' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T18:21:52.733' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'7957ebe6-007b-4674-8e33-5aaa7689265a', N'manoj.kumar@mcdonald.com', 0, N'AHRjblaRi/wcPVEvdLt8qB77p5TdLiMd5zQQSxfbVw0D9QQ69vZ2Xi8dghPDnYArzw==', N'ea22ce26-b482-4759-8f9b-718db29f4fea', N'1132233223', 0, 0, NULL, 1, 0, N'manoj.kumar@mcdonald.com', N'Male', N'Admin@123', N'Manoj', N'Kumar', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-15T15:07:21.363' AS DateTime), N'aea6f5b5-275d-4385-9b8f-3199c44cccca', CAST(N'2024-02-25T18:29:24.820' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'96948819-7f12-4a5b-82f1-b007efc6b159')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', N'chhagan@mcdonald.com', 0, N'AIfwUcdmhMkUtgOrDtUs2CNkea1J+gFm2sDPA0zGgFPLGUj2XyyH4EJR9Ned70CzfQ==', N'11d52227-fac8-4d81-a352-b72bc6d7eecc', N'1212121212', 0, 0, NULL, 1, 0, N'chhagan@mcdonald.com', N'Male', N'Admin@123', N'Chhagan ', N'Chhatri', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-14T13:53:34.950' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-23T11:47:43.800' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'8e02711f-2162-40de-a5b5-f3dab7dd1df9', N'baburao@gmail.com', 0, N'AKDqxlIuHlXWUGaTOTqq+9DZZmkty8O8Kv7muc6M9Uyr7MBqRJHWkTXYTzg1fmqX7Q==', N'8787e53f-897d-4617-b01d-332a84649d10', N'9999999999', 0, 0, NULL, 1, 0, N'baburao@gmail.com', N'Male', N'Admin@123', N'baburao', N'Ganapatrao', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c,8caf47de-0e0d-428f-9872-b6caf0744fa8', CAST(N'2024-02-16T17:32:13.637' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL, 1, N'9412a921-3afb-4db7-a74b-431eb3b5e00c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'94ce4e3b-23be-4720-98d0-9c3f78ae6603', N'prashant@qrt.com', 0, N'AOD6Y5fFnP92cZC4R1G3pXzjtwyuXaQOXENeaPt29TJWyLod7je/ONxF5xb4jOZHGw==', N'a5ea2b99-3ef4-4fb8-af63-5fd32df86b4e', N'21121222121', 0, 0, NULL, 1, 0, N'prashant@qrt.com', N'Male', N'Admin@123', N'Prashant', N'Chauhan', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-14T10:50:52.730' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'admin@admin.com', 0, N'AI+ACF2tumYlHdihfQvTsSHVOBGCPj/s6FWA635JMVNrQIVJgC9Uo1DVVVR/c7gFcQ==', N'e63c9ff3-2846-4a14-89c2-987b9418cefe', N'2345679123', 0, 0, NULL, 1, 0, N'admin@admin.com', N'Male', N'Admin@123', N'Admin', N'Admin', N'00000000-0000-0000-0000-000000000000', N'380C4C1A-89C5-499B-93B4-06051D473498', CAST(N'2024-02-13T18:32:02.243' AS DateTime), N'95324fa2-df82-44ba-8770-40010ad79ef1', NULL, NULL, 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'ab49f82a-269f-4e61-9aca-171a749b2a8f', N'rajeshpatel@gmail.com', 0, N'AE4tqRHwAeeMNMRU9I5tArQFzibgn392oqRrAdaQGAwMpLwnWgS7nnedB3WCsAizvw==', N'1ae04aa8-ae4f-426a-afb7-c57515079902', N'9808088888', 0, 0, NULL, 0, 0, N'rajeshpatel@gmail.com', N'Male', N'Admin@123', N'Rajesh', N'Patel', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1DDE1831-685D-4A07-813F-2742A2CE4C05', CAST(N'2024-02-15T12:42:22.820' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:39:42.100' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'ac59b16f-7567-472a-9a92-3742af812e13', N'vikramsinghania@gmail.com', 0, N'ANJMwe8bB7VssMU7IG/v9XA5vOyrO6/P9/gkw6SdsKmG4HbxvWgNuckArUMuG3m1wA==', N'754e9743-56e2-40fe-90f3-9708c4606592', N'6700067000', 0, 0, NULL, 0, 0, N'vikramsinghania@gmail.com', N'Male', N'Admin@123', N'Vikram', N'Singhania', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', CAST(N'2024-02-16T12:50:18.857' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:20:26.003' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'ad71fc0d-5d96-4e4a-8037-02aebeb2df31', N'neha.jain@mcdonald.com', 0, N'AAa97Q6viHGL0f4r790dDuGl6fAXpA/y8G0LDBhBSdjqTVhHkdz64qgMqacsFHct5A==', N'a79dc2b2-9f35-41ad-be5f-cf8191178aa1', N'1111111111', 0, 0, NULL, 1, 0, N'neha.jain@mcdonald.com', N'Female', N'Admin@123', N'Neha', N'Jain', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-15T18:52:00.813' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-25T18:26:41.693' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'96948819-7f12-4a5b-82f1-b007efc6b159')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'ae367c6e-3b1e-4b45-91fd-f77049fa8482', N'adityajoshi@gmail.com', 0, N'ADLnu1Hi6gbgAC+fuJRr5Oovn9JcEo6Y8cEJ+Pk8S9Lh54RQLRn902K7y1gZBA+Ikw==', N'cafdfd92-96a4-47e1-b2ca-8fb7778e564f', N'2121212121', 0, 0, NULL, 1, 0, N'adityajoshi@gmail.com', N'Male', N'Admin@123', N'Aditya', N'Joshi', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,96948819-7f12-4a5b-82f1-b007efc6b159', CAST(N'2024-02-15T15:27:47.350' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'aea6f5b5-275d-4385-9b8f-3199c44cccca', N'magan.mukhrji@mcdonald.com', 0, N'AOL6QD802AiArN2B8d3YGLIZZhIaypMddJOwItYVUP7MKPMlUPK32NKwwagyu6y5PQ==', N'44a93b91-14d4-4dcd-b8b6-276942d14d85', N'1212121212', 0, 0, NULL, 1, 0, N'magan.mukhrji@mcdonald.com', N'Male', N'Admin@123', N'Magan', N'Mukhrji', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,6cb14b37-9cd4-457c-b4a5-86083c17e156', CAST(N'2024-02-15T14:58:21.197' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-25T18:30:53.920' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'e166be98-ed02-4ded-9cec-17778d6d90ce')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'd19c23df-4a11-45ac-a02e-96fd4a275a7f', N'hiteshah@gmail.com', 0, N'AJjWjbVef9XjupgJ8fzhjionzvLuNEdgaaNbA7TmN3fNwuyBpWKmKfRFSUumKvftaQ==', N'8941e571-e24a-4dc2-b286-2ca8171ceedc', N'9876543210', 0, 0, NULL, 1, 0, N'hiteshah@gmail.com', N'Male', N'Admin@123', N'Hitesh', N'Shah', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c,8caf47de-0e0d-428f-9872-b6caf0744fa8', CAST(N'2024-02-26T13:14:10.787' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T13:14:33.900' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', 1, N'9412a921-3afb-4db7-a74b-431eb3b5e00c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'db471536-af3c-43d3-895a-f0e5cacfbe62', N'natasha.choudhary@mcdonald.com', 0, N'ANG1PSL9xQPlMCRH0QZFKZpEgy++9kJZL/ImnfXbiqCHfuo+WiCaw/ReM4iL0OrFLg==', N'b69dcfd1-56c2-4f92-8c7a-e170c0053768', N'1111111111', 0, 0, NULL, 1, 0, N'natasha.choudhary@mcdonald.com', N'Female', N'Admin@123', N'Natasha', N'Choudhary', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', CAST(N'2024-02-22T12:22:42.837' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T18:23:49.580' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', 1, N'6cb14b37-9cd4-457c-b4a5-86083c17e156')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', N'magan@gmail.com', 0, N'AHQ5qmxADYSC0Cfqlx4K70oOXxB7ggqB4EEH2stsfomjmvFqHFF3zewFMFr7bx8ECg==', N'773b0f0c-c959-4f4f-a730-9dcc6dad74ce', N'8888888889', 0, 0, NULL, 1, 0, N'magan@gmail.com', N'Male', N'Admin@123', N'magan', N'm', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', CAST(N'2024-02-15T12:54:01.203' AS DateTime), N'ab49f82a-269f-4e61-9aca-171a749b2a8f', NULL, NULL, 1, N'3b36870a-7783-4d53-8035-e8203128f3b5')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [Gender], [UserPassword], [FirstName], [LastName], [CompanyIDF], [SiteIDF], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [ActiveSiteID]) VALUES (N'ea80801e-d8d6-464e-a77a-975fb4bd02e0', N'banshi@qrt.com', 0, N'ADYg5r60Zsa3f65axR0N5FdJnUkIPbr/2BUx7kHjDy7w7U/cn1PqTCDY2a/nSNL4sg==', N'753f65c4-d30b-4b4d-abe1-3a56dbbd88c7', N'12121212121', 0, 0, NULL, 1, 0, N'banshi@qrt.com', N'Male', N'Admin@123', N'Banshi', N'Vagadiya', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-14T10:51:25.693' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL, 1, NULL)
GO
INSERT [dbo].[CartMaster] ([CartIDP], [MenuItemIDF], [CompanyIDF], [SiteIDF], [IsOrdered], [Quantity], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'30a9359d-425a-41de-8837-5c86d2b42d72', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', 0, 3, 1, CAST(N'2024-02-23T00:00:00.000' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[CartMaster] ([CartIDP], [MenuItemIDF], [CompanyIDF], [SiteIDF], [IsOrdered], [Quantity], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'21afe7ba-12d8-41e6-b425-c4ca3bd876ab', N'98c41584-b268-41d1-8659-319ab8a17575', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', 0, 2, 1, CAST(N'2024-02-21T00:00:00.000' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
GO
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'b84ce96c-a80c-4343-968a-06dee05bf121', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Papad and Saladdd', N'~/Content/Images/CAT_638445483235382350.jpg', 3, 1, CAST(N'2024-02-26T12:44:27.957' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', CAST(N'2024-02-26T14:55:31.447' AS DateTime), N'd19c23df-4a11-45ac-a02e-96fd4a275a7f')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'd14e2a90-8c5c-43c1-90cf-0746dfff7015', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'Appetizer', N'~/Content/Images/CAT_638445480564423564.png', 1, 1, CAST(N'2024-02-16T13:35:56.350' AS DateTime), N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', CAST(N'2024-02-26T12:41:00.050' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Beverages', N'~/Content/Images/CAT_638444090284050211.jpg', 99, 1, CAST(N'2024-02-23T10:19:59.100' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T15:38:42.007' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'abc55fa5-5d2c-456d-848d-190d5f8efb19', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,96948819-7f12-4a5b-82f1-b007efc6b159', N'Hot Cakes', N'~/Content/Images/CAT_638445454730232008.png', 18, 1, CAST(N'2024-02-15T17:58:06.883' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-26T11:57:56.613' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'39f3d561-e7aa-4e75-b2ae-24dc8aa92da2', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899', N'TestTwo', N'~/Content/Images/CAT_638445589848530337.png', 3, 1, CAST(N'2024-02-26T15:43:11.280' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'1de9e7d0-8fd6-49dd-a915-ea8bd465f587')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'7feb158b-740b-44b8-9d6c-33c2526b55d1', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'Dal Batiiii', N'~/Content/Images/CAT_638445480832760222.png', 2, 1, CAST(N'2024-02-26T12:41:26.877' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', CAST(N'2024-02-26T15:39:59.257' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'4d064a95-4614-422b-b790-3d517cf44995', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Raitaq', N'~/Content/Images/CAT_638445483840089009.jpg', 4, 1, CAST(N'2024-02-26T12:46:27.610' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', CAST(N'2024-02-26T14:54:18.470' AS DateTime), N'd19c23df-4a11-45ac-a02e-96fd4a275a7f')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a8701ccb-51c8-4ce6-b80e-45cda50f36d1', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Regular Meal ', N'~/Content/Images/CAT_638445440314870512.png', 10, 1, CAST(N'2024-02-16T14:03:14.680' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T11:33:55.057' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a4c0eeb0-b0a0-499f-b277-463e276c427b', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899', N'Test', N'~/Content/Images/CAT_638445584849239161.jpg', 2, 1, CAST(N'2024-02-26T15:35:03.420' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, N'2947f39e-54bc-4fa8-a330-391ea29d01f6')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'd111f77c-b4dc-4776-95a8-58ba59dce28d', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156,96948819-7f12-4a5b-82f1-b007efc6b159', N'McCafe Coffees', N'~/Content/Images/CAT_638444096017156009.jpg', 34, 1, CAST(N'2024-02-19T12:01:40.380' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T22:13:21.890' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'c21db85a-91d7-4750-b97f-84a0382f9cee', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'TestTwo', N'~/Content/Images/CAT_638445589848530337.png', 3, 1, CAST(N'2024-02-26T15:43:11.860' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'395e7574-059e-4cba-a966-ecb7286ee3db')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'926a9523-c69c-4168-9500-8ebbe8203633', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'380c4c1a-89c5-499b-93b4-06051d473498,1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Main Course', N'~/Content/Images/CAT_638443939619850702.jpg', 10, 1, CAST(N'2024-02-15T13:00:37.223' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', CAST(N'2024-02-24T17:52:42.267' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'18439683-1bc8-44da-89af-94fe886e0e2a', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,96948819-7f12-4a5b-82f1-b007efc6b159', N'Fruit Bowl', N'~/Content/Images/CAT_638445452310359026.jpg', 4, 1, CAST(N'2024-02-20T17:56:50.903' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-26T11:53:54.610' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'e58598e0-c559-48ef-847f-97159294dc0b', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Desserts', N'~/Content/Images/CAT_638443941547658639.jpg', 99, 1, CAST(N'2024-02-15T12:59:58.680' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', CAST(N'2024-02-24T17:55:55.020' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'567cec1b-75e1-4108-8b84-a62e0ac2e4e2', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Starter', N'~/Content/Images/CAT_638443936861999134.jpg', 1, 1, CAST(N'2024-02-22T17:31:44.003' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T17:48:06.453' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a6a264cc-0991-4447-af0c-af7af2414631', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Test', N'~/Content/Images/CAT_638445584849239161.jpg', 2, 1, CAST(N'2024-02-26T15:35:54.653' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, N'7854631f-b960-42fc-84e5-eba02bcadc23')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'5f4f1d49-faa4-439f-96bd-b165b154f221', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'Sweet', N'~/Content/Images/CAT_638445484393733337.jpg', 5, 1, CAST(N'2024-02-26T12:47:22.973' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, N'3af517aa-fef4-4e97-89f6-0b6d39d75d64')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3253f7fc-761a-470e-9fbf-b3a7a518facb', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Sausage Mcmuffin', N'~/Content/Images/CAT_638445456290782565.png', 3, 1, CAST(N'2024-02-14T17:03:27.640' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-26T12:00:32.673' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'51b84cd3-7d8e-427c-a093-b5f7c07cd3c0', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,643bd02c-6e67-4f0d-91a1-2b9d4fc86899,f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159,157e00a8-3198-48c9-b68f-d68acf90c549', N'Burger', N'~/Content/Images/CAT_638444091049273103.jpg', 1, 1, CAST(N'2024-02-23T18:51:28.117' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T22:05:05.130' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,157e00a8-3198-48c9-b68f-d68acf90c549', N'Appetizers', N'~/Content/Images/CAT_638444085863222022.jpg', 1, 1, CAST(N'2024-02-20T17:50:22.817' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T21:56:26.480' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'9f74f3bc-b7ed-4959-862c-b6d7d0bc4430', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'deae5355-e9d9-4b99-a3f9-7bee6a000890,96948819-7f12-4a5b-82f1-b007efc6b159', N'Hash Brown Potato', N'~/Content/Images/CAT_638445453957090164.png', 6, 1, CAST(N'2024-02-15T17:58:39.773' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-26T13:28:35.393' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'6f125ffb-c67c-4324-8dd6-cfeb5ec32b3e', N'00000000-0000-0000-0000-000000000000', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Appetizer', N'~/Content/Images/CAT_638445466505733446.png', 1, 1, CAST(N'2024-02-16T13:04:15.737' AS DateTime), N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', CAST(N'2024-02-26T12:17:34.170' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13')
INSERT [dbo].[CategoryMaster] ([CategoryIDP], [CompanyIDF], [SiteIDF], [CategoryName], [CategoryImagePath], [priorityIndex], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1e97c05c-8243-4fe6-8dad-d4325810168e', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'380c4c1a-89c5-499b-93b4-06051d473498,1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Beverages', N'~/Content/Images/CAT_638443944077012908.jpg', 99, 1, CAST(N'2024-02-15T13:02:03.827' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', CAST(N'2024-02-24T18:00:07.987' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
GO
SET IDENTITY_INSERT [dbo].[CityMaster] ON 

INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15552, N'Bombuflat', 1625)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15553, N'Garacharma', 1625)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15554, N'Port Blair', 1625)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15555, N'Rangat', 1625)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15556, N'Addanki', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15557, N'Adivivaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15558, N'Adoni', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15559, N'Aganampudi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15560, N'Ajjaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15561, N'Akividu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15562, N'Akkarampalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15563, N'Akkayapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15564, N'Akkireddipalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15565, N'Alampur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15566, N'Amalapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15567, N'Amudalavalasa', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15568, N'Amur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15569, N'Anakapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15570, N'Anantapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15571, N'Andole', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15572, N'Atmakur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15573, N'Attili', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15574, N'Avanigadda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15575, N'Badepalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15576, N'Badvel', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15577, N'Balapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15578, N'Bandarulanka', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15579, N'Banganapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15580, N'Bapatla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15581, N'Bapulapadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15582, N'Belampalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15583, N'Bestavaripeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15584, N'Betamcherla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15585, N'Bhattiprolu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15586, N'Bhimavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15587, N'Bhimunipatnam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15588, N'Bobbili', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15589, N'Bombuflat', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15590, N'Bommuru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15591, N'Bugganipalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15592, N'Challapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15593, N'Chandur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15594, N'Chatakonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15595, N'Chemmumiahpet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15596, N'Chidiga', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15597, N'Chilakaluripet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15598, N'Chimakurthy', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15599, N'Chinagadila', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15600, N'Chinagantyada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15601, N'Chinnachawk', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15602, N'Chintalavalasa', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15603, N'Chipurupalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15604, N'Chirala', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15605, N'Chittoor', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15606, N'Chodavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15607, N'Choutuppal', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15608, N'Chunchupalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15609, N'Cuddapah', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15610, N'Cumbum', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15611, N'Darnakal', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15612, N'Dasnapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15613, N'Dauleshwaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15614, N'Dharmavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15615, N'Dhone', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15616, N'Dommara Nandyal', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15617, N'Dowlaiswaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15618, N'East Godavari Dist.', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15619, N'Eddumailaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15620, N'Edulapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15621, N'Ekambara kuppam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15622, N'Eluru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15623, N'Enikapadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15624, N'Fakirtakya', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15625, N'Farrukhnagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15626, N'Gaddiannaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15627, N'Gajapathinagaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15628, N'Gajularega', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15629, N'Gajuvaka', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15630, N'Gannavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15631, N'Garacharma', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15632, N'Garimellapadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15633, N'Giddalur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15634, N'Godavarikhani', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15635, N'Gopalapatnam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15636, N'Gopalur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15637, N'Gorrekunta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15638, N'Gudivada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15639, N'Gudur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15640, N'Guntakal', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15641, N'Guntur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15642, N'Guti', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15643, N'Hindupur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15644, N'Hukumpeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15645, N'Ichchapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15646, N'Isnapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15647, N'Jaggayyapeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15648, N'Jallaram Kamanpur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15649, N'Jammalamadugu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15650, N'Jangampalli', 1626)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15651, N'Jarjapupeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15652, N'Kadiri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15653, N'Kaikalur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15654, N'Kakinada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15655, N'Kallur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15656, N'Kalyandurg', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15657, N'Kamalapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15658, N'Kamareddi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15659, N'Kanapaka', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15660, N'Kanigiri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15661, N'Kanithi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15662, N'Kankipadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15663, N'Kantabamsuguda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15664, N'Kanuru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15665, N'Karnul', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15666, N'Katheru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15667, N'Kavali', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15668, N'Kazipet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15669, N'Khanapuram Haveli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15670, N'Kodar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15671, N'Kollapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15672, N'Kondapalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15673, N'Kondapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15674, N'Kondukur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15675, N'Kosgi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15676, N'Kothavalasa', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15677, N'Kottapalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15678, N'Kovur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15679, N'Kovurpalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15680, N'Kovvur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15681, N'Krishna', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15682, N'Kuppam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15683, N'Kurmannapalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15684, N'Kurnool', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15685, N'Lakshettipet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15686, N'Lalbahadur Nagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15687, N'Machavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15688, N'Macherla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15689, N'Machilipatnam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15690, N'Madanapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15691, N'Madaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15692, N'Madhuravada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15693, N'Madikonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15694, N'Madugule', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15695, N'Mahabubnagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15696, N'Mahbubabad', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15697, N'Malkajgiri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15698, N'Mamilapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15699, N'Mancheral', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15700, N'Mandapeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15701, N'Mandasa', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15702, N'Mangalagiri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15703, N'Manthani', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15704, N'Markapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15705, N'Marturu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15706, N'Metpalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15707, N'Mindi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15708, N'Mirpet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15709, N'Moragudi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15710, N'Mothugudam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15711, N'Nagari', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15712, N'Nagireddipalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15713, N'Nandigama', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15714, N'Nandikotkur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15715, N'Nandyal', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15716, N'Narasannapeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15717, N'Narasapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15718, N'Narasaraopet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15719, N'Narayanavanam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15720, N'Narsapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15721, N'Narsingi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15722, N'Narsipatnam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15723, N'Naspur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15724, N'Nathayyapalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15725, N'Nayudupeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15726, N'Nelimaria', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15727, N'Nellore', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15728, N'Nidadavole', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15729, N'Nuzvid', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15730, N'Omerkhan daira', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15731, N'Ongole', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15732, N'Osmania University', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15733, N'Pakala', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15734, N'Palakole', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15735, N'Palakurthi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15736, N'Palasa', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15737, N'Palempalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15738, N'Palkonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15739, N'Palmaner', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15740, N'Pamur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15741, N'Panjim', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15742, N'Papampeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15743, N'Parasamba', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15744, N'Parvatipuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15745, N'Patancheru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15746, N'Payakaraopet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15747, N'Pedagantyada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15748, N'Pedana', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15749, N'Peddapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15750, N'Pendurthi', 1626)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15751, N'Penugonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15752, N'Penukonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15753, N'Phirangipuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15754, N'Pithapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15755, N'Ponnur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15756, N'Port Blair', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15757, N'Pothinamallayyapalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15758, N'Prakasam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15759, N'Prasadampadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15760, N'Prasantinilayam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15761, N'Proddatur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15762, N'Pulivendla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15763, N'Punganuru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15764, N'Puttur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15765, N'Qutubullapur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15766, N'Rajahmundry', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15767, N'Rajamahendri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15768, N'Rajampet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15769, N'Rajendranagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15770, N'Rajoli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15771, N'Ramachandrapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15772, N'Ramanayyapeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15773, N'Ramapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15774, N'Ramarajupalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15775, N'Ramavarappadu', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15776, N'Rameswaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15777, N'Rampachodavaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15778, N'Ravulapalam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15779, N'Rayachoti', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15780, N'Rayadrug', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15781, N'Razam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15782, N'Razole', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15783, N'Renigunta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15784, N'Repalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15785, N'Rishikonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15786, N'Salur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15787, N'Samalkot', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15788, N'Sattenapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15789, N'Seetharampuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15790, N'Serilungampalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15791, N'Shankarampet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15792, N'Shar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15793, N'Singarayakonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15794, N'Sirpur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15795, N'Sirsilla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15796, N'Sompeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15797, N'Sriharikota', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15798, N'Srikakulam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15799, N'Srikalahasti', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15800, N'Sriramnagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15801, N'Sriramsagar', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15802, N'Srisailam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15803, N'Srisailamgudem Devasthanam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15804, N'Sulurpeta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15805, N'Suriapet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15806, N'Suryaraopet', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15807, N'Tadepalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15808, N'Tadepalligudem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15809, N'Tadpatri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15810, N'Tallapalle', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15811, N'Tanuku', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15812, N'Tekkali', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15813, N'Tenali', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15814, N'Tigalapahad', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15815, N'Tiruchanur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15816, N'Tirumala', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15817, N'Tirupati', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15818, N'Tirvuru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15819, N'Trimulgherry', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15820, N'Tuni', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15821, N'Turangi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15822, N'Ukkayapalli', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15823, N'Ukkunagaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15824, N'Uppal Kalan', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15825, N'Upper Sileru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15826, N'Uravakonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15827, N'Vadlapudi', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15828, N'Vaparala', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15829, N'Vemalwada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15830, N'Venkatagiri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15831, N'Venkatapuram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15832, N'Vepagunta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15833, N'Vetapalem', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15834, N'Vijayapuri', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15835, N'Vijayapuri South', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15836, N'Vijayawada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15837, N'Vinukonda', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15838, N'Visakhapatnam', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15839, N'Vizianagaram', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15840, N'Vuyyuru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15841, N'Wanparti', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15842, N'West Godavari Dist.', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15843, N'Yadagirigutta', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15844, N'Yarada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15845, N'Yellamanchili', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15846, N'Yemmiganur', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15847, N'Yenamalakudru', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15848, N'Yendada', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15849, N'Yerraguntla', 1626)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15850, N'Along', 1627)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15851, N'Basar', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15852, N'Bondila', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15853, N'Changlang', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15854, N'Daporijo', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15855, N'Deomali', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15856, N'Itanagar', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15857, N'Jairampur', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15858, N'Khonsa', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15859, N'Naharlagun', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15860, N'Namsai', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15861, N'Pasighat', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15862, N'Roing', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15863, N'Seppa', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15864, N'Tawang', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15865, N'Tezu', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15866, N'Ziro', 1627)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15867, N'Abhayapuri', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15868, N'Ambikapur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15869, N'Amguri', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15870, N'Anand Nagar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15871, N'Badarpur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15872, N'Badarpur Railway Town', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15873, N'Bahbari Gaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15874, N'Bamun Sualkuchi', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15875, N'Barbari', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15876, N'Barpathar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15877, N'Barpeta', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15878, N'Barpeta Road', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15879, N'Basugaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15880, N'Bihpuria', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15881, N'Bijni', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15882, N'Bilasipara', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15883, N'Biswanath Chariali', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15884, N'Bohori', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15885, N'Bokajan', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15886, N'Bokokhat', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15887, N'Bongaigaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15888, N'Bongaigaon Petro-chemical Town', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15889, N'Borgolai', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15890, N'Chabua', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15891, N'Chandrapur Bagicha', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15892, N'Chapar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15893, N'Chekonidhara', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15894, N'Choto Haibor', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15895, N'Dergaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15896, N'Dharapur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15897, N'Dhekiajuli', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15898, N'Dhemaji', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15899, N'Dhing', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15900, N'Dhubri', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15901, N'Dhuburi', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15902, N'Dibrugarh', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15903, N'Digboi', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15904, N'Digboi Oil Town', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15905, N'Dimaruguri', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15906, N'Diphu', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15907, N'Dispur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15908, N'Doboka', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15909, N'Dokmoka', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15910, N'Donkamokan', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15911, N'Duliagaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15912, N'Duliajan', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15913, N'Duliajan No.1', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15914, N'Dum Duma', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15915, N'Durga Nagar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15916, N'Gauripur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15917, N'Goalpara', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15918, N'Gohpur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15919, N'Golaghat', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15920, N'Golakganj', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15921, N'Gossaigaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15922, N'Guwahati', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15923, N'Haflong', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15924, N'Hailakandi', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15925, N'Hamren', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15926, N'Hauli', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15927, N'Hauraghat', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15928, N'Hojai', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15929, N'Jagiroad', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15930, N'Jagiroad Paper Mill', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15931, N'Jogighopa', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15932, N'Jonai Bazar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15933, N'Jorhat', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15934, N'Kampur Town', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15935, N'Kamrup', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15936, N'Kanakpur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15937, N'Karimganj', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15938, N'Kharijapikon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15939, N'Kharupetia', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15940, N'Kochpara', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15941, N'Kokrajhar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15942, N'Kumar Kaibarta Gaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15943, N'Lakhimpur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15944, N'Lakhipur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15945, N'Lala', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15946, N'Lanka', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15947, N'Lido Tikok', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15948, N'Lido Town', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15949, N'Lumding', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15950, N'Lumding Railway Colony', 1628)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15951, N'Mahur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15952, N'Maibong', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15953, N'Majgaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15954, N'Makum', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15955, N'Mangaldai', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15956, N'Mankachar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15957, N'Margherita', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15958, N'Mariani', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15959, N'Marigaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15960, N'Moran', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15961, N'Moranhat', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15962, N'Nagaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15963, N'Naharkatia', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15964, N'Nalbari', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15965, N'Namrup', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15966, N'Naubaisa Gaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15967, N'Nazira', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15968, N'New Bongaigaon Railway Colony', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15969, N'Niz-Hajo', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15970, N'North Guwahati', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15971, N'Numaligarh', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15972, N'Palasbari', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15973, N'Panchgram', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15974, N'Pathsala', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15975, N'Raha', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15976, N'Rangapara', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15977, N'Rangia', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15978, N'Salakati', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15979, N'Sapatgram', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15980, N'Sarthebari', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15981, N'Sarupathar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15982, N'Sarupathar Bengali', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15983, N'Senchoagaon', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15984, N'Sibsagar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15985, N'Silapathar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15986, N'Silchar', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15987, N'Silchar Part-X', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15988, N'Sonari', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15989, N'Sorbhog', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15990, N'Sualkuchi', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15991, N'Tangla', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15992, N'Tezpur', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15993, N'Tihu', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15994, N'Tinsukia', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15995, N'Titabor', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15996, N'Udalguri', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15997, N'Umrangso', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15998, N'Uttar Krishnapur Part-I', 1628)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (15999, N'Amarpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16000, N'Ara', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16001, N'Araria', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16002, N'Areraj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16003, N'Asarganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16004, N'Aurangabad', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16005, N'Bagaha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16006, N'Bahadurganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16007, N'Bairgania', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16008, N'Bakhtiyarpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16009, N'Banka', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16010, N'Banmankhi', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16011, N'Bar Bigha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16012, N'Barauli', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16013, N'Barauni Oil Township', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16014, N'Barh', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16015, N'Barhiya', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16016, N'Bariapur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16017, N'Baruni', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16018, N'Begusarai', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16019, N'Behea', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16020, N'Belsand', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16021, N'Bettiah', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16022, N'Bhabua', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16023, N'Bhagalpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16024, N'Bhimnagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16025, N'Bhojpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16026, N'Bihar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16027, N'Bihar Sharif', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16028, N'Bihariganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16029, N'Bikramganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16030, N'Birpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16031, N'Bodh Gaya', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16032, N'Buxar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16033, N'Chakia', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16034, N'Chanpatia', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16035, N'Chhapra', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16036, N'Chhatapur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16037, N'Colgong', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16038, N'Dalsingh Sarai', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16039, N'Darbhanga', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16040, N'Daudnagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16041, N'Dehri', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16042, N'Dhaka', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16043, N'Dighwara', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16044, N'Dinapur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16045, N'Dinapur Cantonment', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16046, N'Dumra', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16047, N'Dumraon', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16048, N'Fatwa', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16049, N'Forbesganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16050, N'Gaya', 1629)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16051, N'Gazipur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16052, N'Ghoghardiha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16053, N'Gogri Jamalpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16054, N'Gopalganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16055, N'Habibpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16056, N'Hajipur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16057, N'Hasanpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16058, N'Hazaribagh', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16059, N'Hilsa', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16060, N'Hisua', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16061, N'Islampur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16062, N'Jagdispur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16063, N'Jahanabad', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16064, N'Jamalpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16065, N'Jamhaur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16066, N'Jamui', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16067, N'Janakpur Road', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16068, N'Janpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16069, N'Jaynagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16070, N'Jha Jha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16071, N'Jhanjharpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16072, N'Jogbani', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16073, N'Kanti', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16074, N'Kasba', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16075, N'Kataiya', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16076, N'Katihar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16077, N'Khagaria', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16078, N'Khagaul', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16079, N'Kharagpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16080, N'Khusrupur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16081, N'Kishanganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16082, N'Koath', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16083, N'Koilwar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16084, N'Lakhisarai', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16085, N'Lalganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16086, N'Lauthaha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16087, N'Madhepura', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16088, N'Madhubani', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16089, N'Maharajganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16090, N'Mahnar Bazar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16091, N'Mairwa', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16092, N'Makhdumpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16093, N'Maner', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16094, N'Manihari', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16095, N'Marhaura', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16096, N'Masaurhi', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16097, N'Mirganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16098, N'Mohiuddinagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16099, N'Mokama', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16100, N'Motihari', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16101, N'Motipur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16102, N'Munger', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16103, N'Murliganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16104, N'Muzaffarpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16105, N'Nabinagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16106, N'Narkatiaganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16107, N'Nasriganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16108, N'Natwar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16109, N'Naugachhia', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16110, N'Nawada', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16111, N'Nirmali', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16112, N'Nokha', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16113, N'Paharpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16114, N'Patna', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16115, N'Phulwari', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16116, N'Piro', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16117, N'Purnia', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16118, N'Pusa', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16119, N'Rafiganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16120, N'Raghunathpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16121, N'Rajgir', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16122, N'Ramnagar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16123, N'Raxaul', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16124, N'Revelganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16125, N'Rusera', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16126, N'Sagauli', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16127, N'Saharsa', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16128, N'Samastipur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16129, N'Sasaram', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16130, N'Shahpur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16131, N'Shaikhpura', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16132, N'Sherghati', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16133, N'Shivhar', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16134, N'Silao', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16135, N'Sitamarhi', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16136, N'Siwan', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16137, N'Sonepur', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16138, N'Sultanganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16139, N'Supaul', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16140, N'Teghra', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16141, N'Tekari', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16142, N'Thakurganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16143, N'Vaishali', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16144, N'Waris Aliganj', 1629)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16145, N'Chandigarh', 1630)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16146, N'Ahiwara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16147, N'Akaltara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16148, N'Ambagarh Chauki', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16149, N'Ambikapur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16150, N'Arang', 1631)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16151, N'Bade Bacheli', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16152, N'Bagbahara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16153, N'Baikunthpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16154, N'Balod', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16155, N'Baloda', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16156, N'Baloda Bazar', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16157, N'Banarsi', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16158, N'Basna', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16159, N'Bemetra', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16160, N'Bhanpuri', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16161, N'Bhatapara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16162, N'Bhatgaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16163, N'Bhilai', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16164, N'Bilaspur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16165, N'Bilha', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16166, N'Birgaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16167, N'Bodri', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16168, N'Champa', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16169, N'Charcha', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16170, N'Charoda', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16171, N'Chhuikhadan', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16172, N'Chirmiri', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16173, N'Dantewada', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16174, N'Deori', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16175, N'Dhamdha', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16176, N'Dhamtari', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16177, N'Dharamjaigarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16178, N'Dipka', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16179, N'Doman Hill Colliery', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16180, N'Dongargaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16181, N'Dongragarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16182, N'Durg', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16183, N'Frezarpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16184, N'Gandai', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16185, N'Gariaband', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16186, N'Gaurela', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16187, N'Gelhapani', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16188, N'Gharghoda', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16189, N'Gidam', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16190, N'Gobra Nawapara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16191, N'Gogaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16192, N'Hatkachora', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16193, N'Jagdalpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16194, N'Jamui', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16195, N'Jashpurnagar', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16196, N'Jhagrakhand', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16197, N'Kanker', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16198, N'Katghora', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16199, N'Kawardha', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16200, N'Khairagarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16201, N'Khamhria', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16202, N'Kharod', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16203, N'Kharsia', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16204, N'Khonga Pani', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16205, N'Kirandu', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16206, N'Kirandul', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16207, N'Kohka', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16208, N'Kondagaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16209, N'Korba', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16210, N'Korea', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16211, N'Koria Block', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16212, N'Kota', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16213, N'Kumhari', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16214, N'Kumud Katta', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16215, N'Kurasia', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16216, N'Kurud', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16217, N'Lingiyadih', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16218, N'Lormi', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16219, N'Mahasamund', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16220, N'Mahendragarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16221, N'Mehmand', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16222, N'Mongra', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16223, N'Mowa', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16224, N'Mungeli', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16225, N'Nailajanjgir', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16226, N'Namna Kalan', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16227, N'Naya Baradwar', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16228, N'Pandariya', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16229, N'Patan', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16230, N'Pathalgaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16231, N'Pendra', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16232, N'Phunderdihari', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16233, N'Pithora', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16234, N'Raigarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16235, N'Raipur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16236, N'Rajgamar', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16237, N'Rajhara', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16238, N'Rajnandgaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16239, N'Ramanuj Ganj', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16240, N'Ratanpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16241, N'Sakti', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16242, N'Saraipali', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16243, N'Sarajpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16244, N'Sarangarh', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16245, N'Shivrinarayan', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16246, N'Simga', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16247, N'Sirgiti', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16248, N'Takhatpur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16249, N'Telgaon', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16250, N'Tildanewra', 1631)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16251, N'Urla', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16252, N'Vishrampur', 1631)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16253, N'Amli', 1632)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16254, N'Silvassa', 1632)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16255, N'Daman', 1633)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16256, N'Diu', 1633)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16257, N'Delhi', 1634)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16258, N'New Delhi', 1634)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16259, N'Aldona', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16260, N'Altinho', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16261, N'Aquem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16262, N'Arpora', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16263, N'Bambolim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16264, N'Bandora', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16265, N'Bardez', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16266, N'Benaulim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16267, N'Betora', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16268, N'Bicholim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16269, N'Calapor', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16270, N'Candolim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16271, N'Caranzalem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16272, N'Carapur', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16273, N'Chicalim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16274, N'Chimbel', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16275, N'Chinchinim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16276, N'Colvale', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16277, N'Corlim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16278, N'Cortalim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16279, N'Cuncolim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16280, N'Curchorem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16281, N'Curti', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16282, N'Davorlim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16283, N'Dona Paula', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16284, N'Goa', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16285, N'Guirim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16286, N'Jua', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16287, N'Kalangat', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16288, N'Kankon', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16289, N'Kundaim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16290, N'Loutulim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16291, N'Madgaon', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16292, N'Mapusa', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16293, N'Margao', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16294, N'Margaon', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16295, N'Miramar', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16296, N'Morjim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16297, N'Mormugao', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16298, N'Navelim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16299, N'Pale', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16300, N'Panaji', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16301, N'Parcem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16302, N'Parra', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16303, N'Penha de Franca', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16304, N'Pernem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16305, N'Pilerne', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16306, N'Pissurlem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16307, N'Ponda', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16308, N'Porvorim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16309, N'Quepem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16310, N'Queula', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16311, N'Raia', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16312, N'Reis Magos', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16313, N'Salcette', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16314, N'Saligao', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16315, N'Sancoale', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16316, N'Sanguem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16317, N'Sanquelim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16318, N'Sanvordem', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16319, N'Sao Jose-de-Areal', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16320, N'Sattari', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16321, N'Serula', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16322, N'Sinquerim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16323, N'Siolim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16324, N'Taleigao', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16325, N'Tivim', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16326, N'Valpoi', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16327, N'Varca', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16328, N'Vasco', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16329, N'Verna', 1635)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16330, N'Abrama', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16331, N'Adalaj', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16332, N'Adityana', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16333, N'Advana', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16334, N'Ahmedabad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16335, N'Ahwa', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16336, N'Alang', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16337, N'Ambaji', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16338, N'Ambaliyasan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16339, N'Amod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16340, N'Amreli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16341, N'Amroli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16342, N'Anand', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16343, N'Andada', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16344, N'Anjar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16345, N'Anklav', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16346, N'Ankleshwar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16347, N'Anklesvar INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16348, N'Antaliya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16349, N'Arambhada', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16350, N'Asarma', 1636)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16351, N'Atul', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16352, N'Babra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16353, N'Bag-e-Firdosh', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16354, N'Bagasara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16355, N'Bahadarpar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16356, N'Bajipura', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16357, N'Bajva', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16358, N'Balasinor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16359, N'Banaskantha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16360, N'Bansda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16361, N'Bantva', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16362, N'Bardoli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16363, N'Barwala', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16364, N'Bayad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16365, N'Bechar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16366, N'Bedi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16367, N'Beyt', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16368, N'Bhachau', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16369, N'Bhanvad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16370, N'Bharuch', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16371, N'Bharuch INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16372, N'Bhavnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16373, N'Bhayavadar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16374, N'Bhestan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16375, N'Bhuj', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16376, N'Bilimora', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16377, N'Bilkha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16378, N'Billimora', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16379, N'Bodakdev', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16380, N'Bodeli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16381, N'Bopal', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16382, N'Boria', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16383, N'Boriavi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16384, N'Borsad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16385, N'Botad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16386, N'Cambay', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16387, N'Chaklasi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16388, N'Chala', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16389, N'Chalala', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16390, N'Chalthan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16391, N'Chanasma', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16392, N'Chandisar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16393, N'Chandkheda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16394, N'Chanod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16395, N'Chaya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16396, N'Chenpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16397, N'Chhapi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16398, N'Chhaprabhatha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16399, N'Chhatral', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16400, N'Chhota Udepur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16401, N'Chikhli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16402, N'Chiloda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16403, N'Chorvad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16404, N'Chotila', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16405, N'Dabhoi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16406, N'Dadara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16407, N'Dahod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16408, N'Dakor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16409, N'Damnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16410, N'Deesa', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16411, N'Delvada', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16412, N'Devgadh Baria', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16413, N'Devsar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16414, N'Dhandhuka', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16415, N'Dhanera', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16416, N'Dhangdhra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16417, N'Dhansura', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16418, N'Dharampur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16419, N'Dhari', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16420, N'Dhola', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16421, N'Dholka', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16422, N'Dholka Rural', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16423, N'Dhoraji', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16424, N'Dhrangadhra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16425, N'Dhrol', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16426, N'Dhuva', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16427, N'Dhuwaran', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16428, N'Digvijaygram', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16429, N'Disa', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16430, N'Dungar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16431, N'Dungarpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16432, N'Dungra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16433, N'Dwarka', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16434, N'Flelanganj', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16435, N'GSFC Complex', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16436, N'Gadhda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16437, N'Gandevi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16438, N'Gandhidham', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16439, N'Gandhinagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16440, N'Gariadhar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16441, N'Ghogha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16442, N'Godhra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16443, N'Gondal', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16444, N'Hajira INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16445, N'Halol', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16446, N'Halvad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16447, N'Hansot', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16448, N'Harij', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16449, N'Himatnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16450, N'Ichchhapor', 1636)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16451, N'Idar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16452, N'Jafrabad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16453, N'Jalalpore', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16454, N'Jambusar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16455, N'Jamjodhpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16456, N'Jamnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16457, N'Jasdan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16458, N'Jawaharnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16459, N'Jetalsar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16460, N'Jetpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16461, N'Jodiya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16462, N'Joshipura', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16463, N'Junagadh', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16464, N'Kadi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16465, N'Kadodara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16466, N'Kalavad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16467, N'Kali', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16468, N'Kaliawadi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16469, N'Kalol', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16470, N'Kalol INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16471, N'Kandla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16472, N'Kanjari', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16473, N'Kanodar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16474, N'Kapadwanj', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16475, N'Karachiya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16476, N'Karamsad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16477, N'Karjan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16478, N'Kathial', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16479, N'Kathor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16480, N'Katpar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16481, N'Kavant', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16482, N'Keshod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16483, N'Kevadiya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16484, N'Khambhaliya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16485, N'Khambhat', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16486, N'Kharaghoda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16487, N'Khed Brahma', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16488, N'Kheda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16489, N'Kheralu', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16490, N'Kodinar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16491, N'Kosamba', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16492, N'Kundla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16493, N'Kutch', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16494, N'Kutiyana', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16495, N'Lakhtar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16496, N'Lalpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16497, N'Lambha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16498, N'Lathi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16499, N'Limbdi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16500, N'Limla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16501, N'Lunavada', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16502, N'Madhapar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16503, N'Maflipur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16504, N'Mahemdavad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16505, N'Mahudha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16506, N'Mahuva', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16507, N'Mahuvar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16508, N'Makarba', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16509, N'Makarpura', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16510, N'Makassar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16511, N'Maktampur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16512, N'Malia', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16513, N'Malpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16514, N'Manavadar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16515, N'Mandal', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16516, N'Mandvi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16517, N'Mangrol', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16518, N'Mansa', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16519, N'Meghraj', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16520, N'Mehsana', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16521, N'Mendarla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16522, N'Mithapur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16523, N'Modasa', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16524, N'Mogravadi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16525, N'Morbi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16526, N'Morvi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16527, N'Mundra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16528, N'Nadiad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16529, N'Naliya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16530, N'Nanakvada', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16531, N'Nandej', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16532, N'Nandesari', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16533, N'Nandesari INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16534, N'Naroda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16535, N'Navagadh', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16536, N'Navagam Ghed', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16537, N'Navsari', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16538, N'Ode', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16539, N'Okaf', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16540, N'Okha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16541, N'Olpad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16542, N'Paddhari', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16543, N'Padra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16544, N'Palanpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16545, N'Palej', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16546, N'Pali', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16547, N'Palitana', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16548, N'Paliyad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16549, N'Pandesara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16550, N'Panoli', 1636)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16551, N'Pardi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16552, N'Parnera', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16553, N'Parvat', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16554, N'Patan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16555, N'Patdi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16556, N'Petlad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16557, N'Petrochemical Complex', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16558, N'Porbandar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16559, N'Prantij', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16560, N'Radhanpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16561, N'Raiya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16562, N'Rajkot', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16563, N'Rajpipla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16564, N'Rajula', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16565, N'Ramod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16566, N'Ranavav', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16567, N'Ranoli', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16568, N'Rapar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16569, N'Sahij', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16570, N'Salaya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16571, N'Sanand', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16572, N'Sankheda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16573, N'Santrampur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16574, N'Saribujrang', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16575, N'Sarigam INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16576, N'Sayan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16577, N'Sayla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16578, N'Shahpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16579, N'Shahwadi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16580, N'Shapar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16581, N'Shivrajpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16582, N'Siddhapur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16583, N'Sidhpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16584, N'Sihor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16585, N'Sika', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16586, N'Singarva', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16587, N'Sinor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16588, N'Sojitra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16589, N'Sola', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16590, N'Songadh', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16591, N'Suraj Karadi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16592, N'Surat', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16593, N'Surendranagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16594, N'Talaja', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16595, N'Talala', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16596, N'Talod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16597, N'Tankara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16598, N'Tarsali', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16599, N'Thangadh', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16600, N'Tharad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16601, N'Thasra', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16602, N'Udyognagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16603, N'Ukai', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16604, N'Umbergaon', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16605, N'Umbergaon INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16606, N'Umrala', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16607, N'Umreth', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16608, N'Un', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16609, N'Una', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16610, N'Unjha', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16611, N'Upleta', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16612, N'Utran', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16613, N'Uttarsanda', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16614, N'V.U. Nagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16615, N'V.V. Nagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16616, N'Vadia', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16617, N'Vadla', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16618, N'Vadnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16619, N'Vadodara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16620, N'Vaghodia INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16621, N'Valbhipur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16622, N'Vallabh Vidyanagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16623, N'Valsad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16624, N'Valsad INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16625, N'Vanthali', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16626, N'Vapi', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16627, N'Vapi INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16628, N'Vartej', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16629, N'Vasad', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16630, N'Vasna Borsad INA', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16631, N'Vaso', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16632, N'Veraval', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16633, N'Vidyanagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16634, N'Vijalpor', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16635, N'Vijapur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16636, N'Vinchhiya', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16637, N'Vinzol', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16638, N'Virpur', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16639, N'Visavadar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16640, N'Visnagar', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16641, N'Vyara', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16642, N'Wadhwan', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16643, N'Waghai', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16644, N'Waghodia', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16645, N'Wankaner', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16646, N'Zalod', 1636)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16647, N'Ambala', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16648, N'Ambala Cantt', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16649, N'Asan Khurd', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16650, N'Asandh', 1637)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16651, N'Ateli', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16652, N'Babiyal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16653, N'Bahadurgarh', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16654, N'Ballabgarh', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16655, N'Barwala', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16656, N'Bawal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16657, N'Bawani Khera', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16658, N'Beri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16659, N'Bhiwani', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16660, N'Bilaspur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16661, N'Buria', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16662, N'Charkhi Dadri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16663, N'Chhachhrauli', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16664, N'Chita', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16665, N'Dabwali', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16666, N'Dharuhera', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16667, N'Dundahera', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16668, N'Ellenabad', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16669, N'Farakhpur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16670, N'Faridabad', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16671, N'Farrukhnagar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16672, N'Fatehabad', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16673, N'Firozpur Jhirka', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16674, N'Gannaur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16675, N'Ghraunda', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16676, N'Gohana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16677, N'Gurgaon', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16678, N'Haileymandi', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16679, N'Hansi', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16680, N'Hasanpur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16681, N'Hathin', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16682, N'Hisar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16683, N'Hissar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16684, N'Hodal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16685, N'Indri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16686, N'Jagadhri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16687, N'Jakhal Mandi', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16688, N'Jhajjar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16689, N'Jind', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16690, N'Julana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16691, N'Kaithal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16692, N'Kalanur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16693, N'Kalanwali', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16694, N'Kalayat', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16695, N'Kalka', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16696, N'Kanina', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16697, N'Kansepur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16698, N'Kardhan', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16699, N'Karnal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16700, N'Kharkhoda', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16701, N'Kheri Sampla', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16702, N'Kundli', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16703, N'Kurukshetra', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16704, N'Ladrawan', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16705, N'Ladwa', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16706, N'Loharu', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16707, N'Maham', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16708, N'Mahendragarh', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16709, N'Mustafabad', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16710, N'Nagai Chaudhry', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16711, N'Narayangarh', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16712, N'Narnaul', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16713, N'Narnaund', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16714, N'Narwana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16715, N'Nilokheri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16716, N'Nuh', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16717, N'Palwal', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16718, N'Panchkula', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16719, N'Panipat', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16720, N'Panipat Taraf Ansar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16721, N'Panipat Taraf Makhdum Zadgan', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16722, N'Panipat Taraf Rajputan', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16723, N'Pehowa', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16724, N'Pinjaur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16725, N'Punahana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16726, N'Pundri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16727, N'Radaur', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16728, N'Raipur Rani', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16729, N'Rania', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16730, N'Ratiya', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16731, N'Rewari', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16732, N'Rohtak', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16733, N'Ropar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16734, N'Sadauri', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16735, N'Safidon', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16736, N'Samalkha', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16737, N'Sankhol', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16738, N'Sasauli', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16739, N'Shahabad', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16740, N'Sirsa', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16741, N'Siwani', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16742, N'Sohna', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16743, N'Sonipat', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16744, N'Sukhrali', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16745, N'Taoru', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16746, N'Taraori', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16747, N'Tauru', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16748, N'Thanesar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16749, N'Tilpat', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16750, N'Tohana', 1637)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16751, N'Tosham', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16752, N'Uchana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16753, N'Uklana Mandi', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16754, N'Uncha Siwana', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16755, N'Yamunanagar', 1637)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16756, N'Arki', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16757, N'Baddi', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16758, N'Bakloh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16759, N'Banjar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16760, N'Bhota', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16761, N'Bhuntar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16762, N'Bilaspur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16763, N'Chamba', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16764, N'Chaupal', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16765, N'Chuari Khas', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16766, N'Dagshai', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16767, N'Dalhousie', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16768, N'Dalhousie Cantonment', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16769, N'Damtal', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16770, N'Daulatpur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16771, N'Dera Gopipur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16772, N'Dhalli', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16773, N'Dharamshala', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16774, N'Gagret', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16775, N'Ghamarwin', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16776, N'Hamirpur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16777, N'Jawala Mukhi', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16778, N'Jogindarnagar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16779, N'Jubbal', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16780, N'Jutogh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16781, N'Kala Amb', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16782, N'Kalpa', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16783, N'Kangra', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16784, N'Kasauli', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16785, N'Kot Khai', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16786, N'Kullu', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16787, N'Kulu', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16788, N'Manali', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16789, N'Mandi', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16790, N'Mant Khas', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16791, N'Mehatpur Basdehra', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16792, N'Nadaun', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16793, N'Nagrota', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16794, N'Nahan', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16795, N'Naina Devi', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16796, N'Nalagarh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16797, N'Narkanda', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16798, N'Nurpur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16799, N'Palampur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16800, N'Pandoh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16801, N'Paonta Sahib', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16802, N'Parwanoo', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16803, N'Parwanu', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16804, N'Rajgarh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16805, N'Rampur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16806, N'Rawalsar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16807, N'Rohru', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16808, N'Sabathu', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16809, N'Santokhgarh', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16810, N'Sarahan', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16811, N'Sarka Ghat', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16812, N'Seoni', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16813, N'Shimla', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16814, N'Sirmaur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16815, N'Solan', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16816, N'Solon', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16817, N'Sundarnagar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16818, N'Sundernagar', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16819, N'Talai', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16820, N'Theog', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16821, N'Tira Sujanpur', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16822, N'Una', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16823, N'Yol', 1638)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16824, N'Achabal', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16825, N'Akhnur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16826, N'Anantnag', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16827, N'Arnia', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16828, N'Awantipora', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16829, N'Badami Bagh', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16830, N'Bandipur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16831, N'Banihal', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16832, N'Baramula', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16833, N'Baramulla', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16834, N'Bari Brahmana', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16835, N'Bashohli', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16836, N'Batote', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16837, N'Bhaderwah', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16838, N'Bijbiara', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16839, N'Billawar', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16840, N'Birwah', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16841, N'Bishna', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16842, N'Budgam', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16843, N'Charari Sharief', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16844, N'Chenani', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16845, N'Doda', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16846, N'Duru-Verinag', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16847, N'Gandarbat', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16848, N'Gho Manhasan', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16849, N'Gorah Salathian', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16850, N'Gulmarg', 1639)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16851, N'Hajan', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16852, N'Handwara', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16853, N'Hiranagar', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16854, N'Jammu', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16855, N'Jammu Cantonment', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16856, N'Jammu Tawi', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16857, N'Jourian', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16858, N'Kargil', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16859, N'Kathua', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16860, N'Katra', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16861, N'Khan Sahib', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16862, N'Khour', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16863, N'Khrew', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16864, N'Kishtwar', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16865, N'Kud', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16866, N'Kukernag', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16867, N'Kulgam', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16868, N'Kunzer', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16869, N'Kupwara', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16870, N'Lakhenpur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16871, N'Leh', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16872, N'Magam', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16873, N'Mattan', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16874, N'Naushehra', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16875, N'Pahalgam', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16876, N'Pampore', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16877, N'Parole', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16878, N'Pattan', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16879, N'Pulwama', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16880, N'Punch', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16881, N'Qazigund', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16882, N'Rajauri', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16883, N'Ramban', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16884, N'Ramgarh', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16885, N'Ramnagar', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16886, N'Ranbirsingh Pora', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16887, N'Reasi', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16888, N'Rehambal', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16889, N'Samba', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16890, N'Shupiyan', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16891, N'Sopur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16892, N'Srinagar', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16893, N'Sumbal', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16894, N'Sunderbani', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16895, N'Talwara', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16896, N'Thanamandi', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16897, N'Tral', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16898, N'Udhampur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16899, N'Uri', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16900, N'Vijaypur', 1639)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16901, N'Adityapur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16902, N'Amlabad', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16903, N'Angarpathar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16904, N'Ara', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16905, N'Babua Kalan', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16906, N'Bagbahra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16907, N'Baliapur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16908, N'Baliari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16909, N'Balkundra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16910, N'Bandhgora', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16911, N'Barajamda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16912, N'Barhi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16913, N'Barka Kana', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16914, N'Barki Saraiya', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16915, N'Barughutu', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16916, N'Barwadih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16917, N'Basaria', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16918, N'Basukinath', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16919, N'Bermo', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16920, N'Bhagatdih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16921, N'Bhaurah', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16922, N'Bhojudih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16923, N'Bhuli', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16924, N'Bokaro', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16925, N'Borio Bazar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16926, N'Bundu', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16927, N'Chaibasa', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16928, N'Chaitudih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16929, N'Chakradharpur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16930, N'Chakulia', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16931, N'Chandaur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16932, N'Chandil', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16933, N'Chandrapura', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16934, N'Chas', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16935, N'Chatra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16936, N'Chhatatanr', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16937, N'Chhotaputki', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16938, N'Chiria', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16939, N'Chirkunda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16940, N'Churi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16941, N'Daltenganj', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16942, N'Danguwapasi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16943, N'Dari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16944, N'Deoghar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16945, N'Deorikalan', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16946, N'Devghar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16947, N'Dhanbad', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16948, N'Dhanwar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16949, N'Dhaunsar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16950, N'Dugda', 1640)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16951, N'Dumarkunda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16952, N'Dumka', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16953, N'Egarkunr', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16954, N'Gadhra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16955, N'Garwa', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16956, N'Ghatsila', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16957, N'Ghorabandha', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16958, N'Gidi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16959, N'Giridih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16960, N'Gobindpur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16961, N'Godda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16962, N'Godhar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16963, N'Golphalbari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16964, N'Gomoh', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16965, N'Gua', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16966, N'Gumia', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16967, N'Gumla', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16968, N'Haludbani', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16969, N'Hazaribag', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16970, N'Hesla', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16971, N'Husainabad', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16972, N'Isri', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16973, N'Jadugora', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16974, N'Jagannathpur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16975, N'Jamadoba', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16976, N'Jamshedpur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16977, N'Jamtara', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16978, N'Jarangdih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16979, N'Jaridih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16980, N'Jasidih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16981, N'Jena', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16982, N'Jharia', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16983, N'Jharia Khas', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16984, N'Jhinkpani', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16985, N'Jhumri Tilaiya', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16986, N'Jorapokhar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16987, N'Jugsalai', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16988, N'Kailudih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16989, N'Kalikapur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16990, N'Kandra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16991, N'Kanke', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16992, N'Katras', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16993, N'Kedla', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16994, N'Kenduadih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16995, N'Kharkhari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16996, N'Kharsawan', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16997, N'Khelari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16998, N'Khunti', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (16999, N'Kiri Buru', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17000, N'Kiriburu', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17001, N'Kodarma', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17002, N'Kuju', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17003, N'Kurpania', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17004, N'Kustai', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17005, N'Lakarka', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17006, N'Lapanga', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17007, N'Latehar', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17008, N'Lohardaga', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17009, N'Loiya', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17010, N'Loyabad', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17011, N'Madhupur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17012, N'Mahesh Mundi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17013, N'Maithon', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17014, N'Malkera', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17015, N'Mango', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17016, N'Manoharpur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17017, N'Marma', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17018, N'Meghahatuburu Forest village', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17019, N'Mera', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17020, N'Meru', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17021, N'Mihijam', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17022, N'Mugma', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17023, N'Muri', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17024, N'Mushabani', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17025, N'Nagri Kalan', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17026, N'Netarhat', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17027, N'Nirsa', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17028, N'Noamundi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17029, N'Okni', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17030, N'Orla', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17031, N'Pakaur', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17032, N'Palamau', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17033, N'Palawa', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17034, N'Panchet', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17035, N'Panrra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17036, N'Paratdih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17037, N'Pathardih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17038, N'Patratu', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17039, N'Phusro', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17040, N'Pondar Kanali', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17041, N'Rajmahal', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17042, N'Ramgarh', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17043, N'Ranchi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17044, N'Ray', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17045, N'Rehla', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17046, N'Religara', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17047, N'Rohraband', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17048, N'Sahibganj', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17049, N'Sahnidih', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17050, N'Saraidhela', 1640)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17051, N'Saraikela', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17052, N'Sarjamda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17053, N'Saunda', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17054, N'Sewai', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17055, N'Sijhua', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17056, N'Sijua', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17057, N'Simdega', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17058, N'Sindari', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17059, N'Sinduria', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17060, N'Sini', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17061, N'Sirka', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17062, N'Siuliban', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17063, N'Surubera', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17064, N'Tati', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17065, N'Tenudam', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17066, N'Tisra', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17067, N'Topa', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17068, N'Topchanchi', 1640)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17069, N'Adityanagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17070, N'Adityapatna', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17071, N'Afzalpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17072, N'Ajjampur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17073, N'Aland', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17074, N'Almatti Sitimani', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17075, N'Alnavar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17076, N'Alur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17077, N'Ambikanagara', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17078, N'Anekal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17079, N'Ankola', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17080, N'Annigeri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17081, N'Arkalgud', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17082, N'Arsikere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17083, N'Athni', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17084, N'Aurad', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17085, N'Badagavettu', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17086, N'Badami', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17087, N'Bagalkot', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17088, N'Bagepalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17089, N'Bailhongal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17090, N'Baindur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17091, N'Bajala', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17092, N'Bajpe', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17093, N'Banavar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17094, N'Bangarapet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17095, N'Bankapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17096, N'Bannur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17097, N'Bantwal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17098, N'Basavakalyan', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17099, N'Basavana Bagevadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17100, N'Belagula', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17101, N'Belakavadiq', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17102, N'Belgaum', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17103, N'Belgaum Cantonment', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17104, N'Bellary', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17105, N'Belluru', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17106, N'Beltangadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17107, N'Belur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17108, N'Belvata', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17109, N'Bengaluru', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17110, N'Bhadravati', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17111, N'Bhalki', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17112, N'Bhatkal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17113, N'Bhimarayanagudi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17114, N'Bhogadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17115, N'Bidar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17116, N'Bijapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17117, N'Bilgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17118, N'Birur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17119, N'Bommanahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17120, N'Bommasandra', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17121, N'Byadgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17122, N'Byatarayanapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17123, N'Chakranagar Colony', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17124, N'Challakere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17125, N'Chamrajnagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17126, N'Chamundi Betta', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17127, N'Channagiri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17128, N'Channapatna', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17129, N'Channarayapatna', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17130, N'Chickballapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17131, N'Chik Ballapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17132, N'Chikkaballapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17133, N'Chikmagalur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17134, N'Chiknayakanhalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17135, N'Chikodi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17136, N'Chincholi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17137, N'Chintamani', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17138, N'Chitaguppa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17139, N'Chitapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17140, N'Chitradurga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17141, N'Coorg', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17142, N'Dandeli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17143, N'Dargajogihalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17144, N'Dasarahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17145, N'Davangere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17146, N'Devadurga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17147, N'Devagiri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17148, N'Devanhalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17149, N'Dharwar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17150, N'Dhupdal', 1641)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17151, N'Dod Ballapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17152, N'Donimalai', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17153, N'Gadag', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17154, N'Gajendragarh', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17155, N'Ganeshgudi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17156, N'Gangawati', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17157, N'Gangoli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17158, N'Gauribidanur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17159, N'Gokak', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17160, N'Gokak Falls', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17161, N'Gonikoppal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17162, N'Gorur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17163, N'Gottikere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17164, N'Gubbi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17165, N'Gudibanda', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17166, N'Gulbarga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17167, N'Guledgudda', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17168, N'Gundlupet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17169, N'Gurmatkal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17170, N'Haliyal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17171, N'Hangal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17172, N'Harihar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17173, N'Harpanahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17174, N'Hassan', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17175, N'Hatti', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17176, N'Hatti Gold Mines', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17177, N'Haveri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17178, N'Hebbagodi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17179, N'Hebbalu', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17180, N'Hebri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17181, N'Heggadadevanakote', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17182, N'Herohalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17183, N'Hidkal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17184, N'Hindalgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17185, N'Hirekerur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17186, N'Hiriyur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17187, N'Holalkere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17188, N'Hole Narsipur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17189, N'Homnabad', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17190, N'Honavar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17191, N'Honnali', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17192, N'Hosakote', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17193, N'Hosanagara', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17194, N'Hosangadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17195, N'Hosdurga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17196, N'Hoskote', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17197, N'Hospet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17198, N'Hubli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17199, N'Hukeri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17200, N'Hunasagi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17201, N'Hunasamaranahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17202, N'Hungund', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17203, N'Hunsur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17204, N'Huvina Hadagalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17205, N'Ilkal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17206, N'Indi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17207, N'Jagalur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17208, N'Jamkhandi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17209, N'Jevargi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17210, N'Jog Falls', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17211, N'Kabini Colony', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17212, N'Kadur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17213, N'Kalghatgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17214, N'Kamalapuram', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17215, N'Kampli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17216, N'Kanakapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17217, N'Kangrali BK', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17218, N'Kangrali KH', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17219, N'Kannur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17220, N'Karkala', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17221, N'Karwar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17222, N'Kemminja', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17223, N'Kengeri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17224, N'Kerur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17225, N'Khanapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17226, N'Kodigenahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17227, N'Kodiyal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17228, N'Kodlipet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17229, N'Kolar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17230, N'Kollegal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17231, N'Konanakunte', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17232, N'Konanur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17233, N'Konnur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17234, N'Koppa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17235, N'Koppal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17236, N'Koratagere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17237, N'Kotekara', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17238, N'Kothnur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17239, N'Kotturu', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17240, N'Krishnapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17241, N'Krishnarajanagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17242, N'Krishnarajapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17243, N'Krishnarajasagara', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17244, N'Krishnarajpet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17245, N'Kudchi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17246, N'Kudligi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17247, N'Kudremukh', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17248, N'Kumsi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17249, N'Kumta', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17250, N'Kundapura', 1641)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17251, N'Kundgol', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17252, N'Kunigal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17253, N'Kurgunta', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17254, N'Kushalnagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17255, N'Kushtagi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17256, N'Kyathanahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17257, N'Lakshmeshwar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17258, N'Lingsugur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17259, N'Londa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17260, N'Maddur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17261, N'Madhugiri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17262, N'Madikeri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17263, N'Magadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17264, N'Magod Falls', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17265, N'Mahadeswara Hills', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17266, N'Mahadevapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17267, N'Mahalingpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17268, N'Maisuru', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17269, N'Maisuru Cantonment', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17270, N'Malavalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17271, N'Mallar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17272, N'Malpe', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17273, N'Malur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17274, N'Manchenahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17275, N'Mandya', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17276, N'Mangalore', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17277, N'Mangaluru', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17278, N'Manipal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17279, N'Manvi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17280, N'Maski', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17281, N'Mastikatte Colony', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17282, N'Mayakonda', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17283, N'Melukote', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17284, N'Molakalmuru', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17285, N'Mudalgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17286, N'Mudbidri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17287, N'Muddebihal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17288, N'Mudgal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17289, N'Mudhol', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17290, N'Mudigere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17291, N'Mudushedde', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17292, N'Mulbagal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17293, N'Mulgund', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17294, N'Mulki', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17295, N'Mulur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17296, N'Mundargi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17297, N'Mundgod', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17298, N'Munirabad', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17299, N'Munnur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17300, N'Murudeshwara', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17301, N'Mysore', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17302, N'Nagamangala', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17303, N'Nanjangud', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17304, N'Naragund', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17305, N'Narasimharajapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17306, N'Naravi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17307, N'Narayanpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17308, N'Naregal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17309, N'Navalgund', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17310, N'Nelmangala', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17311, N'Nipani', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17312, N'Nitte', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17313, N'Nyamati', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17314, N'Padu', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17315, N'Pandavapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17316, N'Pattanagere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17317, N'Pavagada', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17318, N'Piriyapatna', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17319, N'Ponnampet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17320, N'Puttur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17321, N'Rabkavi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17322, N'Raichur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17323, N'Ramanagaram', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17324, N'Ramdurg', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17325, N'Ranibennur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17326, N'Raybag', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17327, N'Robertsonpet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17328, N'Ron', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17329, N'Sadalgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17330, N'Sagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17331, N'Sakleshpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17332, N'Saligram', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17333, N'Sandur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17334, N'Sanivarsante', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17335, N'Sankeshwar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17336, N'Sargur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17337, N'Sathyamangala', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17338, N'Saundatti Yellamma', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17339, N'Savanur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17340, N'Sedam', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17341, N'Shahabad', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17342, N'Shahabad A.C.C.', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17343, N'Shahapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17344, N'Shahpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17345, N'Shaktinagar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17346, N'Shiggaon', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17347, N'Shikarpur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17348, N'Shimoga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17349, N'Shirhatti', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17350, N'Shorapur', 1641)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17351, N'Shravanabelagola', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17352, N'Shrirangapattana', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17353, N'Siddapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17354, N'Sidlaghatta', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17355, N'Sindgi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17356, N'Sindhnur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17357, N'Sira', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17358, N'Sirakoppa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17359, N'Sirsi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17360, N'Siruguppa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17361, N'Someshwar', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17362, N'Somvarpet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17363, N'Sorab', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17364, N'Sringeri', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17365, N'Srinivaspur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17366, N'Sulya', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17367, N'Suntikopa', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17368, N'Talikota', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17369, N'Tarikera', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17370, N'Tekkalakota', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17371, N'Terdal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17372, N'Thokur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17373, N'Thumbe', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17374, N'Tiptur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17375, N'Tirthahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17376, N'Tirumakudal Narsipur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17377, N'Tonse', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17378, N'Tumkur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17379, N'Turuvekere', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17380, N'Udupi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17381, N'Ullal', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17382, N'Uttarahalli', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17383, N'Venkatapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17384, N'Vijayapura', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17385, N'Virarajendrapet', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17386, N'Wadi', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17387, N'Wadi A.C.C.', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17388, N'Yadgir', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17389, N'Yelahanka', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17390, N'Yelandur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17391, N'Yelbarga', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17392, N'Yellapur', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17393, N'Yenagudde', 1641)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17394, N'Adimaly', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17395, N'Adoor', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17396, N'Adur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17397, N'Akathiyur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17398, N'Alangad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17399, N'Alappuzha', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17400, N'Aluva', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17401, N'Ancharakandy', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17402, N'Angamaly', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17403, N'Aroor', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17404, N'Arukutti', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17405, N'Attingal', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17406, N'Avinissery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17407, N'Azhikode North', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17408, N'Azhikode South', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17409, N'Azhiyur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17410, N'Balussery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17411, N'Bangramanjeshwar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17412, N'Beypur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17413, N'Brahmakulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17414, N'Chala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17415, N'Chalakudi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17416, N'Changanacheri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17417, N'Chauwara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17418, N'Chavakkad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17419, N'Chelakkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17420, N'Chelora', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17421, N'Chendamangalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17422, N'Chengamanad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17423, N'Chengannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17424, N'Cheranallur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17425, N'Cheriyakadavu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17426, N'Cherthala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17427, N'Cherukunnu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17428, N'Cheruthazham', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17429, N'Cheruvannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17430, N'Cheruvattur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17431, N'Chevvur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17432, N'Chirakkal', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17433, N'Chittur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17434, N'Chockli', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17435, N'Churnikkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17436, N'Dharmadam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17437, N'Edappal', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17438, N'Edathala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17439, N'Elayavur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17440, N'Elur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17441, N'Eranholi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17442, N'Erattupetta', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17443, N'Ernakulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17444, N'Eruvatti', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17445, N'Ettumanoor', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17446, N'Feroke', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17447, N'Guruvayur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17448, N'Haripad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17449, N'Hosabettu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17450, N'Idukki', 1643)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17451, N'Iringaprom', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17452, N'Irinjalakuda', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17453, N'Iriveri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17454, N'Kadachira', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17455, N'Kadalundi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17456, N'Kadamakkudy', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17457, N'Kadirur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17458, N'Kadungallur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17459, N'Kakkodi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17460, N'Kalady', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17461, N'Kalamassery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17462, N'Kalliasseri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17463, N'Kalpetta', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17464, N'Kanhangad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17465, N'Kanhirode', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17466, N'Kanjikkuzhi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17467, N'Kanjikode', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17468, N'Kanjirappalli', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17469, N'Kannadiparamba', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17470, N'Kannangad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17471, N'Kannapuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17472, N'Kannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17473, N'Kannur Cantonment', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17474, N'Karunagappally', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17475, N'Karuvamyhuruthy', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17476, N'Kasaragod', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17477, N'Kasargod', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17478, N'Kattappana', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17479, N'Kayamkulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17480, N'Kedamangalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17481, N'Kochi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17482, N'Kodamthuruthu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17483, N'Kodungallur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17484, N'Koduvally', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17485, N'Koduvayur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17486, N'Kokkothamangalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17487, N'Kolazhy', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17488, N'Kollam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17489, N'Komalapuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17490, N'Koothattukulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17491, N'Koratty', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17492, N'Kothamangalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17493, N'Kottarakkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17494, N'Kottayam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17495, N'Kottayam Malabar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17496, N'Kottuvally', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17497, N'Koyilandi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17498, N'Kozhikode', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17499, N'Kudappanakunnu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17500, N'Kudlu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17501, N'Kumarakom', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17502, N'Kumily', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17503, N'Kunnamangalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17504, N'Kunnamkulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17505, N'Kurikkad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17506, N'Kurkkanchery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17507, N'Kuthuparamba', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17508, N'Kuttakulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17509, N'Kuttikkattur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17510, N'Kuttur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17511, N'Malappuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17512, N'Mallappally', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17513, N'Manjeri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17514, N'Manjeshwar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17515, N'Mannancherry', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17516, N'Mannar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17517, N'Mannarakkat', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17518, N'Maradu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17519, N'Marathakkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17520, N'Marutharod', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17521, N'Mattannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17522, N'Mavelikara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17523, N'Mavilayi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17524, N'Mavur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17525, N'Methala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17526, N'Muhamma', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17527, N'Mulavukad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17528, N'Mundakayam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17529, N'Munderi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17530, N'Munnar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17531, N'Muthakunnam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17532, N'Muvattupuzha', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17533, N'Muzhappilangad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17534, N'Nadapuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17535, N'Nadathara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17536, N'Narath', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17537, N'Nattakam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17538, N'Nedumangad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17539, N'Nenmenikkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17540, N'New Mahe', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17541, N'Neyyattinkara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17542, N'Nileshwar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17543, N'Olavanna', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17544, N'Ottapalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17545, N'Ottappalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17546, N'Paduvilayi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17547, N'Palai', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17548, N'Palakkad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17549, N'Palayad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17550, N'Palissery', 1643)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17551, N'Pallikkunnu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17552, N'Paluvai', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17553, N'Panniyannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17554, N'Pantalam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17555, N'Panthiramkavu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17556, N'Panur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17557, N'Pappinisseri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17558, N'Parassala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17559, N'Paravur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17560, N'Pathanamthitta', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17561, N'Pathanapuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17562, N'Pathiriyad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17563, N'Pattambi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17564, N'Pattiom', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17565, N'Pavaratty', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17566, N'Payyannur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17567, N'Peermade', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17568, N'Perakam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17569, N'Peralasseri', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17570, N'Peringathur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17571, N'Perinthalmanna', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17572, N'Perole', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17573, N'Perumanna', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17574, N'Perumbaikadu', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17575, N'Perumbavoor', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17576, N'Pinarayi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17577, N'Piravam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17578, N'Ponnani', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17579, N'Pottore', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17580, N'Pudukad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17581, N'Punalur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17582, N'Puranattukara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17583, N'Puthunagaram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17584, N'Puthuppariyaram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17585, N'Puzhathi', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17586, N'Ramanattukara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17587, N'Shoranur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17588, N'Sultans Battery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17589, N'Sulthan Bathery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17590, N'Talipparamba', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17591, N'Thaikkad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17592, N'Thalassery', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17593, N'Thannirmukkam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17594, N'Theyyalingal', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17595, N'Thiruvalla', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17596, N'Thiruvananthapuram', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17597, N'Thiruvankulam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17598, N'Thodupuzha', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17599, N'Thottada', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17600, N'Thrippunithura', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17601, N'Thrissur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17602, N'Tirur', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17603, N'Udma', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17604, N'Vadakara', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17605, N'Vaikam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17606, N'Valapattam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17607, N'Vallachira', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17608, N'Varam', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17609, N'Varappuzha', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17610, N'Varkala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17611, N'Vayalar', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17612, N'Vazhakkala', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17613, N'Venmanad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17614, N'Villiappally', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17615, N'Wayanad', 1643)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17616, N'Agethi', 1644)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17617, N'Amini', 1644)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17618, N'Androth Island', 1644)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17619, N'Kavaratti', 1644)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17620, N'Minicoy', 1644)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17621, N'Agar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17622, N'Ajaigarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17623, N'Akoda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17624, N'Akodia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17625, N'Alampur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17626, N'Alirajpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17627, N'Alot', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17628, N'Amanganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17629, N'Amarkantak', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17630, N'Amarpatan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17631, N'Amarwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17632, N'Ambada', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17633, N'Ambah', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17634, N'Amla', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17635, N'Amlai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17636, N'Anjad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17637, N'Antri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17638, N'Anuppur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17639, N'Aron', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17640, N'Ashoknagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17641, N'Ashta', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17642, N'Babai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17643, N'Bada Malhera', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17644, N'Badagaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17645, N'Badagoan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17646, N'Badarwas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17647, N'Badawada', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17648, N'Badi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17649, N'Badkuhi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17650, N'Badnagar', 1645)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17651, N'Badnawar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17652, N'Badod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17653, N'Badoda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17654, N'Badra', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17655, N'Bagh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17656, N'Bagli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17657, N'Baihar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17658, N'Baikunthpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17659, N'Bakswaha', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17660, N'Balaghat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17661, N'Baldeogarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17662, N'Bamaniya', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17663, N'Bamhani', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17664, N'Bamor', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17665, N'Bamora', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17666, N'Banda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17667, N'Bangawan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17668, N'Bansatar Kheda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17669, N'Baraily', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17670, N'Barela', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17671, N'Barghat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17672, N'Bargi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17673, N'Barhi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17674, N'Barigarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17675, N'Barwaha', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17676, N'Barwani', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17677, N'Basoda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17678, N'Begamganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17679, N'Beohari', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17680, N'Berasia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17681, N'Betma', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17682, N'Betul', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17683, N'Betul Bazar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17684, N'Bhainsdehi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17685, N'Bhamodi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17686, N'Bhander', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17687, N'Bhanpura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17688, N'Bharveli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17689, N'Bhaurasa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17690, N'Bhavra', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17691, N'Bhedaghat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17692, N'Bhikangaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17693, N'Bhilakhedi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17694, N'Bhind', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17695, N'Bhitarwar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17696, N'Bhopal', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17697, N'Bhuibandh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17698, N'Biaora', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17699, N'Bijawar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17700, N'Bijeypur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17701, N'Bijrauni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17702, N'Bijuri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17703, N'Bilaua', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17704, N'Bilpura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17705, N'Bina Railway Colony', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17706, N'Bina-Etawa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17707, N'Birsinghpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17708, N'Boda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17709, N'Budhni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17710, N'Burhanpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17711, N'Burhar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17712, N'Chachaura Binaganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17713, N'Chakghat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17714, N'Chandameta Butar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17715, N'Chanderi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17716, N'Chandia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17717, N'Chandla', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17718, N'Chaurai Khas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17719, N'Chhatarpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17720, N'Chhindwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17721, N'Chhota Chhindwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17722, N'Chichli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17723, N'Chitrakut', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17724, N'Churhat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17725, N'Daboh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17726, N'Dabra', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17727, N'Damoh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17728, N'Damua', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17729, N'Datia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17730, N'Deodara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17731, N'Deori', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17732, N'Deori Khas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17733, N'Depalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17734, N'Devendranagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17735, N'Devhara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17736, N'Dewas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17737, N'Dhamnod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17738, N'Dhana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17739, N'Dhanpuri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17740, N'Dhar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17741, N'Dharampuri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17742, N'Dighawani', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17743, N'Diken', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17744, N'Dindori', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17745, N'Dola', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17746, N'Dumar Kachhar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17747, N'Dungariya Chhapara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17748, N'Gadarwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17749, N'Gairatganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17750, N'Gandhi Sagar Hydel Colony', 1645)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17751, N'Ganjbasoda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17752, N'Garhakota', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17753, N'Garhi Malhara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17754, N'Garoth', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17755, N'Gautapura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17756, N'Ghansor', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17757, N'Ghuwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17758, N'Gogaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17759, N'Gogapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17760, N'Gohad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17761, N'Gormi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17762, N'Govindgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17763, N'Guna', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17764, N'Gurh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17765, N'Gwalior', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17766, N'Hanumana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17767, N'Harda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17768, N'Harpalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17769, N'Harrai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17770, N'Harsud', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17771, N'Hatod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17772, N'Hatpipalya', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17773, N'Hatta', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17774, N'Hindoria', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17775, N'Hirapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17776, N'Hoshangabad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17777, N'Ichhawar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17778, N'Iklehra', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17779, N'Indergarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17780, N'Indore', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17781, N'Isagarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17782, N'Itarsi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17783, N'Jabalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17784, N'Jabalpur Cantonment', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17785, N'Jabalpur G.C.F', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17786, N'Jaisinghnagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17787, N'Jaithari', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17788, N'Jaitwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17789, N'Jamai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17790, N'Jaora', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17791, N'Jatachhapar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17792, N'Jatara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17793, N'Jawad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17794, N'Jawar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17795, N'Jeronkhalsa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17796, N'Jhabua', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17797, N'Jhundpura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17798, N'Jiran', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17799, N'Jirapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17800, N'Jobat', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17801, N'Joura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17802, N'Kailaras', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17803, N'Kaimur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17804, N'Kakarhati', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17805, N'Kalichhapar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17806, N'Kanad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17807, N'Kannod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17808, N'Kantaphod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17809, N'Kareli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17810, N'Karera', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17811, N'Kari', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17812, N'Karnawad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17813, N'Karrapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17814, N'Kasrawad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17815, N'Katangi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17816, N'Katni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17817, N'Kelhauri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17818, N'Khachrod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17819, N'Khajuraho', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17820, N'Khamaria', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17821, N'Khand', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17822, N'Khandwa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17823, N'Khaniyadhana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17824, N'Khargapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17825, N'Khargone', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17826, N'Khategaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17827, N'Khetia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17828, N'Khilchipur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17829, N'Khirkiya', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17830, N'Khujner', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17831, N'Khurai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17832, N'Kolaras', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17833, N'Kotar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17834, N'Kothi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17835, N'Kotma', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17836, N'Kukshi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17837, N'Kumbhraj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17838, N'Kurwai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17839, N'Lahar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17840, N'Lakhnadon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17841, N'Lateri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17842, N'Laundi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17843, N'Lidhora Khas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17844, N'Lodhikheda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17845, N'Loharda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17846, N'Machalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17847, N'Madhogarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17848, N'Maharajpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17849, N'Maheshwar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17850, N'Mahidpur', 1645)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17851, N'Maihar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17852, N'Majholi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17853, N'Makronia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17854, N'Maksi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17855, N'Malaj Khand', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17856, N'Malanpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17857, N'Malhargarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17858, N'Manasa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17859, N'Manawar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17860, N'Mandav', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17861, N'Mandideep', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17862, N'Mandla', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17863, N'Mandleshwar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17864, N'Mandsaur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17865, N'Manegaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17866, N'Mangawan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17867, N'Manglaya Sadak', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17868, N'Manpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17869, N'Mau', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17870, N'Mauganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17871, N'Meghnagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17872, N'Mehara Gaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17873, N'Mehgaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17874, N'Mhaugaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17875, N'Mhow', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17876, N'Mihona', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17877, N'Mohgaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17878, N'Morar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17879, N'Morena', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17880, N'Morwa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17881, N'Multai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17882, N'Mundi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17883, N'Mungaoli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17884, N'Murwara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17885, N'Nagda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17886, N'Nagod', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17887, N'Nagri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17888, N'Naigarhi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17889, N'Nainpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17890, N'Nalkheda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17891, N'Namli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17892, N'Narayangarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17893, N'Narsimhapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17894, N'Narsingarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17895, N'Narsinghpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17896, N'Narwar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17897, N'Nasrullaganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17898, N'Naudhia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17899, N'Naugaon', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17900, N'Naurozabad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17901, N'Neemuch', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17902, N'Nepa Nagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17903, N'Neuton Chikhli Kalan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17904, N'Nimach', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17905, N'Niwari', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17906, N'Obedullaganj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17907, N'Omkareshwar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17908, N'Orachha', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17909, N'Ordinance Factory Itarsi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17910, N'Pachmarhi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17911, N'Pachmarhi Cantonment', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17912, N'Pachore', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17913, N'Palchorai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17914, N'Palda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17915, N'Palera', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17916, N'Pali', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17917, N'Panagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17918, N'Panara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17919, N'Pandaria', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17920, N'Pandhana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17921, N'Pandhurna', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17922, N'Panna', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17923, N'Pansemal', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17924, N'Parasia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17925, N'Pasan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17926, N'Patan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17927, N'Patharia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17928, N'Pawai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17929, N'Petlawad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17930, N'Phuph Kalan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17931, N'Pichhore', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17932, N'Pipariya', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17933, N'Pipliya Mandi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17934, N'Piploda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17935, N'Pithampur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17936, N'Polay Kalan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17937, N'Porsa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17938, N'Prithvipur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17939, N'Raghogarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17940, N'Rahatgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17941, N'Raisen', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17942, N'Rajakhedi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17943, N'Rajgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17944, N'Rajnagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17945, N'Rajpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17946, N'Rampur Baghelan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17947, N'Rampur Naikin', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17948, N'Rampura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17949, N'Ranapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17950, N'Ranipura', 1645)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17951, N'Ratangarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17952, N'Ratlam', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17953, N'Ratlam Kasba', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17954, N'Rau', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17955, N'Rehli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17956, N'Rehti', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17957, N'Rewa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17958, N'Sabalgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17959, N'Sagar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17960, N'Sagar Cantonment', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17961, N'Sailana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17962, N'Sanawad', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17963, N'Sanchi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17964, N'Sanwer', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17965, N'Sarangpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17966, N'Sardarpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17967, N'Sarni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17968, N'Satai', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17969, N'Satna', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17970, N'Satwas', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17971, N'Sausar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17972, N'Sehore', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17973, N'Semaria', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17974, N'Sendhwa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17975, N'Seondha', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17976, N'Seoni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17977, N'Seoni Malwa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17978, N'Sethia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17979, N'Shahdol', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17980, N'Shahgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17981, N'Shahpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17982, N'Shahpura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17983, N'Shajapur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17984, N'Shamgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17985, N'Sheopur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17986, N'Shivpuri', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17987, N'Shujalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17988, N'Sidhi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17989, N'Sihora', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17990, N'Singolo', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17991, N'Singrauli', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17992, N'Sinhasa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17993, N'Sirgora', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17994, N'Sirmaur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17995, N'Sironj', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17996, N'Sitamau', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17997, N'Sohagpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17998, N'Sonkatch', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (17999, N'Soyatkalan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18000, N'Suhagi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18001, N'Sultanpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18002, N'Susner', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18003, N'Suthaliya', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18004, N'Tal', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18005, N'Talen', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18006, N'Tarana', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18007, N'Taricharkalan', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18008, N'Tekanpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18009, N'Tendukheda', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18010, N'Teonthar', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18011, N'Thandia', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18012, N'Tikamgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18013, N'Timarni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18014, N'Tirodi', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18015, N'Udaipura', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18016, N'Ujjain', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18017, N'Ukwa', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18018, N'Umaria', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18019, N'Unchahara', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18020, N'Unhel', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18021, N'Vehicle Factory Jabalpur', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18022, N'Vidisha', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18023, N'Vijayraghavgarh', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18024, N'Waraseoni', 1645)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18025, N'Achalpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18026, N'Aheri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18027, N'Ahmadnagar Cantonment', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18028, N'Ahmadpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18029, N'Ahmednagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18030, N'Ajra', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18031, N'Akalkot', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18032, N'Akkalkuwa', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18033, N'Akola', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18034, N'Akot', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18035, N'Alandi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18036, N'Alibag', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18037, N'Allapalli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18038, N'Alore', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18039, N'Amalner', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18040, N'Ambad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18041, N'Ambajogai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18042, N'Ambernath', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18043, N'Ambivali Tarf Wankhal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18044, N'Amgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18045, N'Amravati', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18046, N'Anjangaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18047, N'Arvi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18048, N'Ashta', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18049, N'Ashti', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18050, N'Aurangabad', 1646)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18051, N'Aurangabad Cantonment', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18052, N'Ausa', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18053, N'Babhulgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18054, N'Badlapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18055, N'Balapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18056, N'Ballarpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18057, N'Baramati', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18058, N'Barshi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18059, N'Basmat', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18060, N'Beed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18061, N'Bhadravati', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18062, N'Bhagur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18063, N'Bhandara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18064, N'Bhigvan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18065, N'Bhingar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18066, N'Bhiwandi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18067, N'Bhokhardan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18068, N'Bhor', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18069, N'Bhosari', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18070, N'Bhum', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18071, N'Bhusawal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18072, N'Bid', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18073, N'Biloli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18074, N'Birwadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18075, N'Boisar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18076, N'Bop Khel', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18077, N'Brahmapuri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18078, N'Budhgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18079, N'Buldana', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18080, N'Buldhana', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18081, N'Butibori', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18082, N'Chakan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18083, N'Chalisgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18084, N'Chandrapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18085, N'Chandur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18086, N'Chandur Bazar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18087, N'Chandvad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18088, N'Chicholi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18089, N'Chikhala', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18090, N'Chikhaldara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18091, N'Chikhli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18092, N'Chinchani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18093, N'Chinchwad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18094, N'Chiplun', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18095, N'Chopda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18096, N'Dabhol', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18097, N'Dahance', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18098, N'Dahanu', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18099, N'Daharu', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18100, N'Dapoli Camp', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18101, N'Darwa', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18102, N'Daryapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18103, N'Dattapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18104, N'Daund', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18105, N'Davlameti', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18106, N'Deglur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18107, N'Dehu Road', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18108, N'Deolali', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18109, N'Deolali Pravara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18110, N'Deoli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18111, N'Desaiganj', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18112, N'Deulgaon Raja', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18113, N'Dewhadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18114, N'Dharangaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18115, N'Dharmabad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18116, N'Dharur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18117, N'Dhatau', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18118, N'Dhule', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18119, N'Digdoh', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18120, N'Diglur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18121, N'Digras', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18122, N'Dombivli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18123, N'Dondaicha', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18124, N'Dudhani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18125, N'Durgapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18126, N'Dyane', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18127, N'Edandol', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18128, N'Eklahare', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18129, N'Faizpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18130, N'Fekari', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18131, N'Gadchiroli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18132, N'Gadhinghaj', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18133, N'Gandhi Nagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18134, N'Ganeshpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18135, N'Gangakher', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18136, N'Gangapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18137, N'Gevrai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18138, N'Ghatanji', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18139, N'Ghoti', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18140, N'Ghugus', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18141, N'Ghulewadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18142, N'Godoli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18143, N'Gondia', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18144, N'Guhagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18145, N'Hadgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18146, N'Harnai Beach', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18147, N'Hinganghat', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18148, N'Hingoli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18149, N'Hupari', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18150, N'Ichalkaranji', 1646)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18151, N'Igatpuri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18152, N'Indapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18153, N'Jaisinghpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18154, N'Jalgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18155, N'Jalna', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18156, N'Jamkhed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18157, N'Jawhar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18158, N'Jaysingpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18159, N'Jejuri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18160, N'Jintur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18161, N'Junnar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18162, N'Kabnur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18163, N'Kagal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18164, N'Kalamb', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18165, N'Kalamnuri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18166, N'Kalas', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18167, N'Kalmeshwar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18168, N'Kalundre', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18169, N'Kalyan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18170, N'Kamthi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18171, N'Kamthi Cantonment', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18172, N'Kandari', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18173, N'Kandhar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18174, N'Kandri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18175, N'Kandri II', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18176, N'Kanhan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18177, N'Kankavli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18178, N'Kannad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18179, N'Karad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18180, N'Karanja', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18181, N'Karanje Tarf', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18182, N'Karivali', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18183, N'Karjat', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18184, N'Karmala', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18185, N'Kasara Budruk', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18186, N'Katai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18187, N'Katkar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18188, N'Katol', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18189, N'Kegaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18190, N'Khadkale', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18191, N'Khadki', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18192, N'Khamgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18193, N'Khapa', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18194, N'Kharadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18195, N'Kharakvasla', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18196, N'Khed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18197, N'Kherdi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18198, N'Khoni', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18199, N'Khopoli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18200, N'Khuldabad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18201, N'Kinwat', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18202, N'Kodoli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18203, N'Kolhapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18204, N'Kon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18205, N'Kondumal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18206, N'Kopargaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18207, N'Kopharad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18208, N'Koradi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18209, N'Koregaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18210, N'Korochi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18211, N'Kudal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18212, N'Kundaim', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18213, N'Kundalwadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18214, N'Kurandvad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18215, N'Kurduvadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18216, N'Kusgaon Budruk', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18217, N'Lanja', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18218, N'Lasalgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18219, N'Latur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18220, N'Loha', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18221, N'Lohegaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18222, N'Lonar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18223, N'Lonavala', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18224, N'Madhavnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18225, N'Mahabaleshwar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18226, N'Mahad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18227, N'Mahadula', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18228, N'Maindargi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18229, N'Majalgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18230, N'Malegaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18231, N'Malgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18232, N'Malkapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18233, N'Malwan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18234, N'Manadur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18235, N'Manchar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18236, N'Mangalvedhe', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18237, N'Mangrul Pir', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18238, N'Manmad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18239, N'Manor', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18240, N'Mansar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18241, N'Manwath', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18242, N'Mapuca', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18243, N'Matheran', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18244, N'Mehkar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18245, N'Mhasla', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18246, N'Mhaswad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18247, N'Mira Bhayandar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18248, N'Miraj', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18249, N'Mohpa', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18250, N'Mohpada', 1646)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18251, N'Moram', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18252, N'Morshi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18253, N'Mowad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18254, N'Mudkhed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18255, N'Mukhed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18256, N'Mul', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18257, N'Mulshi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18258, N'Mumbai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18259, N'Murbad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18260, N'Murgud', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18261, N'Murtijapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18262, N'Murud', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18263, N'Nachane', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18264, N'Nagardeole', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18265, N'Nagothane', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18266, N'Nagpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18267, N'Nakoda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18268, N'Nalasopara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18269, N'Naldurg', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18270, N'Nanded', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18271, N'Nandgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18272, N'Nandura', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18273, N'Nandurbar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18274, N'Narkhed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18275, N'Nashik', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18276, N'Navapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18277, N'Navi Mumbai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18278, N'Navi Mumbai Panvel', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18279, N'Neral', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18280, N'Nigdi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18281, N'Nilanga', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18282, N'Nildoh', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18283, N'Nimbhore', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18284, N'Ojhar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18285, N'Osmanabad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18286, N'Pachgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18287, N'Pachora', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18288, N'Padagha', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18289, N'Paithan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18290, N'Palghar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18291, N'Pali', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18292, N'Panchgani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18293, N'Pandhakarwada', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18294, N'Pandharpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18295, N'Panhala', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18296, N'Panvel', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18297, N'Paranda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18298, N'Parbhani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18299, N'Parli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18300, N'Parola', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18301, N'Partur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18302, N'Pasthal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18303, N'Patan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18304, N'Pathardi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18305, N'Pathri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18306, N'Patur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18307, N'Pawni', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18308, N'Pen', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18309, N'Pethumri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18310, N'Phaltan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18311, N'Pimpri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18312, N'Poladpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18313, N'Pulgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18314, N'Pune', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18315, N'Pune Cantonment', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18316, N'Purna', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18317, N'Purushottamnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18318, N'Pusad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18319, N'Rahimatpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18320, N'Rahta Pimplas', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18321, N'Rahuri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18322, N'Raigad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18323, N'Rajapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18324, N'Rajgurunagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18325, N'Rajur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18326, N'Rajura', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18327, N'Ramtek', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18328, N'Ratnagiri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18329, N'Ravalgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18330, N'Raver', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18331, N'Revadanda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18332, N'Risod', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18333, N'Roha Ashtami', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18334, N'Sakri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18335, N'Sandor', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18336, N'Sangamner', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18337, N'Sangli', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18338, N'Sangole', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18339, N'Sasti', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18340, N'Sasvad', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18341, N'Satana', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18342, N'Satara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18343, N'Savantvadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18344, N'Savda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18345, N'Savner', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18346, N'Sawari Jawharnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18347, N'Selu', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18348, N'Shahada', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18349, N'Shahapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18350, N'Shegaon', 1646)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18351, N'Shelar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18352, N'Shendurjana', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18353, N'Shirdi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18354, N'Shirgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18355, N'Shirpur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18356, N'Shirur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18357, N'Shirwal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18358, N'Shivatkar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18359, N'Shrigonda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18360, N'Shrirampur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18361, N'Shrirampur Rural', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18362, N'Sillewada', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18363, N'Sillod', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18364, N'Sindhudurg', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18365, N'Sindi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18366, N'Sindi Turf Hindnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18367, N'Sindkhed Raja', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18368, N'Singnapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18369, N'Sinnar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18370, N'Sirur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18371, N'Sitasawangi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18372, N'Solapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18373, N'Sonai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18374, N'Sonegaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18375, N'Soyagaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18376, N'Srivardhan', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18377, N'Surgana', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18378, N'Talegaon Dabhade', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18379, N'Taloda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18380, N'Taloja', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18381, N'Talwade', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18382, N'Tarapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18383, N'Tasgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18384, N'Tathavade', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18385, N'Tekadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18386, N'Telhara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18387, N'Thane', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18388, N'Tirira', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18389, N'Totaladoh', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18390, N'Trimbak', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18391, N'Tuljapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18392, N'Tumsar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18393, N'Uchgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18394, N'Udgir', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18395, N'Ulhasnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18396, N'Umarga', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18397, N'Umarkhed', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18398, N'Umarsara', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18399, N'Umbar Pada Nandade', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18400, N'Umred', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18401, N'Umri Pragane Balapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18402, N'Uran', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18403, N'Uran Islampur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18404, N'Utekhol', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18405, N'Vada', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18406, N'Vadgaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18407, N'Vadgaon Kasba', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18408, N'Vaijapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18409, N'Vanvadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18410, N'Varangaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18411, N'Vasai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18412, N'Vasantnagar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18413, N'Vashind', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18414, N'Vengurla', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18415, N'Virar', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18416, N'Visapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18417, N'Vite', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18418, N'Vithalwadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18419, N'Wadi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18420, N'Waghapur', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18421, N'Wai', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18422, N'Wajegaon', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18423, N'Walani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18424, N'Wanadongri', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18425, N'Wani', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18426, N'Wardha', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18427, N'Warora', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18428, N'Warthi', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18429, N'Warud', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18430, N'Washim', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18431, N'Yaval', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18432, N'Yavatmal', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18433, N'Yeola', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18434, N'Yerkheda', 1646)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18435, N'Andro', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18436, N'Bijoy Govinda', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18437, N'Bishnupur', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18438, N'Churachandpur', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18439, N'Heriok', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18440, N'Imphal', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18441, N'Jiribam', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18442, N'Kakching', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18443, N'Kakching Khunou', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18444, N'Khongman', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18445, N'Kumbi', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18446, N'Kwakta', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18447, N'Lamai', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18448, N'Lamjaotongba', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18449, N'Lamshang', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18450, N'Lilong', 1647)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18451, N'Mayang Imphal', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18452, N'Moirang', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18453, N'Moreh', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18454, N'Nambol', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18455, N'Naoriya Pakhanglakpa', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18456, N'Ningthoukhong', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18457, N'Oinam', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18458, N'Porompat', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18459, N'Samurou', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18460, N'Sekmai Bazar', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18461, N'Senapati', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18462, N'Sikhong Sekmai', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18463, N'Sugnu', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18464, N'Thongkhong Laxmi Bazar', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18465, N'Thoubal', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18466, N'Torban', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18467, N'Wangjing', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18468, N'Wangoi', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18469, N'Yairipok', 1647)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18470, N'Baghmara', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18471, N'Cherrapunji', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18472, N'Jawai', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18473, N'Madanrting', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18474, N'Mairang', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18475, N'Mawlai', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18476, N'Nongmynsong', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18477, N'Nongpoh', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18478, N'Nongstoin', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18479, N'Nongthymmai', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18480, N'Pynthorumkhrah', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18481, N'Resubelpara', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18482, N'Shillong', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18483, N'Shillong Cantonment', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18484, N'Tura', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18485, N'Williamnagar', 1648)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18486, N'Aizawl', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18487, N'Bairabi', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18488, N'Biate', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18489, N'Champhai', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18490, N'Darlawn', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18491, N'Hnahthial', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18492, N'Kawnpui', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18493, N'Khawhai', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18494, N'Khawzawl', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18495, N'Kolasib', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18496, N'Lengpui', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18497, N'Lunglei', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18498, N'Mamit', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18499, N'North Vanlaiphai', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18500, N'Saiha', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18501, N'Sairang', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18502, N'Saitul', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18503, N'Serchhip', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18504, N'Thenzawl', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18505, N'Tlabung', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18506, N'Vairengte', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18507, N'Zawlnuam', 1649)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18508, N'Chumukedima', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18509, N'Dimapur', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18510, N'Kohima', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18511, N'Mokokchung', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18512, N'Mon', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18513, N'Phek', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18514, N'Tuensang', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18515, N'Wokha', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18516, N'Zunheboto', 1650)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18517, N'Anandapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18518, N'Angul', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18519, N'Aska', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18520, N'Athgarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18521, N'Athmallik', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18522, N'Balagoda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18523, N'Balangir', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18524, N'Balasore', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18525, N'Baleshwar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18526, N'Balimeta', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18527, N'Balugaon', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18528, N'Banapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18529, N'Bangura', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18530, N'Banki', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18531, N'Banposh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18532, N'Barbil', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18533, N'Bargarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18534, N'Baripada', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18535, N'Barpali', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18536, N'Basudebpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18537, N'Baudh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18538, N'Belagachhia', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18539, N'Belaguntha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18540, N'Belpahar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18541, N'Berhampur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18542, N'Bhadrak', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18543, N'Bhanjanagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18544, N'Bhawanipatna', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18545, N'Bhuban', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18546, N'Bhubaneswar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18547, N'Binika', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18548, N'Birmitrapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18549, N'Bishama Katek', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18550, N'Bolangir', 1653)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18551, N'Brahmapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18552, N'Brajrajnagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18553, N'Buguda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18554, N'Burla', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18555, N'Byasanagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18556, N'Champua', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18557, N'Chandapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18558, N'Chandbali', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18559, N'Chandili', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18560, N'Charibatia', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18561, N'Chatrapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18562, N'Chikitigarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18563, N'Chitrakonda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18564, N'Choudwar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18565, N'Cuttack', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18566, N'Dadhapatna', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18567, N'Daitari', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18568, N'Damanjodi', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18569, N'Deogarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18570, N'Deracolliery', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18571, N'Dhamanagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18572, N'Dhenkanal', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18573, N'Digapahandi', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18574, N'Dungamal', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18575, N'Fertilizer Corporation of Indi', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18576, N'Ganjam', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18577, N'Ghantapada', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18578, N'Gopalpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18579, N'Gudari', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18580, N'Gunupur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18581, N'Hatibandha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18582, N'Hinjilikatu', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18583, N'Hirakud', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18584, N'Jagatsinghapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18585, N'Jajpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18586, N'Jalda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18587, N'Jaleswar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18588, N'Jatni', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18589, N'Jaypur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18590, N'Jeypore', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18591, N'Jharsuguda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18592, N'Jhumpura', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18593, N'Joda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18594, N'Junagarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18595, N'Kamakhyanagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18596, N'Kantabanji', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18597, N'Kantilo', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18598, N'Karanja', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18599, N'Kashinagara', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18600, N'Kataka', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18601, N'Kavisuryanagar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18602, N'Kendrapara', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18603, N'Kendujhar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18604, N'Keonjhar', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18605, N'Kesinga', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18606, N'Khaliapali', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18607, N'Khalikote', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18608, N'Khandaparha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18609, N'Kharhial', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18610, N'Kharhial Road', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18611, N'Khatiguda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18612, N'Khurda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18613, N'Kochinda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18614, N'Kodala', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18615, N'Konark', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18616, N'Koraput', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18617, N'Kotaparh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18618, N'Lanjigarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18619, N'Lattikata', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18620, N'Makundapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18621, N'Malkangiri', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18622, N'Mukhiguda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18623, N'Nabarangpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18624, N'Nalco', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18625, N'Naurangapur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18626, N'Nayagarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18627, N'Nilagiri', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18628, N'Nimaparha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18629, N'Nuapada', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18630, N'Nuapatna', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18631, N'OCL Industrialship', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18632, N'Padampur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18633, N'Paradip', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18634, N'Paradwip', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18635, N'Parlakimidi', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18636, N'Patamundai', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18637, N'Patnagarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18638, N'Phulabani', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18639, N'Pipili', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18640, N'Polasara', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18641, N'Pratapsasan', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18642, N'Puri', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18643, N'Purushottampur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18644, N'Rairangpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18645, N'Raj Gangpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18646, N'Rambha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18647, N'Raurkela', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18648, N'Raurkela Civil Township', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18649, N'Rayagada', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18650, N'Redhakhol', 1653)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18651, N'Remuna', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18652, N'Rengali', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18653, N'Rourkela', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18654, N'Sambalpur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18655, N'Sinapali', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18656, N'Sonepur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18657, N'Sorada', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18658, N'Soro', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18659, N'Sunabeda', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18660, N'Sundargarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18661, N'Talcher', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18662, N'Talcher Thermal Power Station ', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18663, N'Tarabha', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18664, N'Tensa', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18665, N'Titlagarh', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18666, N'Udala', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18667, N'Udayagiri', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18668, N'Umarkot', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18669, N'Vikrampur', 1653)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18670, N'Ariankuppam', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18671, N'Karaikal', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18672, N'Kurumbapet', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18673, N'Mahe', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18674, N'Ozhukarai', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18675, N'Pondicherry', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18676, N'Villianur', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18677, N'Yanam', 1655)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18678, N'Abohar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18679, N'Adampur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18680, N'Ahmedgarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18681, N'Ajnala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18682, N'Akalgarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18683, N'Alawalpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18684, N'Amloh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18685, N'Amritsar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18686, N'Amritsar Cantonment', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18687, N'Anandpur Sahib', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18688, N'Badhni Kalan', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18689, N'Bagh Purana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18690, N'Balachaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18691, N'Banaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18692, N'Banga', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18693, N'Banur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18694, N'Baretta', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18695, N'Bariwala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18696, N'Barnala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18697, N'Bassi Pathana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18698, N'Batala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18699, N'Bathinda', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18700, N'Begowal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18701, N'Behrampur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18702, N'Bhabat', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18703, N'Bhadur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18704, N'Bhankharpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18705, N'Bharoli Kalan', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18706, N'Bhawanigarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18707, N'Bhikhi', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18708, N'Bhikhiwind', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18709, N'Bhisiana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18710, N'Bhogpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18711, N'Bhuch', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18712, N'Bhulath', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18713, N'Budha Theh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18714, N'Budhlada', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18715, N'Chima', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18716, N'Chohal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18717, N'Dasuya', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18718, N'Daulatpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18719, N'Dera Baba Nanak', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18720, N'Dera Bassi', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18721, N'Dhanaula', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18722, N'Dharam Kot', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18723, N'Dhariwal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18724, N'Dhilwan', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18725, N'Dhuri', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18726, N'Dinanagar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18727, N'Dirba', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18728, N'Doraha', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18729, N'Faridkot', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18730, N'Fateh Nangal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18731, N'Fatehgarh Churian', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18732, N'Fatehgarh Sahib', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18733, N'Fazilka', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18734, N'Firozpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18735, N'Firozpur Cantonment', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18736, N'Gardhiwala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18737, N'Garhshankar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18738, N'Ghagga', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18739, N'Ghanaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18740, N'Giddarbaha', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18741, N'Gobindgarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18742, N'Goniana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18743, N'Goraya', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18744, N'Gurdaspur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18745, N'Guru Har Sahai', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18746, N'Hajipur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18747, N'Handiaya', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18748, N'Hariana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18749, N'Hoshiarpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18750, N'Hussainpur', 1656)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18751, N'Jagraon', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18752, N'Jaitu', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18753, N'Jalalabad', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18754, N'Jalandhar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18755, N'Jalandhar Cantonment', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18756, N'Jandiala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18757, N'Jugial', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18758, N'Kalanaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18759, N'Kapurthala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18760, N'Karoran', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18761, N'Kartarpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18762, N'Khamanon', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18763, N'Khanauri', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18764, N'Khanna', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18765, N'Kharar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18766, N'Khem Karan', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18767, N'Kot Fatta', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18768, N'Kot Isa Khan', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18769, N'Kot Kapura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18770, N'Kotkapura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18771, N'Kurali', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18772, N'Lalru', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18773, N'Lehra Gaga', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18774, N'Lodhian Khas', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18775, N'Longowal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18776, N'Ludhiana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18777, N'Machhiwara', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18778, N'Mahilpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18779, N'Majitha', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18780, N'Makhu', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18781, N'Malaut', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18782, N'Malerkotla', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18783, N'Maloud', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18784, N'Mandi Gobindgarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18785, N'Mansa', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18786, N'Maur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18787, N'Moga', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18788, N'Mohali', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18789, N'Moonak', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18790, N'Morinda', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18791, N'Mukerian', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18792, N'Muktsar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18793, N'Mullanpur Dakha', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18794, N'Mullanpur Garibdas', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18795, N'Munak', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18796, N'Muradpura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18797, N'Nabha', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18798, N'Nakodar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18799, N'Nangal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18800, N'Nawashahr', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18801, N'Naya Nangal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18802, N'Nehon', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18803, N'Nurmahal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18804, N'Pathankot', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18805, N'Patiala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18806, N'Patti', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18807, N'Pattran', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18808, N'Payal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18809, N'Phagwara', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18810, N'Phillaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18811, N'Qadian', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18812, N'Rahon', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18813, N'Raikot', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18814, N'Raja Sansi', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18815, N'Rajpura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18816, N'Ram Das', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18817, N'Raman', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18818, N'Rampura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18819, N'Rayya', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18820, N'Rupnagar', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18821, N'Rurki Kasba', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18822, N'Sahnewal', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18823, N'Samana', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18824, N'Samrala', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18825, N'Sanaur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18826, N'Sangat', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18827, N'Sangrur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18828, N'Sansarpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18829, N'Sardulgarh', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18830, N'Shahkot', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18831, N'Sham Churasi', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18832, N'Shekhpura', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18833, N'Sirhind', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18834, N'Sri Hargobindpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18835, N'Sujanpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18836, N'Sultanpur Lodhi', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18837, N'Sunam', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18838, N'Talwandi Bhai', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18839, N'Talwara', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18840, N'Tappa', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18841, N'Tarn Taran', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18842, N'Urmar Tanda', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18843, N'Zira', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18844, N'Zirakpur', 1656)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18845, N'Abu Road', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18846, N'Ajmer', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18847, N'Aklera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18848, N'Alwar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18849, N'Amet', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18850, N'Antah', 1657)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18851, N'Anupgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18852, N'Asind', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18853, N'Bagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18854, N'Bagru', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18855, N'Bahror', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18856, N'Bakani', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18857, N'Bali', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18858, N'Balotra', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18859, N'Bandikui', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18860, N'Banswara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18861, N'Baran', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18862, N'Bari', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18863, N'Bari Sadri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18864, N'Barmer', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18865, N'Basi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18866, N'Basni Belima', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18867, N'Baswa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18868, N'Bayana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18869, N'Beawar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18870, N'Begun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18871, N'Bhadasar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18872, N'Bhadra', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18873, N'Bhalariya', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18874, N'Bharatpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18875, N'Bhasawar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18876, N'Bhawani Mandi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18877, N'Bhawri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18878, N'Bhilwara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18879, N'Bhindar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18880, N'Bhinmal', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18881, N'Bhiwadi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18882, N'Bijoliya Kalan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18883, N'Bikaner', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18884, N'Bilara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18885, N'Bissau', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18886, N'Borkhera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18887, N'Budhpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18888, N'Bundi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18889, N'Chatsu', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18890, N'Chechat', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18891, N'Chhabra', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18892, N'Chhapar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18893, N'Chhipa Barod', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18894, N'Chhoti Sadri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18895, N'Chirawa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18896, N'Chittaurgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18897, N'Chittorgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18898, N'Chomun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18899, N'Churu', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18900, N'Daosa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18901, N'Dariba', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18902, N'Dausa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18903, N'Deoli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18904, N'Deshnok', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18905, N'Devgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18906, N'Devli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18907, N'Dhariawad', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18908, N'Dhaulpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18909, N'Dholpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18910, N'Didwana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18911, N'Dig', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18912, N'Dungargarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18913, N'Dungarpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18914, N'Falna', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18915, N'Fatehnagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18916, N'Fatehpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18917, N'Gajsinghpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18918, N'Galiakot', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18919, N'Ganganagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18920, N'Gangapur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18921, N'Goredi Chancha', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18922, N'Gothra', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18923, N'Govindgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18924, N'Gulabpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18925, N'Hanumangarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18926, N'Hindaun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18927, N'Indragarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18928, N'Jahazpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18929, N'Jaipur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18930, N'Jaisalmer', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18931, N'Jaiselmer', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18932, N'Jaitaran', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18933, N'Jalore', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18934, N'Jhalawar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18935, N'Jhalrapatan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18936, N'Jhunjhunun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18937, N'Jobner', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18938, N'Jodhpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18939, N'Kaithun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18940, N'Kaman', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18941, N'Kankroli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18942, N'Kanor', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18943, N'Kapasan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18944, N'Kaprain', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18945, N'Karanpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18946, N'Karauli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18947, N'Kekri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18948, N'Keshorai Patan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18949, N'Kesrisinghpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18950, N'Khairthal', 1657)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18951, N'Khandela', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18952, N'Khanpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18953, N'Kherli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18954, N'Kherliganj', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18955, N'Kherwara Chhaoni', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18956, N'Khetri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18957, N'Kiranipura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18958, N'Kishangarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18959, N'Kishangarh Ranwal', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18960, N'Kolvi Rajendrapura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18961, N'Kot Putli', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18962, N'Kota', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18963, N'Kuchaman', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18964, N'Kuchera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18965, N'Kumbhalgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18966, N'Kumbhkot', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18967, N'Kumher', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18968, N'Kushalgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18969, N'Lachhmangarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18970, N'Ladnun', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18971, N'Lakheri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18972, N'Lalsot', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18973, N'Losal', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18974, N'Madanganj', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18975, N'Mahu Kalan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18976, N'Mahwa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18977, N'Makrana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18978, N'Malpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18979, N'Mandal', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18980, N'Mandalgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18981, N'Mandawar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18982, N'Mandwa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18983, N'Mangrol', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18984, N'Manohar Thana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18985, N'Manoharpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18986, N'Marwar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18987, N'Merta', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18988, N'Modak', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18989, N'Mount Abu', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18990, N'Mukandgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18991, N'Mundwa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18992, N'Nadbai', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18993, N'Naenwa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18994, N'Nagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18995, N'Nagaur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18996, N'Napasar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18997, N'Naraina', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18998, N'Nasirabad', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (18999, N'Nathdwara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19000, N'Nawa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19001, N'Nawalgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19002, N'Neem Ka Thana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19003, N'Neemrana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19004, N'Newa Talai', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19005, N'Nimaj', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19006, N'Nimbahera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19007, N'Niwai', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19008, N'Nohar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19009, N'Nokha', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19010, N'One SGM', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19011, N'Padampur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19012, N'Pali', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19013, N'Partapur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19014, N'Parvatsar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19015, N'Pasoond', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19016, N'Phalna', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19017, N'Phalodi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19018, N'Phulera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19019, N'Pilani', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19020, N'Pilibanga', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19021, N'Pindwara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19022, N'Pipalia Kalan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19023, N'Pipar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19024, N'Pirawa', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19025, N'Pokaran', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19026, N'Pratapgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19027, N'Pushkar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19028, N'Raipur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19029, N'Raisinghnagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19030, N'Rajakhera', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19031, N'Rajaldesar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19032, N'Rajgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19033, N'Rajsamand', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19034, N'Ramganj Mandi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19035, N'Ramgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19036, N'Rani', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19037, N'Raniwara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19038, N'Ratan Nagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19039, N'Ratangarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19040, N'Rawatbhata', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19041, N'Rawatsar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19042, N'Rikhabdev', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19043, N'Ringas', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19044, N'Sadri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19045, N'Sadulshahar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19046, N'Sagwara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19047, N'Salumbar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19048, N'Sambhar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19049, N'Samdari', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19050, N'Sanchor', 1657)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19051, N'Sangariya', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19052, N'Sangod', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19053, N'Sardarshahr', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19054, N'Sarwar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19055, N'Satal Kheri', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19056, N'Sawai Madhopur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19057, N'Sewan Kalan', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19058, N'Shahpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19059, N'Sheoganj', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19060, N'Sikar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19061, N'Sirohi', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19062, N'Siwana', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19063, N'Sogariya', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19064, N'Sojat', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19065, N'Sojat Road', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19066, N'Sri Madhopur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19067, N'Sriganganagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19068, N'Sujangarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19069, N'Suket', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19070, N'Sumerpur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19071, N'Sunel', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19072, N'Surajgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19073, N'Suratgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19074, N'Swaroopganj', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19075, N'Takhatgarh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19076, N'Taranagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19077, N'Three STR', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19078, N'Tijara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19079, N'Toda Bhim', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19080, N'Toda Raisingh', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19081, N'Todra', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19082, N'Tonk', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19083, N'Udaipur', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19084, N'Udpura', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19085, N'Uniara', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19086, N'Vanasthali', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19087, N'Vidyavihar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19088, N'Vijainagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19089, N'Viratnagar', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19090, N'Wer', 1657)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19091, N'Gangtok', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19092, N'Gezing', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19093, N'Jorethang', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19094, N'Mangan', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19095, N'Namchi', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19096, N'Naya Bazar', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19097, N'No City', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19098, N'Rangpo', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19099, N'Sikkim', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19100, N'Singtam', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19101, N'Upper Tadong', 1658)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19102, N'Abiramam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19103, N'Achampudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19104, N'Acharapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19105, N'Acharipallam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19106, N'Achipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19107, N'Adikaratti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19108, N'Adiramapattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19109, N'Aduturai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19110, N'Adyar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19111, N'Agaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19112, N'Agasthiswaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19113, N'Akkaraipettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19114, N'Alagappapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19115, N'Alagapuri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19116, N'Alampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19117, N'Alandur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19118, N'Alanganallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19119, N'Alangayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19120, N'Alangudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19121, N'Alangulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19122, N'Alanthurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19123, N'Alapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19124, N'Allapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19125, N'Alur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19126, N'Alwar Tirunagari', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19127, N'Alwarkurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19128, N'Ambasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19129, N'Ambur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19130, N'Ammainaickanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19131, N'Ammaparikuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19132, N'Ammapettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19133, N'Ammavarikuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19134, N'Ammur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19135, N'Anaimalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19136, N'Anaiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19137, N'Anakaputhur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19138, N'Ananthapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19139, N'Andanappettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19140, N'Andipalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19141, N'Andippatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19142, N'Anjugramam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19143, N'Annamalainagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19144, N'Annavasal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19145, N'Annur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19146, N'Anthiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19147, N'Appakudal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19148, N'Arachalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19149, N'Arakandanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19150, N'Arakonam', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19151, N'Aralvaimozhi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19152, N'Arani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19153, N'Arani Road', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19154, N'Arantangi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19155, N'Arasiramani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19156, N'Aravakurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19157, N'Aravankadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19158, N'Arcot', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19159, N'Arimalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19160, N'Ariyalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19161, N'Ariyappampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19162, N'Ariyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19163, N'Arni', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19164, N'Arulmigu Thirumuruganpundi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19165, N'Arumanai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19166, N'Arumbavur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19167, N'Arumuganeri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19168, N'Aruppukkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19169, N'Ashokapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19170, N'Athani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19171, N'Athanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19172, N'Athimarapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19173, N'Athipattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19174, N'Athur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19175, N'Attayyampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19176, N'Attur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19177, N'Auroville', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19178, N'Avadattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19179, N'Avadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19180, N'Avalpundurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19181, N'Avaniapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19182, N'Avinashi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19183, N'Ayakudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19184, N'Ayanadaippu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19185, N'Aygudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19186, N'Ayothiapattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19187, N'Ayyalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19188, N'Ayyampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19189, N'Ayyampettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19190, N'Azhagiapandiapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19191, N'Balakrishnampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19192, N'Balakrishnapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19193, N'Balapallam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19194, N'Balasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19195, N'Bargur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19196, N'Belur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19197, N'Berhatty', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19198, N'Bhavani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19199, N'Bhawanisagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19200, N'Bhuvanagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19201, N'Bikketti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19202, N'Bodinayakkanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19203, N'Brahmana Periya Agraharam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19204, N'Buthapandi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19205, N'Buthipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19206, N'Chatrapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19207, N'Chembarambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19208, N'Chengalpattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19209, N'Chengam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19210, N'Chennai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19211, N'Chennasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19212, N'Chennimalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19213, N'Cheranmadevi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19214, N'Cheruvanki', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19215, N'Chetpet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19216, N'Chettiarpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19217, N'Chettipalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19218, N'Chettipalayam Cantonment', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19219, N'Chettithangal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19220, N'Cheyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19221, N'Cheyyar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19222, N'Chidambaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19223, N'Chinalapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19224, N'Chinna Anuppanadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19225, N'Chinna Salem', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19226, N'Chinnakkampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19227, N'Chinnammanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19228, N'Chinnampalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19229, N'Chinnasekkadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19230, N'Chinnavedampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19231, N'Chitlapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19232, N'Chittodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19233, N'Cholapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19234, N'Coimbatore', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19235, N'Coonoor', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19236, N'Courtalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19237, N'Cuddalore', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19238, N'Dalavaipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19239, N'Darasuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19240, N'Denkanikottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19241, N'Desur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19242, N'Devadanapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19243, N'Devakkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19244, N'Devakottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19245, N'Devanangurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19246, N'Devarshola', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19247, N'Devasthanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19248, N'Dhalavoipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19249, N'Dhali', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19250, N'Dhaliyur', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19251, N'Dharapadavedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19252, N'Dharapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19253, N'Dharmapuri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19254, N'Dindigul', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19255, N'Dusi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19256, N'Edaganasalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19257, N'Edaikodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19258, N'Edakalinadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19259, N'Elathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19260, N'Elayirampannai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19261, N'Elumalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19262, N'Eral', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19263, N'Eraniel', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19264, N'Eriodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19265, N'Erode', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19266, N'Erumaipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19267, N'Eruvadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19268, N'Ethapur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19269, N'Ettaiyapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19270, N'Ettimadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19271, N'Ezhudesam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19272, N'Ganapathipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19273, N'Gandhi Nagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19274, N'Gangaikondan', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19275, N'Gangavalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19276, N'Ganguvarpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19277, N'Gingi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19278, N'Gopalasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19279, N'Gopichettipalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19280, N'Gudalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19281, N'Gudiyattam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19282, N'Guduvanchery', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19283, N'Gummidipoondi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19284, N'Hanumanthampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19285, N'Harur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19286, N'Harveypatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19287, N'Highways', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19288, N'Hosur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19289, N'Hubbathala', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19290, N'Huligal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19291, N'Idappadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19292, N'Idikarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19293, N'Ilampillai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19294, N'Ilanji', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19295, N'Iluppaiyurani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19296, N'Iluppur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19297, N'Inam Karur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19298, N'Injambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19299, N'Irugur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19300, N'Jaffrabad', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19301, N'Jagathala', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19302, N'Jalakandapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19303, N'Jalladiampet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19304, N'Jambai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19305, N'Jayankondam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19306, N'Jolarpet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19307, N'Kadambur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19308, N'Kadathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19309, N'Kadayal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19310, N'Kadayampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19311, N'Kadayanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19312, N'Kadiapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19313, N'Kalakkad', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19314, N'Kalambur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19315, N'Kalapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19316, N'Kalappanaickenpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19317, N'Kalavai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19318, N'Kalinjur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19319, N'Kaliyakkavilai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19320, N'Kallakkurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19321, N'Kallakudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19322, N'Kallidaikurichchi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19323, N'Kallukuttam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19324, N'Kallupatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19325, N'Kalpakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19326, N'Kalugumalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19327, N'Kamayagoundanpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19328, N'Kambainallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19329, N'Kambam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19330, N'Kamuthi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19331, N'Kanadukathan', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19332, N'Kanakkampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19333, N'Kanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19334, N'Kanchipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19335, N'Kandanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19336, N'Kangayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19337, N'Kangayampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19338, N'Kangeyanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19339, N'Kaniyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19340, N'Kanjikoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19341, N'Kannadendal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19342, N'Kannamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19343, N'Kannampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19344, N'Kannankurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19345, N'Kannapalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19346, N'Kannivadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19347, N'Kanyakumari', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19348, N'Kappiyarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19349, N'Karaikkudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19350, N'Karamadai', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19351, N'Karambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19352, N'Karambakkudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19353, N'Kariamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19354, N'Kariapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19355, N'Karugampattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19356, N'Karumandi Chellipalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19357, N'Karumathampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19358, N'Karumbakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19359, N'Karungal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19360, N'Karunguzhi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19361, N'Karuppur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19362, N'Karur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19363, N'Kasipalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19364, N'Kasipalayam G', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19365, N'Kathirvedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19366, N'Kathujuganapalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19367, N'Katpadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19368, N'Kattivakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19369, N'Kattumannarkoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19370, N'Kattupakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19371, N'Kattuputhur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19372, N'Kaveripakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19373, N'Kaveripattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19374, N'Kavundampalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19375, N'Kavundampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19376, N'Kayalpattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19377, N'Kayattar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19378, N'Kelamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19379, N'Kelambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19380, N'Kembainaickenpalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19381, N'Kethi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19382, N'Kilakarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19383, N'Kilampadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19384, N'Kilkulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19385, N'Kilkunda', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19386, N'Killiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19387, N'Killlai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19388, N'Kilpennathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19389, N'Kilvelur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19390, N'Kinathukadavu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19391, N'Kiramangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19392, N'Kiranur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19393, N'Kiripatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19394, N'Kizhapavur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19395, N'Kmarasamipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19396, N'Kochadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19397, N'Kodaikanal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19398, N'Kodambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19399, N'Kodavasal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19400, N'Kodumudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19401, N'Kolachal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19402, N'Kolappalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19403, N'Kolathupalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19404, N'Kolathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19405, N'Kollankodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19406, N'Kollankoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19407, N'Komaralingam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19408, N'Komarapalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19409, N'Kombai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19410, N'Konakkarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19411, N'Konavattam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19412, N'Kondalampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19413, N'Konganapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19414, N'Koradacheri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19415, N'Korampallam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19416, N'Kotagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19417, N'Kothinallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19418, N'Kottaiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19419, N'Kottakuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19420, N'Kottaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19421, N'Kottivakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19422, N'Kottur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19423, N'Kovilpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19424, N'Koyampattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19425, N'Krishnagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19426, N'Krishnarayapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19427, N'Krishnasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19428, N'Kuchanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19429, N'Kuhalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19430, N'Kulasekarappattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19431, N'Kulasekarapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19432, N'Kulithalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19433, N'Kumarapalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19434, N'Kumarapalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19435, N'Kumarapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19436, N'Kumbakonam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19437, N'Kundrathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19438, N'Kuniyamuthur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19439, N'Kunnathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19440, N'Kunur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19441, N'Kuraikundu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19442, N'Kurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19443, N'Kurinjippadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19444, N'Kurudampalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19445, N'Kurumbalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19446, N'Kuthalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19447, N'Kuthappar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19448, N'Kuttalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19449, N'Kuttanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19450, N'Kuzhithurai', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19451, N'Labbaikudikadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19452, N'Lakkampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19453, N'Lalgudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19454, N'Lalpet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19455, N'Llayangudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19456, N'Madambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19457, N'Madanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19458, N'Madathukulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19459, N'Madhavaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19460, N'Madippakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19461, N'Madukkarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19462, N'Madukkur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19463, N'Madurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19464, N'Maduranthakam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19465, N'Maduravoyal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19466, N'Mahabalipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19467, N'Makkinanpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19468, N'Mallamuppampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19469, N'Mallankinaru', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19470, N'Mallapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19471, N'Mallasamudram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19472, N'Mallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19473, N'Mamallapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19474, N'Mamsapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19475, N'Manachanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19476, N'Manali', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19477, N'Manalmedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19478, N'Manalurpet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19479, N'Manamadurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19480, N'Manapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19481, N'Manapparai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19482, N'Manavalakurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19483, N'Mandaikadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19484, N'Mandapam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19485, N'Mangadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19486, N'Mangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19487, N'Mangalampet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19488, N'Manimutharu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19489, N'Mannargudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19490, N'Mappilaiurani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19491, N'Maraimalai Nagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19492, N'Marakkanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19493, N'Maramangalathupatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19494, N'Marandahalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19495, N'Markayankottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19496, N'Marudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19497, N'Marungur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19498, N'Masinigudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19499, N'Mathigiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19500, N'Mattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19501, N'Mayiladuthurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19502, N'Mecheri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19503, N'Melacheval', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19504, N'Melachokkanathapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19505, N'Melagaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19506, N'Melamadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19507, N'Melamaiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19508, N'Melanattam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19509, N'Melathiruppanthuruthi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19510, N'Melattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19511, N'Melmananbedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19512, N'Melpattampakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19513, N'Melur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19514, N'Melvisharam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19515, N'Mettupalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19516, N'Mettur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19517, N'Meyyanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19518, N'Milavittan', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19519, N'Minakshipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19520, N'Minambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19521, N'Minjur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19522, N'Modakurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19523, N'Mohanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19524, N'Mopperipalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19525, N'Mudalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19526, N'Mudichur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19527, N'Mudukulathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19528, N'Mukasipidariyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19529, N'Mukkudal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19530, N'Mulagumudu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19531, N'Mulakaraipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19532, N'Mulanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19533, N'Mullakkadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19534, N'Muruganpalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19535, N'Musiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19536, N'Muthupet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19537, N'Muthur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19538, N'Muttayyapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19539, N'Muttupet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19540, N'Muvarasampettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19541, N'Myladi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19542, N'Mylapore', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19543, N'Nadukkuthagai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19544, N'Naduvattam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19545, N'Nagapattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19546, N'Nagavakulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19547, N'Nagercoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19548, N'Nagojanahalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19549, N'Nallampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19550, N'Nallur', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19551, N'Namagiripettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19552, N'Namakkal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19553, N'Nambiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19554, N'Nambutalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19555, N'Nandambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19556, N'Nandivaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19557, N'Nangavalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19558, N'Nangavaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19559, N'Nanguneri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19560, N'Nanjikottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19561, N'Nannilam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19562, N'Naranammalpuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19563, N'Naranapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19564, N'Narasimhanaickenpalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19565, N'Narasingapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19566, N'Narasojipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19567, N'Naravarikuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19568, N'Nasiyanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19569, N'Natham', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19570, N'Nathampannai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19571, N'Natrampalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19572, N'Nattam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19573, N'Nattapettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19574, N'Nattarasankottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19575, N'Navalpattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19576, N'Nazarethpettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19577, N'Nazerath', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19578, N'Neikkarapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19579, N'Neiyyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19580, N'Nellikkuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19581, N'Nelliyalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19582, N'Nemili', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19583, N'Nemilicheri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19584, N'Neripperichal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19585, N'Nerkunram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19586, N'Nerkuppai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19587, N'Nerunjipettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19588, N'Neykkarappatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19589, N'Neyveli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19590, N'Nidamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19591, N'Nilagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19592, N'Nilakkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19593, N'Nilankarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19594, N'Odaipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19595, N'Odaiyakulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19596, N'Oddanchatram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19597, N'Odugathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19598, N'Oggiyamduraipakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19599, N'Olagadam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19600, N'Omalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19601, N'Ooty', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19602, N'Orathanadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19603, N'Othakadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19604, N'Othakalmandapam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19605, N'Ottapparai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19606, N'Pacode', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19607, N'Padaividu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19608, N'Padianallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19609, N'Padirikuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19610, N'Padmanabhapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19611, N'Padririvedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19612, N'Palaganangudy', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19613, N'Palaimpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19614, N'Palakkodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19615, N'Palamedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19616, N'Palani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19617, N'Palani Chettipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19618, N'Palavakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19619, N'Palavansathu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19620, N'Palayakayal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19621, N'Palayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19622, N'Palayamkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19623, N'Palladam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19624, N'Pallapalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19625, N'Pallapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19626, N'Pallattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19627, N'Pallavaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19628, N'Pallikaranai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19629, N'Pallikonda', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19630, N'Pallipalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19631, N'Pallipalaiyam Agraharam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19632, N'Pallipattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19633, N'Pammal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19634, N'Panagudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19635, N'Panaimarathupatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19636, N'Panapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19637, N'Panboli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19638, N'Pandamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19639, N'Pannaikadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19640, N'Pannaipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19641, N'Pannuratti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19642, N'Panruti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19643, N'Papanasam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19644, N'Pappankurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19645, N'Papparapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19646, N'Pappireddipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19647, N'Paramakkudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19648, N'Paramankurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19649, N'Paramathi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19650, N'Parangippettai', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19651, N'Paravai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19652, N'Pasur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19653, N'Pathamadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19654, N'Pattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19655, N'Pattiviranpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19656, N'Pattukkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19657, N'Pazhugal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19658, N'Pennadam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19659, N'Pennagaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19660, N'Pennathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19661, N'Peraiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19662, N'Peralam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19663, N'Perambalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19664, N'Peranamallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19665, N'Peravurani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19666, N'Periyakodiveri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19667, N'Periyakulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19668, N'Periyanayakkanpalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19669, N'Periyanegamam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19670, N'Periyapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19671, N'Periyasemur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19672, N'Pernambut', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19673, N'Perumagalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19674, N'Perumandi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19675, N'Perumuchi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19676, N'Perundurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19677, N'Perungalathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19678, N'Perungudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19679, N'Perungulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19680, N'Perur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19681, N'Perur Chettipalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19682, N'Pethampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19683, N'Pethanaickenpalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19684, N'Pillanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19685, N'Pirkankaranai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19686, N'Polichalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19687, N'Pollachi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19688, N'Polur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19689, N'Ponmani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19690, N'Ponnamaravathi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19691, N'Ponnampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19692, N'Ponneri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19693, N'Porur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19694, N'Pothanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19695, N'Pothatturpettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19696, N'Pudukadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19697, N'Pudukkottai Cantonment', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19698, N'Pudukottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19699, N'Pudupalaiyam Aghraharam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19700, N'Pudupalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19701, N'Pudupatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19702, N'Pudupattinam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19703, N'Pudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19704, N'Puduvayal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19705, N'Pulambadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19706, N'Pulampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19707, N'Puliyampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19708, N'Puliyankudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19709, N'Puliyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19710, N'Pullampadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19711, N'Puluvapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19712, N'Punamalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19713, N'Punjai Puliyampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19714, N'Punjai Thottakurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19715, N'Punjaipugalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19716, N'Puthalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19717, N'Putteri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19718, N'Puvalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19719, N'Puzhal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19720, N'Puzhithivakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19721, N'Rajapalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19722, N'Ramanathapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19723, N'Ramapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19724, N'Rameswaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19725, N'Ranipet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19726, N'Rasipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19727, N'Rayagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19728, N'Rithapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19729, N'Rosalpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19730, N'Rudravathi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19731, N'Sadayankuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19732, N'Saint Thomas Mount', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19733, N'Salangapalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19734, N'Salem', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19735, N'Samalapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19736, N'Samathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19737, N'Sambavar Vadagarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19738, N'Sankaramanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19739, N'Sankarankoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19740, N'Sankarapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19741, N'Sankari', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19742, N'Sankarnagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19743, N'Saravanampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19744, N'Sarcarsamakulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19745, N'Sathiyavijayanagaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19746, N'Sathuvachari', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19747, N'Sathyamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19748, N'Sattankulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19749, N'Sattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19750, N'Sayalgudi', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19751, N'Sayapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19752, N'Seithur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19753, N'Sembakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19754, N'Semmipalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19755, N'Sennirkuppam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19756, N'Senthamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19757, N'Sentharapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19758, N'Senur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19759, N'Sethiathoppu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19760, N'Sevilimedu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19761, N'Sevugampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19762, N'Shenbakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19763, N'Shencottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19764, N'Shenkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19765, N'Sholavandan', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19766, N'Sholinganallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19767, N'Sholingur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19768, N'Sholur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19769, N'Sikkarayapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19770, N'Singampuneri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19771, N'Singanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19772, N'Singaperumalkoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19773, N'Sirapalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19774, N'Sirkali', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19775, N'Sirugamani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19776, N'Sirumugai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19777, N'Sithayankottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19778, N'Sithurajapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19779, N'Sivaganga', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19780, N'Sivagiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19781, N'Sivakasi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19782, N'Sivanthipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19783, N'Sivur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19784, N'Soranjeri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19785, N'South Kannanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19786, N'South Kodikulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19787, N'Srimushnam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19788, N'Sriperumpudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19789, N'Sriramapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19790, N'Srirangam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19791, N'Srivaikuntam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19792, N'Srivilliputtur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19793, N'Suchindram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19794, N'Suliswaranpatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19795, N'Sulur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19796, N'Sundarapandiam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19797, N'Sundarapandiapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19798, N'Surampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19799, N'Surandai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19800, N'Suriyampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19801, N'Swamimalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19802, N'TNPL Pugalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19803, N'Tambaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19804, N'Taramangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19805, N'Tattayyangarpettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19806, N'Tayilupatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19807, N'Tenkasi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19808, N'Thadikombu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19809, N'Thakkolam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19810, N'Thalainayar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19811, N'Thalakudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19812, N'Thamaraikulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19813, N'Thammampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19814, N'Thanjavur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19815, N'Thanthoni', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19816, N'Tharangambadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19817, N'Thedavur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19818, N'Thenambakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19819, N'Thengampudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19820, N'Theni', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19821, N'Theni Allinagaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19822, N'Thenkarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19823, N'Thenthamaraikulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19824, N'Thenthiruperai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19825, N'Thesur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19826, N'Thevaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19827, N'Thevur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19828, N'Thiagadurgam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19829, N'Thiagarajar Colony', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19830, N'Thingalnagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19831, N'Thiruchirapalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19832, N'Thirukarungudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19833, N'Thirukazhukundram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19834, N'Thirumalayampalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19835, N'Thirumazhisai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19836, N'Thirunagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19837, N'Thirunageswaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19838, N'Thirunindravur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19839, N'Thirunirmalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19840, N'Thiruparankundram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19841, N'Thiruparappu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19842, N'Thiruporur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19843, N'Thiruppanandal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19844, N'Thirupuvanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19845, N'Thiruthangal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19846, N'Thiruthuraipundi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19847, N'Thiruvaivaru', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19848, N'Thiruvalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19849, N'Thiruvarur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19850, N'Thiruvattaru', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19851, N'Thiruvenkatam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19852, N'Thiruvennainallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19853, N'Thiruvithankodu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19854, N'Thisayanvilai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19855, N'Thittacheri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19856, N'Thondamuthur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19857, N'Thorapadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19858, N'Thottipalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19859, N'Thottiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19860, N'Thudiyalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19861, N'Thuthipattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19862, N'Thuvakudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19863, N'Timiri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19864, N'Tindivanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19865, N'Tinnanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19866, N'Tiruchchendur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19867, N'Tiruchengode', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19868, N'Tirukkalukkundram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19869, N'Tirukkattuppalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19870, N'Tirukkoyilur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19871, N'Tirumangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19872, N'Tirumullaivasal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19873, N'Tirumuruganpundi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19874, N'Tirunageswaram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19875, N'Tirunelveli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19876, N'Tirupathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19877, N'Tirupattur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19878, N'Tiruppuvanam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19879, N'Tirupur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19880, N'Tirusulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19881, N'Tiruttani', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19882, N'Tiruvallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19883, N'Tiruvannamalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19884, N'Tiruverambur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19885, N'Tiruverkadu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19886, N'Tiruvethipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19887, N'Tiruvidaimarudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19888, N'Tiruvottiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19889, N'Tittakudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19890, N'Tondi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19891, N'Turaiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19892, N'Tuticorin', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19893, N'Udagamandalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19894, N'Udagamandalam Valley', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19895, N'Udankudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19896, N'Udayarpalayam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19897, N'Udumalaipettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19898, N'Udumalpet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19899, N'Ullur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19900, N'Ulundurpettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19901, N'Unjalaur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19902, N'Unnamalaikadai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19903, N'Uppidamangalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19904, N'Uppiliapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19905, N'Urachikkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19906, N'Urapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19907, N'Usilampatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19908, N'Uthangarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19909, N'Uthayendram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19910, N'Uthiramerur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19911, N'Uthukkottai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19912, N'Uttamapalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19913, N'Uttukkuli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19914, N'Vadakarai Kizhpadugai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19915, N'Vadakkanandal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19916, N'Vadakku Valliyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19917, N'Vadalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19918, N'Vadamadurai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19919, N'Vadavalli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19920, N'Vadipatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19921, N'Vadugapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19922, N'Vaithiswarankoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19923, N'Valangaiman', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19924, N'Valasaravakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19925, N'Valavanur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19926, N'Vallam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19927, N'Valparai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19928, N'Valvaithankoshtam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19929, N'Vanavasi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19930, N'Vandalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19931, N'Vandavasi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19932, N'Vandiyur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19933, N'Vaniputhur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19934, N'Vaniyambadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19935, N'Varadarajanpettai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19936, N'Varadharajapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19937, N'Vasudevanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19938, N'Vathirairuppu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19939, N'Vattalkundu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19940, N'Vazhapadi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19941, N'Vedapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19942, N'Vedaranniyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19943, N'Vedasandur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19944, N'Velampalaiyam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19945, N'Velankanni', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19946, N'Vellakinar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19947, N'Vellakoil', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19948, N'Vellalapatti', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19949, N'Vellalur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19950, N'Vellanur', 1659)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19951, N'Vellimalai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19952, N'Vellore', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19953, N'Vellottamparappu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19954, N'Velluru', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19955, N'Vengampudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19956, N'Vengathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19957, N'Vengavasal', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19958, N'Venghatur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19959, N'Venkarai', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19960, N'Vennanthur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19961, N'Veppathur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19962, N'Verkilambi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19963, N'Vettaikaranpudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19964, N'Vettavalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19965, N'Vijayapuri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19966, N'Vikramasingapuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19967, N'Vikravandi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19968, N'Vilangudi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19969, N'Vilankurichi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19970, N'Vilapakkam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19971, N'Vilathikulam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19972, N'Vilavur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19973, N'Villukuri', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19974, N'Villupuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19975, N'Viraganur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19976, N'Virakeralam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19977, N'Virakkalpudur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19978, N'Virapandi', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19979, N'Virapandi Cantonment', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19980, N'Virappanchatram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19981, N'Viravanallur', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19982, N'Virudambattu', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19983, N'Virudhachalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19984, N'Virudhunagar', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19985, N'Virupakshipuram', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19986, N'Viswanatham', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19987, N'Vriddhachalam', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19988, N'Walajabad', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19989, N'Walajapet', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19990, N'Wellington', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19991, N'Yercaud', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19992, N'Zamin Uthukuli', 1659)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19993, N'Achampet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19994, N'Adilabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19995, N'Armoor', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19996, N'Asifabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19997, N'Badepally', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19998, N'Banswada', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (19999, N'Bellampalli', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20000, N'Bhadrachalam', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20001, N'Bhainsa', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20002, N'Bhongir', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20003, N'Bhupalpally', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20004, N'Bodhan', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20005, N'Bollaram', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20006, N'Devarkonda', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20007, N'Farooqnagar', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20008, N'Gadwal', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20009, N'Gajwel', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20010, N'Ghatkesar', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20011, N'Hyderabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20012, N'Jagtial', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20013, N'Jangaon', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20014, N'Kagaznagar', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20015, N'Kalwakurthy', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20016, N'Kamareddy', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20017, N'Karimnagar', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20018, N'Khammam', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20019, N'Kodada', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20020, N'Koratla', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20021, N'Kottagudem', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20022, N'Kyathampalle', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20023, N'Madhira', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20024, N'Mahabubabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20025, N'Mahbubnagar', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20026, N'Mancherial', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20027, N'Mandamarri', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20028, N'Manuguru', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20029, N'Medak', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20030, N'Medchal', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20031, N'Miryalaguda', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20032, N'Nagar Karnul', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20033, N'Nakrekal', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20034, N'Nalgonda', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20035, N'Narayanpet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20036, N'Narsampet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20037, N'Nirmal', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20038, N'Nizamabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20039, N'Palwancha', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20040, N'Peddapalli', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20041, N'Ramagundam', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20042, N'Ranga Reddy district', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20043, N'Sadasivpet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20044, N'Sangareddy', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20045, N'Sarapaka', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20046, N'Sathupalle', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20047, N'Secunderabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20048, N'Siddipet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20049, N'Singapur', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20050, N'Sircilla', 1660)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20051, N'Suryapet', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20052, N'Tandur', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20053, N'Vemulawada', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20054, N'Vikarabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20055, N'Wanaparthy', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20056, N'Warangal', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20057, N'Yellandu', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20058, N'Zahirabad', 1660)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20059, N'Agartala', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20060, N'Amarpur', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20061, N'Ambassa', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20062, N'Badharghat', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20063, N'Belonia', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20064, N'Dharmanagar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20065, N'Gakulnagar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20066, N'Gandhigram', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20067, N'Indranagar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20068, N'Jogendranagar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20069, N'Kailasahar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20070, N'Kamalpur', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20071, N'Kanchanpur', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20072, N'Khowai', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20073, N'Kumarghat', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20074, N'Kunjaban', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20075, N'Narsingarh', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20076, N'Pratapgarh', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20077, N'Ranir Bazar', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20078, N'Sabrum', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20079, N'Sonamura', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20080, N'Teliamura', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20081, N'Udaipur', 1661)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20082, N'Achhalda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20083, N'Achhnera', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20084, N'Adari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20085, N'Afzalgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20086, N'Agarwal Mandi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20087, N'Agra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20088, N'Agra Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20089, N'Ahraura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20090, N'Ailum', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20091, N'Air Force Area', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20092, N'Ajhuwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20093, N'Akbarpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20094, N'Alapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20095, N'Aliganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20096, N'Aligarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20097, N'Allahabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20098, N'Allahabad Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20099, N'Allahganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20100, N'Amanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20101, N'Ambahta', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20102, N'Amethi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20103, N'Amila', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20104, N'Amilo', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20105, N'Aminagar Sarai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20106, N'Aminagar Urf Bhurbaral', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20107, N'Amraudha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20108, N'Amroha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20109, N'Anandnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20110, N'Anpara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20111, N'Antu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20112, N'Anupshahr', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20113, N'Aonla', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20114, N'Armapur Estate', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20115, N'Ashokpuram', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20116, N'Ashrafpur Kichhauchha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20117, N'Atarra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20118, N'Atasu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20119, N'Atrauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20120, N'Atraulia', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20121, N'Auraiya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20122, N'Aurangabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20123, N'Aurangabad Bangar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20124, N'Auras', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20125, N'Awagarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20126, N'Ayodhya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20127, N'Azamgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20128, N'Azizpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20129, N'Azmatgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20130, N'Babarpur Ajitmal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20131, N'Baberu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20132, N'Babina', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20133, N'Babrala', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20134, N'Babugarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20135, N'Bachhiowan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20136, N'Bachhraon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20137, N'Bad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20138, N'Badaun', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20139, N'Baghpat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20140, N'Bah', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20141, N'Bahadurganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20142, N'Baheri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20143, N'Bahjoi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20144, N'Bahraich', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20145, N'Bahsuma', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20146, N'Bahua', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20147, N'Bajna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20148, N'Bakewar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20149, N'Bakiabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20150, N'Baldeo', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20151, N'Ballia', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20152, N'Balrampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20153, N'Banat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20154, N'Banda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20155, N'Bangarmau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20156, N'Banki', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20157, N'Bansdih', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20158, N'Bansgaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20159, N'Bansi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20160, N'Barabanki', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20161, N'Baragaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20162, N'Baraut', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20163, N'Bareilly', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20164, N'Bareilly Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20165, N'Barhalganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20166, N'Barhani', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20167, N'Barhapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20168, N'Barkhera', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20169, N'Barsana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20170, N'Barva Sagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20171, N'Barwar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20172, N'Basti', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20173, N'Begumabad Budhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20174, N'Behat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20175, N'Behta Hajipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20176, N'Bela', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20177, N'Belthara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20178, N'Beniganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20179, N'Beswan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20180, N'Bewar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20181, N'Bhadarsa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20182, N'Bhadohi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20183, N'Bhagwantnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20184, N'Bharatganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20185, N'Bhargain', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20186, N'Bharthana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20187, N'Bharuhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20188, N'Bharwari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20189, N'Bhatni Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20190, N'Bhatpar Rani', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20191, N'Bhawan Bahadurnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20192, N'Bhinga', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20193, N'Bhojpur Dharampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20194, N'Bhokarhedi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20195, N'Bhongaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20196, N'Bhulepur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20197, N'Bidhuna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20198, N'Bighapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20199, N'Bijnor', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20200, N'Bijpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20201, N'Bikapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20202, N'Bilari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20203, N'Bilaspur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20204, N'Bilgram', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20205, N'Bilhaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20206, N'Bilram', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20207, N'Bilrayaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20208, N'Bilsanda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20209, N'Bilsi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20210, N'Bindki', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20211, N'Bisalpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20212, N'Bisanda Buzurg', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20213, N'Bisauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20214, N'Bisharatganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20215, N'Bisokhar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20216, N'Biswan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20217, N'Bithur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20218, N'Budaun', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20219, N'Bugrasi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20220, N'Bulandshahar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20221, N'Burhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20222, N'Chail', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20223, N'Chak Imam Ali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20224, N'Chakeri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20225, N'Chakia', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20226, N'Chandauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20227, N'Chandausi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20228, N'Chandpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20229, N'Charkhari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20230, N'Charthawal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20231, N'Chaumuhan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20232, N'Chhaprauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20233, N'Chhara Rafatpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20234, N'Chharprauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20235, N'Chhata', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20236, N'Chhatari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20237, N'Chhibramau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20238, N'Chhutmalpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20239, N'Chilkana Sultanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20240, N'Chirgaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20241, N'Chit Baragaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20242, N'Chitrakut Dham', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20243, N'Chopan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20244, N'Choubepur Kalan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20245, N'Chunar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20246, N'Churk Ghurma', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20247, N'Colonelganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20248, N'Dadri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20249, N'Dalmau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20250, N'Dankaur', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20251, N'Dariyabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20252, N'Dasna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20253, N'Dataganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20254, N'Daurala', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20255, N'Dayal Bagh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20256, N'Deoband', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20257, N'Deoranian', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20258, N'Deoria', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20259, N'Dewa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20260, N'Dhampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20261, N'Dhanauha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20262, N'Dhanauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20263, N'Dhanaura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20264, N'Dharoti Khurd', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20265, N'Dhauratanda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20266, N'Dhaurhra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20267, N'Dibai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20268, N'Dibiyapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20269, N'Dildarnagar Fatehpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20270, N'Do Ghat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20271, N'Dohrighat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20272, N'Dostpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20273, N'Dudhinagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20274, N'Dulhipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20275, N'Dundwaraganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20276, N'Ekdil', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20277, N'Erich', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20278, N'Etah', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20279, N'Etawah', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20280, N'Faizabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20281, N'Faizabad Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20282, N'Faizganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20283, N'Farah', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20284, N'Faridnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20285, N'Faridpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20286, N'Faridpur Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20287, N'Fariha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20288, N'Farrukhabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20289, N'Fatehabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20290, N'Fatehganj Pashchimi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20291, N'Fatehganj Purvi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20292, N'Fatehgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20293, N'Fatehpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20294, N'Fatehpur Chaurasi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20295, N'Fatehpur Sikri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20296, N'Firozabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20297, N'Gajraula', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20298, N'Ganga Ghat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20299, N'Gangapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20300, N'Gangoh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20301, N'Ganj Muradabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20302, N'Garautha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20303, N'Garhi Pukhta', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20304, N'Garhmukteshwar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20305, N'Gaura Barahaj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20306, N'Gauri Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20307, N'Gausganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20308, N'Gawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20309, N'Ghatampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20310, N'Ghaziabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20311, N'Ghazipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20312, N'Ghiror', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20313, N'Ghorawal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20314, N'Ghosi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20315, N'Ghosia Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20316, N'Ghughuli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20317, N'Gohand', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20318, N'Gokul', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20319, N'Gola Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20320, N'Gola Gokarannath', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20321, N'Gonda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20322, N'Gopamau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20323, N'Gopiganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20324, N'Gorakhpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20325, N'Gosainganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20326, N'Govardhan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20327, N'Greater Noida', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20328, N'Gulaothi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20329, N'Gulariya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20330, N'Gulariya Bhindara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20331, N'Gunnaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20332, N'Gursahaiganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20333, N'Gursarai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20334, N'Gyanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20335, N'Hafizpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20336, N'Haidergarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20337, N'Haldaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20338, N'Hamirpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20339, N'Handia', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20340, N'Hapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20341, N'Hardoi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20342, N'Harduaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20343, N'Hargaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20344, N'Hariharpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20345, N'Harraiya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20346, N'Hasanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20347, N'Hasayan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20348, N'Hastinapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20349, N'Hata', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20350, N'Hathras', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20351, N'Hyderabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20352, N'Ibrahimpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20353, N'Iglas', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20354, N'Ikauna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20355, N'Iltifatganj Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20356, N'Indian Telephone Industry Mank', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20357, N'Islamnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20358, N'Itaunja', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20359, N'Itimadpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20360, N'Jagner', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20361, N'Jahanabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20362, N'Jahangirabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20363, N'Jahangirpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20364, N'Jais', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20365, N'Jaithara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20366, N'Jalalabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20367, N'Jalali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20368, N'Jalalpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20369, N'Jalaun', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20370, N'Jalesar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20371, N'Jamshila', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20372, N'Jangipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20373, N'Jansath', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20374, N'Jarwal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20375, N'Jasrana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20376, N'Jaswantnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20377, N'Jatari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20378, N'Jaunpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20379, N'Jewar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20380, N'Jhalu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20381, N'Jhansi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20382, N'Jhansi Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20383, N'Jhansi Railway Settlement', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20384, N'Jhinjhak', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20385, N'Jhinjhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20386, N'Jhusi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20387, N'Jhusi Kohna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20388, N'Jiyanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20389, N'Joya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20390, N'Jyoti Khuria', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20391, N'Jyotiba Phule Nagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20392, N'Kabrai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20393, N'Kachhauna Patseni', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20394, N'Kachhla', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20395, N'Kachhwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20396, N'Kadaura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20397, N'Kadipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20398, N'Kailashpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20399, N'Kaimganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20400, N'Kairana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20401, N'Kakgaina', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20402, N'Kakod', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20403, N'Kakori', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20404, N'Kakrala', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20405, N'Kalinagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20406, N'Kalpi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20407, N'Kamalganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20408, N'Kampil', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20409, N'Kandhla', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20410, N'Kandwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20411, N'Kannauj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20412, N'Kanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20413, N'Kant', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20414, N'Kanth', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20415, N'Kaptanganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20416, N'Karaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20417, N'Karari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20418, N'Karhal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20419, N'Karnawal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20420, N'Kasganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20421, N'Katariya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20422, N'Katghar Lalganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20423, N'Kathera', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20424, N'Katra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20425, N'Katra Medniganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20426, N'Kauriaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20427, N'Kemri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20428, N'Kerakat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20429, N'Khadda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20430, N'Khaga', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20431, N'Khailar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20432, N'Khair', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20433, N'Khairabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20434, N'Khairagarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20435, N'Khalilabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20436, N'Khamaria', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20437, N'Khanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20438, N'Kharela', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20439, N'Khargupur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20440, N'Khariya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20441, N'Kharkhoda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20442, N'Khatauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20443, N'Khatauli Rural', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20444, N'Khekra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20445, N'Kheri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20446, N'Kheta Sarai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20447, N'Khudaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20448, N'Khurja', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20449, N'Khutar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20450, N'Kiraoli', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20451, N'Kiratpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20452, N'Kishanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20453, N'Kishni', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20454, N'Kithaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20455, N'Koiripur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20456, N'Konch', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20457, N'Kopaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20458, N'Kora Jahanabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20459, N'Korwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20460, N'Kosi Kalan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20461, N'Kota', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20462, N'Kotra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20463, N'Kotwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20464, N'Kulpahar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20465, N'Kunda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20466, N'Kundarki', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20467, N'Kunwargaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20468, N'Kurara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20469, N'Kurawali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20470, N'Kursath', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20471, N'Kurthi Jafarpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20472, N'Kushinagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20473, N'Kusmara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20474, N'Laharpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20475, N'Lakhimpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20476, N'Lakhna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20477, N'Lalganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20478, N'Lalitpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20479, N'Lar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20480, N'Lawar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20481, N'Ledwa Mahuwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20482, N'Lohta', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20483, N'Loni', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20484, N'Lucknow', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20485, N'Machhlishahr', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20486, N'Madhoganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20487, N'Madhogarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20488, N'Maghar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20489, N'Mahaban', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20490, N'Maharajganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20491, N'Mahmudabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20492, N'Mahoba', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20493, N'Maholi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20494, N'Mahona', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20495, N'Mahroni', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20496, N'Mailani', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20497, N'Mainpuri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20498, N'Majhara Pipar Ehatmali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20499, N'Majhauli Raj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20500, N'Malihabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20501, N'Mallanwam', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20502, N'Mandawar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20503, N'Manikpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20504, N'Maniyar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20505, N'Manjhanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20506, N'Mankapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20507, N'Marehra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20508, N'Mariahu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20509, N'Maruadih', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20510, N'Maswasi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20511, N'Mataundh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20512, N'Mathu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20513, N'Mathura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20514, N'Mathura Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20515, N'Mau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20516, N'Mau Aima', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20517, N'Maudaha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20518, N'Mauranipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20519, N'Maurawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20520, N'Mawana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20521, N'Meerut', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20522, N'Mehnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20523, N'Mehndawal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20524, N'Mendu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20525, N'Milak', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20526, N'Miranpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20527, N'Mirat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20528, N'Mirat Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20529, N'Mirganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20530, N'Mirzapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20531, N'Misrikh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20532, N'Modinagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20533, N'Mogra Badshahpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20534, N'Mohan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20535, N'Mohanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20536, N'Mohiuddinpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20537, N'Moradabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20538, N'Moth', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20539, N'Mubarakpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20540, N'Mughal Sarai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20541, N'Mughal Sarai Railway Settlemen', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20542, N'Muhammadabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20543, N'Muhammadi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20544, N'Mukrampur Khema', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20545, N'Mundia', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20546, N'Mundora', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20547, N'Muradnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20548, N'Mursan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20549, N'Musafirkhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20550, N'Muzaffarnagar', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20551, N'Nadigaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20552, N'Nagina', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20553, N'Nagram', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20554, N'Nai Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20555, N'Nainana Jat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20556, N'Najibabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20557, N'Nakur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20558, N'Nanaunta', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20559, N'Nandgaon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20560, N'Nanpara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20561, N'Naraini', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20562, N'Narauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20563, N'Naraura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20564, N'Naugawan Sadat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20565, N'Nautanwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20566, N'Nawabganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20567, N'Nichlaul', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20568, N'Nidhauli Kalan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20569, N'Nihtaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20570, N'Nindaura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20571, N'Niwari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20572, N'Nizamabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20573, N'Noida', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20574, N'Northern Railway Colony', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20575, N'Nurpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20576, N'Nyoria Husenpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20577, N'Nyotini', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20578, N'Obra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20579, N'Oel Dhakwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20580, N'Orai', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20581, N'Oran', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20582, N'Ordinance Factory Muradnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20583, N'Pachperwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20584, N'Padrauna', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20585, N'Pahasu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20586, N'Paintepur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20587, N'Pali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20588, N'Palia Kalan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20589, N'Parasi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20590, N'Parichha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20591, N'Parichhatgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20592, N'Parsadepur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20593, N'Patala', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20594, N'Patiyali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20595, N'Patti', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20596, N'Pawayan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20597, N'Phalauda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20598, N'Phaphund', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20599, N'Phulpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20600, N'Phulwaria', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20601, N'Pihani', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20602, N'Pilibhit', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20603, N'Pilkana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20604, N'Pilkhuwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20605, N'Pinahat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20606, N'Pipalsana Chaudhari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20607, N'Pipiganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20608, N'Pipraich', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20609, N'Pipri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20610, N'Pratapgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20611, N'Pukhrayan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20612, N'Puranpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20613, N'Purdil Nagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20614, N'Purqazi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20615, N'Purwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20616, N'Qasimpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20617, N'Rabupura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20618, N'Radha Kund', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20619, N'Rae Bareilly', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20620, N'Raja Ka Rampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20621, N'Rajapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20622, N'Ramkola', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20623, N'Ramnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20624, N'Rampur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20625, N'Rampur Bhawanipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20626, N'Rampur Karkhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20627, N'Rampur Maniharan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20628, N'Rampura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20629, N'Ranipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20630, N'Rashidpur Garhi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20631, N'Rasra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20632, N'Rasulabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20633, N'Rath', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20634, N'Raya', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20635, N'Renukut', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20636, N'Reoti', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20637, N'Richha', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20638, N'Risia Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20639, N'Rithora', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20640, N'Robertsganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20641, N'Roza', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20642, N'Rudarpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20643, N'Rudauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20644, N'Rudayan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20645, N'Rura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20646, N'Rustamnagar Sahaspur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20647, N'Sabatwar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20648, N'Sadabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20649, N'Sadat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20650, N'Safipur', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20651, N'Sahanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20652, N'Saharanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20653, N'Sahaspur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20654, N'Sahaswan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20655, N'Sahawar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20656, N'Sahibabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20657, N'Sahjanwa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20658, N'Sahpau', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20659, N'Saidpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20660, N'Sainthal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20661, N'Saiyadraja', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20662, N'Sakhanu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20663, N'Sakit', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20664, N'Salarpur Khadar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20665, N'Salimpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20666, N'Salon', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20667, N'Sambhal', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20668, N'Sambhawali', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20669, N'Samdhan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20670, N'Samthar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20671, N'Sandi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20672, N'Sandila', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20673, N'Sarai Mir', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20674, N'Sarai akil', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20675, N'Sarauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20676, N'Sardhana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20677, N'Sarila', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20678, N'Sarsawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20679, N'Sasni', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20680, N'Satrikh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20681, N'Saunkh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20682, N'Saurikh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20683, N'Seohara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20684, N'Sewal Khas', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20685, N'Sewarhi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20686, N'Shahabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20687, N'Shahganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20688, N'Shahi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20689, N'Shahjahanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20690, N'Shahjahanpur Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20691, N'Shahpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20692, N'Shamli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20693, N'Shamsabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20694, N'Shankargarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20695, N'Shergarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20696, N'Sherkot', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20697, N'Shikarpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20698, N'Shikohabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20699, N'Shisgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20700, N'Shivdaspur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20701, N'Shivli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20702, N'Shivrajpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20703, N'Shohratgarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20704, N'Siddhanur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20705, N'Siddharthnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20706, N'Sidhauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20707, N'Sidhpura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20708, N'Sikandarabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20709, N'Sikandarpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20710, N'Sikandra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20711, N'Sikandra Rao', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20712, N'Singahi Bhiraura', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20713, N'Sirathu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20714, N'Sirsa', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20715, N'Sirsaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20716, N'Sirsi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20717, N'Sisauli', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20718, N'Siswa Bazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20719, N'Sitapur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20720, N'Siyana', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20721, N'Som', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20722, N'Sonbhadra', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20723, N'Soron', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20724, N'Suar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20725, N'Sukhmalpur Nizamabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20726, N'Sultanpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20727, N'Sumerpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20728, N'Suriyawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20729, N'Swamibagh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20730, N'Tajpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20731, N'Talbahat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20732, N'Talgram', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20733, N'Tambaur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20734, N'Tanda', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20735, N'Tatarpur Lallu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20736, N'Tetribazar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20737, N'Thakurdwara', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20738, N'Thana Bhawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20739, N'Thiriya Nizamat Khan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20740, N'Tikaitnagar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20741, N'Tikri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20742, N'Tilhar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20743, N'Tindwari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20744, N'Tirwaganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20745, N'Titron', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20746, N'Tori Fatehpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20747, N'Tulsipur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20748, N'Tundla', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20749, N'Tundla Kham', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20750, N'Tundla Railway Colony', 1662)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20751, N'Ugu', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20752, N'Ujhani', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20753, N'Ujhari', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20754, N'Umri', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20755, N'Umri Kalan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20756, N'Un', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20757, N'Unchahar', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20758, N'Unnao', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20759, N'Usaihat', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20760, N'Usawan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20761, N'Utraula', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20762, N'Varanasi', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20763, N'Varanasi Cantonment', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20764, N'Vijaigarh', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20765, N'Vrindavan', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20766, N'Wazirganj', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20767, N'Zafarabad', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20768, N'Zaidpur', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20769, N'Zamania', 1662)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20770, N'Almora', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20771, N'Almora Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20772, N'Badrinathpuri', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20773, N'Bageshwar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20774, N'Bah Bazar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20775, N'Banbasa', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20776, N'Bandia', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20777, N'Barkot', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20778, N'Bazpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20779, N'Bhim Tal', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20780, N'Bhowali', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20781, N'Chakrata', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20782, N'Chamba', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20783, N'Chamoli and Gopeshwar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20784, N'Champawat', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20785, N'Clement Town', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20786, N'Dehra Dun Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20787, N'Dehradun', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20788, N'Dehrakhas', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20789, N'Devaprayag', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20790, N'Dhaluwala', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20791, N'Dhandera', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20792, N'Dharchula', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20793, N'Dharchula Dehat', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20794, N'Didihat', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20795, N'Dineshpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20796, N'Doiwala', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20797, N'Dugadda', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20798, N'Dwarahat', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20799, N'Gadarpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20800, N'Gangotri', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20801, N'Gauchar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20802, N'Haldwani', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20803, N'Haridwar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20804, N'Herbertpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20805, N'Jaspur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20806, N'Jhabrera', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20807, N'Joshimath', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20808, N'Kachnal Gosain', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20809, N'Kaladungi', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20810, N'Kalagarh', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20811, N'Karnaprayang', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20812, N'Kashipur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20813, N'Kashirampur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20814, N'Kausani', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20815, N'Kedarnath', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20816, N'Kelakhera', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20817, N'Khatima', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20818, N'Kichha', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20819, N'Kirtinagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20820, N'Kotdwara', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20821, N'Laksar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20822, N'Lalkuan', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20823, N'Landaura', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20824, N'Landhaura Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20825, N'Lensdaun', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20826, N'Logahat', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20827, N'Mahua Dabra Haripura', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20828, N'Mahua Kheraganj', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20829, N'Manglaur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20830, N'Masuri', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20831, N'Mohanpur Mohammadpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20832, N'Muni Ki Reti', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20833, N'Nagla', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20834, N'Nainital', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20835, N'Nainital Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20836, N'Nandaprayang', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20837, N'Narendranagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20838, N'Pauri', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20839, N'Pithoragarh', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20840, N'Pratitnagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20841, N'Raipur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20842, N'Raiwala', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20843, N'Ramnagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20844, N'Ranikhet', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20845, N'Ranipur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20846, N'Rishikesh', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20847, N'Rishikesh Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20848, N'Roorkee', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20849, N'Rudraprayag', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20850, N'Rudrapur', 1663)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20851, N'Rurki', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20852, N'Rurki Cantonment', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20853, N'Shaktigarh', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20854, N'Sitarganj', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20855, N'Srinagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20856, N'Sultanpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20857, N'Tanakpur', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20858, N'Tehri', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20859, N'Udham Singh Nagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20860, N'Uttarkashi', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20861, N'Vikasnagar', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20862, N'Virbhadra', 1663)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20863, N'24 Parganas (n)', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20864, N'24 Parganas (s)', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20865, N'Adra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20866, N'Ahmadpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20867, N'Aiho', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20868, N'Aistala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20869, N'Alipur Duar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20870, N'Alipur Duar Railway Junction', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20871, N'Alpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20872, N'Amalhara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20873, N'Amkula', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20874, N'Amlagora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20875, N'Amodghata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20876, N'Amtala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20877, N'Andul', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20878, N'Anksa', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20879, N'Ankurhati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20880, N'Anup Nagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20881, N'Arambagh', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20882, N'Argari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20883, N'Arsha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20884, N'Asansol', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20885, N'Ashoknagar Kalyangarh', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20886, N'Aurangabad', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20887, N'Bablari Dewanganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20888, N'Badhagachhi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20889, N'Baduria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20890, N'Baghdogra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20891, N'Bagnan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20892, N'Bagra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20893, N'Bagula', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20894, N'Baharampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20895, N'Bahirgram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20896, N'Bahula', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20897, N'Baidyabati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20898, N'Bairatisal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20899, N'Baj Baj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20900, N'Bakreswar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20901, N'Balaram Pota', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20902, N'Balarampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20903, N'Bali Chak', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20904, N'Ballavpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20905, N'Bally', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20906, N'Balurghat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20907, N'Bamunari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20908, N'Banarhat Tea Garden', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20909, N'Bandel', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20910, N'Bangaon', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20911, N'Bankra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20912, N'Bankura', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20913, N'Bansbaria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20914, N'Banshra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20915, N'Banupur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20916, N'Bara Bamonia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20917, N'Barakpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20918, N'Barakpur Cantonment', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20919, N'Baranagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20920, N'Barasat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20921, N'Barddhaman', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20922, N'Barijhati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20923, N'Barjora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20924, N'Barrackpore', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20925, N'Baruihuda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20926, N'Baruipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20927, N'Barunda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20928, N'Basirhat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20929, N'Baska', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20930, N'Begampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20931, N'Beldanga', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20932, N'Beldubi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20933, N'Belebathan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20934, N'Beliator', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20935, N'Bhadreswar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20936, N'Bhandardaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20937, N'Bhangar Raghunathpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20938, N'Bhangri Pratham Khanda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20939, N'Bhanowara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20940, N'Bhatpara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20941, N'Bholar Dabri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20942, N'Bidhannagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20943, N'Bidyadharpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20944, N'Biki Hakola', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20945, N'Bilandapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20946, N'Bilpahari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20947, N'Bipra Noapara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20948, N'Birlapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20949, N'Birnagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20950, N'Bisarpara', 1665)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20951, N'Bishnupur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20952, N'Bolpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20953, N'Bongaon', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20954, N'Bowali', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20955, N'Burdwan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20956, N'Canning', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20957, N'Cart Road', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20958, N'Chachanda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20959, N'Chak Bankola', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20960, N'Chak Enayetnagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20961, N'Chak Kashipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20962, N'Chakalampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20963, N'Chakbansberia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20964, N'Chakdaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20965, N'Chakpara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20966, N'Champahati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20967, N'Champdani', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20968, N'Chamrail', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20969, N'Chandannagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20970, N'Chandpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20971, N'Chandrakona', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20972, N'Chapari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20973, N'Chapui', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20974, N'Char Brahmanagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20975, N'Char Maijdia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20976, N'Charka', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20977, N'Chata Kalikapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20978, N'Chauhati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20979, N'Checha Khata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20980, N'Chelad', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20981, N'Chhora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20982, N'Chikrand', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20983, N'Chittaranjan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20984, N'Contai', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20985, N'Cooch Behar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20986, N'Dainhat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20987, N'Dakshin Baguan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20988, N'Dakshin Jhapardaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20989, N'Dakshin Rajyadharpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20990, N'Dakshin Raypur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20991, N'Dalkola', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20992, N'Dalurband', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20993, N'Darap Pur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20994, N'Darjiling', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20995, N'Daulatpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20996, N'Debipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20997, N'Defahat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20998, N'Deora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (20999, N'Deulia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21000, N'Dhakuria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21001, N'Dhandadihi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21002, N'Dhanyakuria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21003, N'Dharmapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21004, N'Dhatri Gram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21005, N'Dhuilya', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21006, N'Dhulagari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21007, N'Dhulian', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21008, N'Dhupgari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21009, N'Dhusaripara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21010, N'Diamond Harbour', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21011, N'Digha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21012, N'Dignala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21013, N'Dinhata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21014, N'Dubrajpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21015, N'Dumjor', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21016, N'Durgapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21017, N'Durllabhganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21018, N'Egra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21019, N'Eksara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21020, N'Falakata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21021, N'Farakka', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21022, N'Fatellapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21023, N'Fort Gloster', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21024, N'Gabberia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21025, N'Gadigachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21026, N'Gairkata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21027, N'Gangarampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21028, N'Garalgachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21029, N'Garbeta Amlagora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21030, N'Garhbeta', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21031, N'Garshyamnagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21032, N'Garui', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21033, N'Garulia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21034, N'Gayespur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21035, N'Ghatal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21036, N'Ghorsala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21037, N'Goaljan', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21038, N'Goasafat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21039, N'Gobardanga', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21040, N'Gobindapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21041, N'Gopalpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21042, N'Gopinathpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21043, N'Gora Bazar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21044, N'Guma', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21045, N'Gurdaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21046, N'Guriahati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21047, N'Guskhara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21048, N'Habra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21049, N'Haldia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21050, N'Haldibari', 1665)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21051, N'Halisahar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21052, N'Haora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21053, N'Harharia Chak', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21054, N'Harindanga', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21055, N'Haringhata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21056, N'Haripur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21057, N'Harishpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21058, N'Hatgachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21059, N'Hatsimla', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21060, N'Hijuli', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21061, N'Hindustan Cables Town', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21062, N'Hooghly', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21063, N'Howrah', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21064, N'Hugli-Chunchura', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21065, N'Humaipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21066, N'Ichha Pur Defence Estate', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21067, N'Ingraj Bazar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21068, N'Islampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21069, N'Jafarpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21070, N'Jagadanandapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21071, N'Jagdishpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21072, N'Jagtaj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21073, N'Jala Kendua', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21074, N'Jaldhaka', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21075, N'Jalkhura', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21076, N'Jalpaiguri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21077, N'Jamuria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21078, N'Jangipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21079, N'Jaygaon', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21080, N'Jaynagar-Majilpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21081, N'Jemari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21082, N'Jemari Township', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21083, N'Jetia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21084, N'Jhalida', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21085, N'Jhargram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21086, N'Jhorhat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21087, N'Jiaganj-Azimganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21088, N'Joka', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21089, N'Jot Kamal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21090, N'Kachu Pukur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21091, N'Kajora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21092, N'Kakdihi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21093, N'Kakdwip', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21094, N'Kalaikunda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21095, N'Kalara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21096, N'Kalimpong', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21097, N'Kaliyaganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21098, N'Kalna', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21099, N'Kalyani', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21100, N'Kamarhati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21101, N'Kanaipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21102, N'Kanchrapara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21103, N'Kandi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21104, N'Kanki', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21105, N'Kankuria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21106, N'Kantlia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21107, N'Kanyanagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21108, N'Karimpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21109, N'Karsiyang', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21110, N'Kasba', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21111, N'Kasimbazar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21112, N'Katwa', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21113, N'Kaugachhi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21114, N'Kenda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21115, N'Kendra Khottamdi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21116, N'Kendua', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21117, N'Kesabpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21118, N'Khagrabari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21119, N'Khalia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21120, N'Khalor', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21121, N'Khandra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21122, N'Khantora', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21123, N'Kharagpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21124, N'Kharagpur Railway Settlement', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21125, N'Kharar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21126, N'Khardaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21127, N'Khari Mala Khagrabari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21128, N'Kharsarai', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21129, N'Khatra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21130, N'Khodarampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21131, N'Kodalia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21132, N'Kolaghat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21133, N'Kolaghat Thermal Power Project', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21134, N'Kolkata', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21135, N'Konardihi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21136, N'Konnogar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21137, N'Krishnanagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21138, N'Krishnapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21139, N'Kshidirpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21140, N'Kshirpai', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21141, N'Kulihanda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21142, N'Kulti', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21143, N'Kunustara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21144, N'Kuperskem', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21145, N'Madanpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21146, N'Madhusudanpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21147, N'Madhyamgram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21148, N'Maheshtala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21149, N'Mahiari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21150, N'Mahikpur', 1665)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21151, N'Mahira', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21152, N'Mahishadal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21153, N'Mainaguri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21154, N'Makardaha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21155, N'Mal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21156, N'Malda', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21157, N'Mandarbani', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21158, N'Mansinhapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21159, N'Masila', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21160, N'Maslandapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21161, N'Mathabhanga', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21162, N'Mekliganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21163, N'Memari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21164, N'Midnapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21165, N'Mirik', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21166, N'Monoharpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21167, N'Mrigala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21168, N'Muragachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21169, N'Murgathaul', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21170, N'Murshidabad', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21171, N'Nabadhai Dutta Pukur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21172, N'Nabagram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21173, N'Nabgram', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21174, N'Nachhratpur Katabari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21175, N'Nadia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21176, N'Naihati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21177, N'Nalhati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21178, N'Nasra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21179, N'Natibpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21180, N'Naupala', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21181, N'Navadwip', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21182, N'Nebadhai Duttapukur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21183, N'New Barrackpore', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21184, N'Ni Barakpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21185, N'Nibra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21186, N'Noapara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21187, N'Nokpul', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21188, N'North Barakpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21189, N'Odlabari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21190, N'Old Maldah', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21191, N'Ondal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21192, N'Pairagachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21193, N'Palashban', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21194, N'Panchla', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21195, N'Panchpara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21196, N'Pandua', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21197, N'Pangachhiya', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21198, N'Paniara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21199, N'Panihati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21200, N'Panuhat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21201, N'Par Beliya', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21202, N'Parashkol', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21203, N'Parasia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21204, N'Parbbatipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21205, N'Parui', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21206, N'Paschim Jitpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21207, N'Paschim Punro Para', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21208, N'Patrasaer', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21209, N'Pattabong Tea Garden', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21210, N'Patuli', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21211, N'Patulia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21212, N'Phulia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21213, N'Podara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21214, N'Port Blair', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21215, N'Prayagpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21216, N'Pujali', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21217, N'Purba Medinipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21218, N'Purba Tajpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21219, N'Purulia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21220, N'Raghudebbati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21221, N'Raghudebpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21222, N'Raghunathchak', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21223, N'Raghunathpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21224, N'Raghunathpur-Dankuni', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21225, N'Raghunathpur-Magra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21226, N'Raigachhi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21227, N'Raiganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21228, N'Raipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21229, N'Rajarhat Gopalpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21230, N'Rajpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21231, N'Ramchandrapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21232, N'Ramjibanpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21233, N'Ramnagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21234, N'Rampur Hat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21235, N'Ranaghat', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21236, N'Raniganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21237, N'Ratibati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21238, N'Raypur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21239, N'Rishra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21240, N'Rishra Cantonment', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21241, N'Ruiya', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21242, N'Sahajadpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21243, N'Sahapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21244, N'Sainthia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21245, N'Salap', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21246, N'Sankarpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21247, N'Sankrail', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21248, N'Santoshpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21249, N'Saontaidih', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21250, N'Sarenga', 1665)
GO
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21251, N'Sarpi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21252, N'Satigachha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21253, N'Serpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21254, N'Shankhanagar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21255, N'Shantipur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21256, N'Shrirampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21257, N'Siduli', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21258, N'Siliguri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21259, N'Simla', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21260, N'Singur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21261, N'Sirsha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21262, N'Siuri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21263, N'Sobhaganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21264, N'Sodpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21265, N'Sonamukhi', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21266, N'Sonatikiri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21267, N'Srikantabati', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21268, N'Srirampur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21269, N'Sukdal', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21270, N'Taherpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21271, N'Taki', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21272, N'Talbandha', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21273, N'Tamluk', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21274, N'Tarakeswar', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21275, N'Tentulberia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21276, N'Tentulkuli', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21277, N'Thermal Power Project', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21278, N'Tinsukia', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21279, N'Titagarh', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21280, N'Tufanganj', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21281, N'Ukhra', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21282, N'Ula', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21283, N'Ulubaria', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21284, N'Uttar Durgapur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21285, N'Uttar Goara', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21286, N'Uttar Kalas', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21287, N'Uttar Kamakhyaguri', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21288, N'Uttar Latabari', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21289, N'Uttar Mahammadpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21290, N'Uttar Pirpur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21291, N'Uttar Raypur', 1665)
INSERT [dbo].[CityMaster] ([CityIDP], [CityName], [StateIDF]) VALUES (21292, N'Uttarpara-Kotrung', 1665)
SET IDENTITY_INSERT [dbo].[CityMaster] OFF
GO
INSERT [dbo].[CompanyMaster] ([CompanyIDP], [CompanyTypeIDF], [CountryIDF], [StateIDF], [CityIDF], [CompanyName], [CompanyLogoPath], [HQ_Pincode], [HQ_Address], [ContactEmail], [ContactNumber], [RegistrationDate], [Password], [CEOName], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [GSTINNumber], [Gender]) VALUES (N'f8436d66-20e2-4943-ae74-0e5018512212', N'f9ea3073-05fd-404d-89a4-ae2c95d4617e', 101, 1636, 16562, N'befoodie', N'~/Content/Images/CMP_638445429236766638.png', N'360001', N'Dr Yagnik Road The Imperial Palace, Lounge Level, Rajkot 360001 India', N'arjunmehra@gmail.com', N'2222222222', CAST(N'2015-02-06T00:00:00.000' AS DateTime), N'Admin@123', N'Arjun Mehra', CAST(N'2024-02-16T17:26:55.647' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T11:15:27.230' AS DateTime), NULL, 1, N'22ABAAA0000A1Z1', N'Male')
INSERT [dbo].[CompanyMaster] ([CompanyIDP], [CompanyTypeIDF], [CountryIDF], [StateIDF], [CityIDF], [CompanyName], [CompanyLogoPath], [HQ_Pincode], [HQ_Address], [ContactEmail], [ContactNumber], [RegistrationDate], [Password], [CEOName], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [GSTINNumber], [Gender]) VALUES (N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f9ea3073-05fd-404d-89a4-ae2c95d4617e', 101, 1636, 16334, N'mcdonald''s', N'~/Content/Images/CMP_638443721798728768.png', N'380001', N'assssdsfs', N'chris@mcdonald.com', N'8928304199', CAST(N'1990-02-11T00:00:00.000' AS DateTime), N'Admin@123', N'Chris Kempczinski', CAST(N'2024-02-14T10:53:46.773' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:49:40.140' AS DateTime), NULL, 1, N'22AAAAA0000A1Z5', N'Male')
INSERT [dbo].[CompanyMaster] ([CompanyIDP], [CompanyTypeIDF], [CountryIDF], [StateIDF], [CityIDF], [CompanyName], [CompanyLogoPath], [HQ_Pincode], [HQ_Address], [ContactEmail], [ContactNumber], [RegistrationDate], [Password], [CEOName], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [GSTINNumber], [Gender]) VALUES (N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'f9ea3073-05fd-404d-89a4-ae2c95d4617e', 101, 1636, 16334, N'Taste of Home', N'~/Content/Images/CMP_638436846159380217.jpg', N'380002', N'SP Ringroad, Ahmedabad', N'vikramsinghania@gmail.com', N'6700067000', CAST(N'2009-10-09T00:00:00.000' AS DateTime), N'Admin@123', N'Vikram Singhania', CAST(N'2024-02-16T12:50:16.353' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:20:24.290' AS DateTime), NULL, 1, N'22AAABB0000A1Z5', N'Male')
INSERT [dbo].[CompanyMaster] ([CompanyIDP], [CompanyTypeIDF], [CountryIDF], [StateIDF], [CityIDF], [CompanyName], [CompanyLogoPath], [HQ_Pincode], [HQ_Address], [ContactEmail], [ContactNumber], [RegistrationDate], [Password], [CEOName], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [isActive], [GSTINNumber], [Gender]) VALUES (N'81bc939b-4e23-4edf-a597-682973db6ab1', N'f9ea3073-05fd-404d-89a4-ae2c95d4617e', 101, 1636, 16562, N'The Rise Bowl Restaurant', N'~/Content/Images/CMP_638443712381480285.jpg', N'360002', N'New 150 Fit Ringroad, rajkot', N'rajeshpatel@gmail.com', N'9808088888', CAST(N'1990-02-02T00:00:00.000' AS DateTime), N'Admin@123', N'Rajesh Patel', CAST(N'2024-02-15T12:42:20.527' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:39:40.367' AS DateTime), NULL, 1, N'22AAABA0000A1Z7', N'Male')
GO
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'495ef81d-e218-4ef7-89a5-00691fc5ae4d', N'Retail Store', 1, CAST(N'2024-02-01T18:17:21.450' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-22T08:35:19.003' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f61b4e00-60a6-41f9-8ae9-082677e0b21e', N'Bar', 1, CAST(N'2024-02-04T19:34:00.760' AS DateTime), N'00000000-0000-0000-0000-000000000001', CAST(N'2024-02-22T08:30:51.440' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'24d57a26-c70b-4938-b96a-23766c7bd326', N'Cafe', 1, CAST(N'2024-02-02T11:58:55.503' AS DateTime), N'a3f61166-5e48-467f-b31f-26b90cad0971', CAST(N'2024-02-03T16:45:00.757' AS DateTime), N'a3f61166-5e48-467f-b31f-26b90cad0971')
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'2e979250-7dd3-42c5-a489-876921e0131d', N'Entertainment', 1, CAST(N'2024-02-01T18:32:29.473' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-02T12:36:42.527' AS DateTime), N'a3f61166-5e48-467f-b31f-26b90cad0971')
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f57b99e2-7f4e-4453-b09c-8b4d76a46bb7', N'Theater', 1, CAST(N'2024-02-12T22:30:29.610' AS DateTime), N'657cff55-6676-46f7-8070-151df3293836', NULL, NULL)
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f9ea3073-05fd-404d-89a4-ae2c95d4617e', N'Restaurant', 1, CAST(N'2024-02-12T15:07:20.503' AS DateTime), N'657cff55-6676-46f7-8070-151df3293836', NULL, NULL)
INSERT [dbo].[CompanyTypeMaster] ([CompanyTypeIDP], [CompanyType], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a88f7460-d334-4e3d-ba11-cba1fc08fd9e', N'Event Management', 1, CAST(N'2024-02-01T18:19:14.477' AS DateTime), N'00000000-0000-0000-0000-000000000000', CAST(N'2024-02-02T12:36:53.490' AS DateTime), N'a3f61166-5e48-467f-b31f-26b90cad0971')
GO
SET IDENTITY_INSERT [dbo].[CountryMaster] ON 

INSERT [dbo].[CountryMaster] ([CountryIDP], [CountryName], [CountryCode]) VALUES (101, N'India', N'IN')
SET IDENTITY_INSERT [dbo].[CountryMaster] OFF
GO
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'78b0135a-8a47-45a7-a864-01009ecf8fc8', N'Error setting value to ''SiteIDF'' on ''SQLClass.SubCategoryMaster''.', N'   at Newtonsoft.Json.Serialization.DynamicValueProvider.SetValue(Object target, Object value)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.SetPropertyValue(JsonProperty property, JsonConverter propertyConverter, JsonContainerContract containerContract, JsonProperty containerProperty, JsonReader reader, Object target)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateList(IList list, JsonReader reader, JsonArrayContract contract, JsonProperty containerProperty, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at QRT.Controllers.SubCategoryMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-19T17:03:19.740' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'd67c1568-981e-4608-9281-02f08d13912e', N'Length cannot be less than zero.
Parameter name: length', N'   at System.String.Substring(Int32 startIndex, Int32 length)
   at QRT.Controllers.SitesMasterController.<>c.<GeneralAction>b__0#1(String part)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.String.Join(String separator, IEnumerable`1 values)
   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-15T17:28:57.500' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'3b36870a-7783-4d53-8035-e8203128f3b5', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'09a7c2e2-56c0-441b-afa1-034550d67654', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T14:43:49.877' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'6daffdcd-8e59-4628-9dc9-046f20991d8f', N'Could not convert string to DateTime: 20-02-2024. Path ''[0].CreationDate'', line 1, position 311.', N'   at Newtonsoft.Json.JsonReader.ReadDateTimeString(String s)
   at Newtonsoft.Json.JsonTextReader.FinishReadQuotedStringValue(ReadType readType)
   at Newtonsoft.Json.JsonTextReader.ReadStringValue(ReadType readType)
   at Newtonsoft.Json.JsonTextReader.ReadAsDateTime()
   at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateObject(Object newObject, JsonReader reader, JsonObjectContract contract, JsonProperty member, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateObject(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.PopulateList(IList list, JsonReader reader, JsonArrayContract contract, JsonProperty containerProperty, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at QRT.Controllers.SeatMappingMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 114', CAST(N'2024-02-21T13:14:48.300' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'e6770319-ae66-4270-93d9-2c23103161b7', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'fbbd57cd-fa0d-49bb-b8f5-056aa489705e', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-16T13:33:49.013' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'd84ffde2-fff9-4834-9cd5-05d2358f1f88', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:26:44.463' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'1b7631cb-9020-4840-b855-08886b8c5a03', N'Specified cast is not valid.', N'   at QRT.Controllers.AccountController.LogOff() in D:\Prashant WorkSpace\QRT\QRT\Controllers\AccountController.cs:line 704', CAST(N'2024-02-15T21:32:20.077' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'619d7047-927c-4e46-a835-098e9842b4a4', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:06:50.567' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'7c201e9b-8510-4de8-803c-0afc80461212', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:22:58.360' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'7b4b3f06-8d31-40a0-a4ba-0efa03733eec', N'Object reference not set to an instance of an object.', N'   at QRT.Controllers.AccountController.LogOff() in D:\Prashant WorkSpace\QRT\QRT\Controllers\AccountController.cs:line 681', CAST(N'2024-02-21T12:12:45.057' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'37540eb4-2282-4b02-89db-1200f9cc6192', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T14:53:32.000' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8961d501-485e-4823-9a61-1217ebbe2f1f', N'Invalid column name ''IndexInCategory''.', N'   at QRT.Controllers.MenuMasterController.GetByID(Guid id) in D:\Prashant WorkSpace\QRT\QRT\Controllers\MenuMasterController.cs:line 101', CAST(N'2024-02-23T15:47:55.620' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'240d4c41-9ca9-45ca-8318-2003794841de')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'53756f2f-9dcf-4d32-8e04-24d36ba5e7d6', N'Unable to perform action, record already exists in SubCategoryMaster.SiteIDF', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SitesMasterController.cs:line 216', CAST(N'2024-02-15T13:41:03.043' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'f1b53dc5-846b-4155-a207-a6e573c4736f', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'38f4affc-55d3-4411-8e1a-271d6ef29804', N'Specified cast is not valid.', N'   at QRT.Controllers.AccountController.LogOff()', CAST(N'2024-02-15T21:44:31.557' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'dd863c90-48da-4fa7-92f7-3214d2386725', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:48:25.803' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'42bdb42c-2d7b-43d5-b342-429d44af12f1', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:56:07.773' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'3a865cae-9c5c-4ba3-a68f-43d2eb64b6c7', N'Error : Procedure or function ''SubCategoryMaster_Insert_Update'' expects parameter ''@SubCategoryImagePath'', which was not supplied.', N'   at QRT.Controllers.SubCategoryMasterController.Save(SubCategoryMaster model) in D:\AdityaWorkspace\QRT\QRT\Controllers\SubCategoryMasterController.cs:line 234', CAST(N'2024-02-26T15:41:24.887' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'6123e8dc-bff5-489f-be38-47b8da7a86a9', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:26:08.727' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'573fae67-0ea3-4c88-b624-4825d5d3d967', N'Conversion failed when converting from a character string to uniqueidentifier.', N'   at QRT.Controllers.CategoryMasterController.GetData() in D:\BanshiWorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 62', CAST(N'2024-02-26T15:36:18.257' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'a87139e0-010a-4b28-b25c-4ae22d9f8f9f', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:34:08.877' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'f8bc2062-40c4-4dae-9d73-4b228ff261b8', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:55:31.677' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'cdb76fb3-749f-4371-903a-4bfa0f78a7dd', N'Status changed Successfully.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\CategoryMasterController.cs:line 207', CAST(N'2024-02-14T14:55:51.233' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8ff5062d-0329-4088-b24e-4c8bf6f186ba', N'Error : Could not find stored procedure ''MenuMaster_GeneralAction''.', N'   at QRT.Controllers.MenuMasterController.GeneralAction(Guid id, Boolean flag) in D:\Prashant WorkSpace\QRT\QRT\Controllers\MenuMasterController.cs:line 241', CAST(N'2024-02-19T16:42:31.520' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'996a5ade-0922-40b3-b050-503bd2f26171', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T14:47:07.610' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'b1cc3067-a7cf-4ef4-a649-527170414220', N'Method not found: ''System.String SQLClass.MenuMaster.get_QuantitySpecification()''.', N'   at SQLLogic.MenuMasterLogic.MenuMaster_Insert_Update(MenuMaster model)
   at QRT.Controllers.MenuMasterController.Save(MenuMaster model) in D:\Prashant WorkSpace\QRT\QRT\Controllers\MenuMasterController.cs:line 193', CAST(N'2024-02-24T21:19:20.330' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'bc448068-2247-4f49-812e-5455fe671c5b', N'Object reference not set to an instance of an object.', N'   at QRT.Controllers.AccountController.LogOff() in D:\Prashant WorkSpace\QRT\QRT\Controllers\AccountController.cs:line 681', CAST(N'2024-02-21T12:12:58.077' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'd9f164e3-151f-47db-8949-59602eed04b7', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:13:26.823' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'c570dccb-98dd-48ed-8b5d-5a88a8fd5c6d', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:23:10.863' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'f8ee6e84-9b71-4406-996d-5db8378039d9', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:27:50.503' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'74a96979-d9ea-41d5-97ef-5e4f3b021fcb', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:31:24.110' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'dadeeb92-fcfe-4e4b-94e7-60e3f376c4f7', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:44:08.413' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8c07efa0-9d62-486c-9a29-615a004fc594', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:35:53.350' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'70566a89-45cd-4075-b157-657b52f329dd', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:29:46.113' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'93e00b76-ad4d-4f53-881c-6e1687445a5a', N'Unable to perform action, record already exists in ErrorLogs.CompanyIDF, SubCategoryMaster.SiteIDF', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SitesMasterController.cs:line 216', CAST(N'2024-02-15T13:41:10.327' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'f1b53dc5-846b-4155-a207-a6e573c4736f', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'9d64b286-b8a7-46c1-9d9d-7256e9032f90', N'Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx).', N'   at System.Guid.TryParseGuidWithDashes(String guidString, GuidResult& result)
   at System.Guid.TryParseGuid(String g, GuidStyles flags, GuidResult& result)
   at System.Guid.Parse(String input)
   at QRT.Controllers.RegistrationController.Index() in D:\AdityaWorkspace\QRT\QRT\Controllers\RegistrationController.cs:line 37', CAST(N'2024-02-15T11:37:39.340' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'7ec60d8d-4c40-4462-99b7-773a6cde725e', N'Unexpected character encountered while parsing value: A. Path '''', line 0, position 0.', N'   at Newtonsoft.Json.JsonTextReader.ParseValue()
   at Newtonsoft.Json.JsonTextReader.Read()
   at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at QRT.Controllers.SeatMappingMasterController.Index() in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 32', CAST(N'2024-02-25T19:08:10.427' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'f47c4bf3-2f6d-481e-a477-7a30233e9190', N'Unable to perform action, record already exists in CategoryMaster.SiteIDF, ErrorLogs.CompanyIDF', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SitesMasterController.cs:line 216', CAST(N'2024-02-15T13:41:25.600' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'cc8fe6c2-f507-49bf-9dbc-5ca3bc8da868', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8838937f-d48d-4c70-8bb8-7c5ce0fd6c3e', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at QRT.Controllers.SeatMappingMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 115', CAST(N'2024-02-21T13:04:47.040' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'a12b83d4-f719-4fec-be38-0423cc594166', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'61839b62-def8-47be-8622-7eadb0825838', N'Method not found: ''Int32 SQLClass.CategoryMaster.get_priorityIndex()''.', N'   at SQLLogic.CategoryMasterLogic.CategoryMaster_Insert_Update(CategoryMaster model)
   at QRT.Controllers.CategoryMasterController.Save(CategoryMaster model) in D:\BanshiWorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 165', CAST(N'2024-02-22T16:45:12.780' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'066560c1-9cd6-448a-9fd7-8279abf852ee', N'Procedure or function ''SeatMappingMaster_GetAll'' expects parameter ''@SiteIDF'', which was not supplied.', N'   at QRT.Controllers.SeatMappingMasterController.GetData() in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 61', CAST(N'2024-02-26T12:50:19.697' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'd66b1f9f-4555-4948-8ab2-86c7f7cb7978', N'Error : Procedure or function ''CategoryMaster_GeneralAction'' expects parameter ''@abc'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-16T13:33:11.717' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'5a8ea1ef-6a36-4ac2-9695-87dd3f54c125', N'Status changed successfully. ', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-15T16:21:59.553' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'db7bc648-4f3e-4a61-8f6d-0d5527c67bfb', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'5ee835dd-5541-42e9-ad01-90dc2f091035', N'Length cannot be less than zero.
Parameter name: length', N'   at System.String.Substring(Int32 startIndex, Int32 length)
   at QRT.Controllers.SitesMasterController.<>c.<GeneralAction>b__0#1(String part)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.String.Join(String separator, IEnumerable`1 values)
   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-15T17:31:11.490' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'1dde1831-685d-4a07-813f-2742a2ce4c05', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'29da56a3-43a7-4749-948f-9299b99873a0', N'Unexpected character encountered while parsing value: A. Path '''', line 0, position 0.', N'   at Newtonsoft.Json.JsonTextReader.ParseValue()
   at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at QRT.Controllers.MenuMasterController.Save(MenuMaster model) in D:\Prashant WorkSpace\QRT\QRT\Controllers\MenuMasterController.cs:line 163', CAST(N'2024-02-25T13:53:37.633' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'1741ade4-e71a-4ab5-a046-92a6caa4313e', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:58:38.090' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'1cc11502-28fa-4923-8158-98520a0a7a28', N'Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx).', N'   at System.Guid.TryParseGuidWithDashes(String guidString, GuidResult& result)
   at System.Guid.TryParseGuid(String g, GuidStyles flags, GuidResult& result)
   at System.Guid.Parse(String input)
   at QRT.Controllers.RegistrationController.Index() in D:\AdityaWorkspace\QRT\QRT\Controllers\RegistrationController.cs:line 37', CAST(N'2024-02-15T11:37:50.003' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'c6e037cf-86f3-4c05-90bc-98b1ef3398ed', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:55:48.463' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'53f2b031-985f-43f0-915b-997a04ac26ca', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:46:37.373' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'53957587-416e-415c-b537-999ced26dcca', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at QRT.Controllers.SeatMappingMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 110', CAST(N'2024-02-26T10:30:44.143' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'd960c4e5-049a-4f4d-a82c-73f6b8ddad34', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'dce96e28-291f-40c0-944c-9d914fcfe403', N'Object reference not set to an instance of an object.', N'   at QRT.Controllers.AccountController.LogOff() in D:\Prashant WorkSpace\QRT\QRT\Controllers\AccountController.cs:line 681', CAST(N'2024-02-21T12:13:01.930' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'a5864524-d420-4934-83ac-9e1cd5a33217', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:23:36.230' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'c3af5d2a-d0c4-425c-8507-a49b7921186f', N'Method not found: ''Int32 SQLClass.CategoryMaster.get_priorityIndex()''.', N'   at SQLLogic.CategoryMasterLogic.CategoryMaster_Insert_Update(CategoryMaster model)
   at QRT.Controllers.CategoryMasterController.Save(CategoryMaster model) in D:\BanshiWorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 165', CAST(N'2024-02-22T16:53:02.560' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'0e61ad09-8601-4e07-8c28-a8ff7ba0eef4', N'Method not found: ''Int32 SQLClass.CategoryMaster.get_priorityIndex()''.', N'   at SQLLogic.CategoryMasterLogic.CategoryMaster_Insert_Update(CategoryMaster model)
   at QRT.Controllers.CategoryMasterController.Save(CategoryMaster model) in D:\BanshiWorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 165', CAST(N'2024-02-22T17:05:06.977' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8838422c-bcd6-443d-be1e-a989349aff7b', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:34:26.433' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'fa0c0010-e663-4a6b-95d0-af382c85a0ee', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:46:49.540' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'1c74b482-615c-4bf6-b5f8-afda5fd799d2', N'Status changed Successfully.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\CategoryMasterController.cs:line 197', CAST(N'2024-02-14T11:41:29.803' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'4f161107-00f1-49a8-a5ec-b12bc732c6a2', N'Status changed Successfully.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\CategoryMasterController.cs:line 197', CAST(N'2024-02-14T11:41:26.063' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'b352c129-ee5e-4c3b-aff8-b63fed162be5', N'Object reference not set to an instance of an object.', N'   at QRT.Controllers.AccountController.LogOff() in D:\Prashant WorkSpace\QRT\QRT\Controllers\AccountController.cs:line 683', CAST(N'2024-02-16T13:04:52.963' AS DateTime), N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'5384fb4d-5955-41ec-b53e-b6b0a61d9f0d', N'Unable to perform action, record already exists in', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SitesMasterController.cs:line 216', CAST(N'2024-02-15T13:07:49.500' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'cc8fe6c2-f507-49bf-9dbc-5ca3bc8da868', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'c00d286b-4310-4adb-b4b8-b7693e41c8b1', N'Guid should contain 32 digits with 4 dashes (xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx).', N'   at System.Guid.TryParseGuidWithDashes(String guidString, GuidResult& result)
   at System.Guid.TryParseGuid(String g, GuidStyles flags, GuidResult& result)
   at System.Guid.Parse(String input)
   at QRT.Controllers.RegistrationController.GetData() in D:\AdityaWorkspace\QRT\QRT\Controllers\RegistrationController.cs:line 58', CAST(N'2024-02-15T11:37:38.370' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'b13e8d63-955d-4a71-b468-c66df9fa914b', N'Cannot deserialize the current JSON array (e.g. [1,2,3]) into type ''SQLClass.CategoryMaster'' because the type requires a JSON object (e.g. {"name":"value"}) to deserialize correctly.
To fix this error either change the JSON to a JSON object (e.g. {"name":"value"}) or change the deserialized type to an array or a type that implements a collection interface (e.g. ICollection, IList) like List<T> that can be deserialized from a JSON array. JsonArrayAttribute can also be added to the type to force it to deserialize from a JSON array.
Path '''', line 1, position 1.', N'   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.EnsureArrayContract(JsonReader reader, Type objectType, JsonContract contract)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateList(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, Object existingValue, String id)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.CreateValueInternal(JsonReader reader, Type objectType, JsonContract contract, JsonProperty member, JsonContainerContract containerContract, JsonProperty containerMember, Object existingValue)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-16T14:12:05.940' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'6b9bf1da-cd2b-4bf3-a5e7-cbb9e6cc10e3', N'Status changed Successfully. Also, reflected in th', N'   at QRT.Controllers.CompanyTypeMasterController.GeneralAction(Guid id, Boolean flag)', CAST(N'2024-02-15T22:38:33.843' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'f8b6e3cc-da11-4ebb-aeee-d1a4448fcfd3', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:41:39.690' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'337f78f9-b150-49d3-a107-d6f705a1fe00', N'Procedure or function ''SeatMappingMaster_GetAll'' expects parameter ''@SiteIDF'', which was not supplied.', N'   at QRT.Controllers.SeatMappingMasterController.GetData() in D:\BanshiWorkSpace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 61', CAST(N'2024-02-26T13:11:20.967' AS DateTime), N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'612ea57f-5e7e-42d4-8d5e-d8f8b01dea78', N'Length cannot be less than zero.
Parameter name: length', N'   at System.String.Substring(Int32 startIndex, Int32 length)
   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\Prashant WorkSpace\QRT\QRT\Controllers\SitesMasterController.cs:line 200', CAST(N'2024-02-15T13:16:50.520' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'1dde1831-685d-4a07-813f-2742a2ce4c05', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'd2c6dac7-06ac-4691-adcc-d9638a4a2eb7', N'Method not found: ''Boolean SQLClass.MenuMaster.get_IsProductOfDay()''.', N'   at SQLLogic.MenuMasterLogic.MenuMaster_Insert_Update(MenuMaster model)
   at QRT.Controllers.MenuMasterController.Save(MenuMaster model)', CAST(N'2024-02-20T13:30:07.713' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'1e5939e7-429e-4b9d-b020-d9f09709fa3a', N'Unable to perform action, record already exists in', N'   at QRT.Controllers.SitesMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SitesMasterController.cs:line 216', CAST(N'2024-02-15T13:08:36.997' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'cc8fe6c2-f507-49bf-9dbc-5ca3bc8da868', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'0e3e47fa-49fb-4239-b1d4-da2f42f7ec70', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T12:03:16.423' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'ff6532ae-b6b0-4599-8b1c-da8c9f8744ee', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T14:52:32.790' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'7499c207-d016-4bea-99f9-dc71df46bbab', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:52:49.503' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'3db71f29-23b4-493e-8bc3-de71acb458af', N'Unexpected character encountered while parsing value: A. Path '''', line 0, position 0.', N'   at Newtonsoft.Json.JsonTextReader.ParseValue()
   at Newtonsoft.Json.JsonTextReader.Read()
   at Newtonsoft.Json.JsonReader.ReadForType(JsonContract contract, Boolean hasConverter)
   at Newtonsoft.Json.Serialization.JsonSerializerInternalReader.Deserialize(JsonReader reader, Type objectType, Boolean checkAdditionalContent)
   at Newtonsoft.Json.JsonSerializer.DeserializeInternal(JsonReader reader, Type objectType)
   at Newtonsoft.Json.JsonConvert.DeserializeObject(String value, Type type, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value, JsonSerializerSettings settings)
   at Newtonsoft.Json.JsonConvert.DeserializeObject[T](String value)
   at QRT.Controllers.RegistrationController.Index() in D:\AdityaWorkspace\QRT\QRT\Controllers\RegistrationController.cs:line 36', CAST(N'2024-02-25T17:23:22.903' AS DateTime), N'03add488-8eee-4bdb-848b-f5871aff3be6', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'8f25eb14-6c69-489f-9a5e-e139c267900b', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at QRT.Controllers.SeatMappingMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 110', CAST(N'2024-02-26T10:30:45.163' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'3273cfe9-defd-44e1-a6d7-40dc3be821d2', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'269b1753-97b9-45f6-9dc5-e152d9e0d6e2', N'Error : Could not find stored procedure ''MenuMaster_GeneralAction''.', N'   at QRT.Controllers.MenuMasterController.GeneralAction(Guid id, Boolean flag) in D:\Prashant WorkSpace\QRT\QRT\Controllers\MenuMasterController.cs:line 241', CAST(N'2024-02-19T16:40:10.873' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'dd295316-fc48-4d2b-8228-e4e672541b38', N'Value cannot be null.
Parameter name: source', N'   at System.Linq.Enumerable.First[TSource](IEnumerable`1 source)
   at QRT.Controllers.SeatMappingMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\SeatMappingMasterController.cs:line 110', CAST(N'2024-02-26T10:30:43.157' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'b996343a-4d5c-4a76-97fa-ba8ef1f3fa40', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'b155bdb1-0bcd-4dd5-af12-e5fa753c27b0', N'Execution Timeout Expired.  The timeout period elapsed prior to completion of the operation or the server is not responding.', N'   at QRT.Controllers.CategoryMasterController.GetData() in D:\BanshiWorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 62', CAST(N'2024-02-26T15:39:35.537' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'94d0817d-68e5-4c7c-b8f6-e663937eae9f', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:44:31.937' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'bb89368c-80ab-45a9-9efd-e7b9878918bb', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T15:51:28.130' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'c58845bc-06dd-4a9d-9938-e875952f5485', N'Status changed Successfully.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\CategoryMasterController.cs:line 197', CAST(N'2024-02-14T11:41:57.690' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'f1474ece-a329-4d67-9384-f7dd5d03387c', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds) in D:\Prashant WorkSpace\QRT\QRT\Controllers\CategoryMasterController.cs:line 262', CAST(N'2024-02-21T11:33:45.570' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'7145e728-0148-429f-8ace-f7fe7c0ef5b8', N'Procedure or function ''CategoryMaster_GetCategoryFromSites'' expects parameter ''@siteIds'', which was not supplied.', N'   at QRT.Controllers.CategoryMasterController.GetCategoryFromSites(String siteIds)', CAST(N'2024-02-19T18:37:09.593' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[ErrorLogs] ([LogId], [ErrorMsg], [StackTrace], [EntryDate], [UserID], [CompanyIDF], [SiteIDF]) VALUES (N'994b2b6b-8ac9-4feb-819a-ffb330792928', N'Status changed Successfully.', N'   at QRT.Controllers.CategoryMasterController.GeneralAction(Guid id, Boolean flag) in D:\AdityaWorkspace\QRT\QRT\Controllers\CategoryMasterController.cs:line 197', CAST(N'2024-02-14T11:42:04.060' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'00000000-0000-0000-0000-000000000000', N'00000000-0000-0000-0000-000000000000')
GO
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3de96131-ef90-4670-83bc-05b1eb1fa4ff', N'00000000-0000-0000-0000-000000000000', N'How would you rate the quality of the food you received?', 1, CAST(N'2024-02-14T13:09:24.473' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'564f0bfb-ccab-4e96-abd5-0bac3892a710', N'00000000-0000-0000-0000-000000000000', N'Were you satisfied with the portion sizes of the dishes?', 1, CAST(N'2024-02-14T13:09:38.877' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a093f6b9-98bd-4c09-81ce-384e8f3ceb05', N'5a990481-bf8b-4be3-bf5c-0dbcdc105719', N'New Test', 1, CAST(N'2024-02-14T16:56:42.407' AS DateTime), N'23302c8f-bc36-4a79-8a30-8f33a9536d22', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'6648d498-0f6c-44db-aabf-4e94f95561fb', N'00000000-0000-0000-0000-000000000000', N'How would you rate the cleanliness and ambiance of the restaurant?', 1, CAST(N'2024-02-14T13:09:52.467' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'46519a55-b9c6-4241-bcf8-5ea56b0eced2', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'hgewsdziukd,hfbhdnx,mvgzb', 1, CAST(N'2024-02-20T12:37:01.693' AS DateTime), N'4a90c0dc-a7b5-4bb4-a628-7a41ed5fa18a', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'eb8a4ac1-eafd-4341-a859-7d797582fdee', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dhgiuskalscvbjnm,.xcvbmnkl234', 1, CAST(N'2024-02-22T06:38:39.707' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'29144ee7-96f6-470e-a2cb-aaa231b0de9b', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'test Question first', 1, CAST(N'2024-02-14T17:43:49.073' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'dc36009c-ca1c-4e63-92ea-cef516dc55e8', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'HeadOffice Question', 1, CAST(N'2024-02-20T12:30:35.000' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', NULL, NULL)
INSERT [dbo].[FeedbackQuestionsMaster] ([QuestionIDP], [CompanyIDF], [QuestionText], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'eb30244e-0ad7-4dac-9012-e6cca5631808', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Reliance Mall Questions', 1, CAST(N'2024-02-20T12:31:09.480' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', NULL, NULL)
GO
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'a480616b-486b-4b74-87ca-01a89afd8330', N'd111f77c-b4dc-4776-95a8-58ba59dce28d', N'f7951c90-9a51-4974-981b-e720d97faa26', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Check test McD Jamanagar', N'abcd', CAST(90.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638445486375333509.jpg', 1, CAST(N'2024-02-26T12:50:36.757' AS DateTime), N'03add488-8eee-4bdb-848b-f5871aff3be6', NULL, NULL, N'1', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'1e5e6089-e07f-4669-a3c1-0cee62ca8e5f', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'23719e9b-1d26-4355-9ce6-0396866d61a1', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'French Fries', N'Salted Fries, Smoky Chipotle Sauce', CAST(99.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444677951345091.jpg', 1, CAST(N'2024-02-23T18:05:51.730' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T14:23:15.830' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'150g', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'afa015ef-4acf-4c9e-ae23-0f84a02ff271', N'd111f77c-b4dc-4776-95a8-58ba59dce28d', N'f7951c90-9a51-4974-981b-e720d97faa26', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'test check', N'abcd', CAST(190.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638445485409264566.jpg', 1, CAST(N'2024-02-26T12:49:00.180' AS DateTime), N'03add488-8eee-4bdb-848b-f5871aff3be6', NULL, NULL, N'1', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'1c3e9fe3-5684-4b6c-b524-12d61c0cfd77', N'4d064a95-4614-422b-b790-3d517cf44995', N'3038980d-3cec-4558-b182-f87fe6784778', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'Pineapple Raita with Mix Fruit', N'Pineapple Raita with Mix Fruit', CAST(125.00 AS Decimal(10, 2)), 0, N'Winter', N'~/Content/Images/MENU_638445490576921186.jpg', 1, CAST(N'2024-02-26T12:57:43.577' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL, N'1', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'deeaf65b-5f5a-462b-9c73-16e7e4eda522', N'abc55fa5-5d2c-456d-848d-190d5f8efb19', N'890f08de-f2cf-404c-b28c-5d7bb0fbe832', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'Thin Crust Pizza', N'a light and crispy base made from finely milled flour, water, yeast, and a touch of olive oil. Topped with flavorful tomato sauce, fresh mozzarella cheese, and a variety of toppings such as thinly sliced vegetables, savory meats, and aromatic herbs, it offers a delightful balance of texture and taste. Enjoy a satisfying crunch with every bite, complemented by the rich flavors of the toppings and a hint of smoky char from the oven.', CAST(199.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638444831808222714.jpg', 1, CAST(N'2024-02-20T14:47:49.170' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T18:40:11.630' AS DateTime), N'05de934b-ee78-41b0-bd47-460e504739db', N'500g (12 inch-radius)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'240d4c41-9ca9-45ca-8318-2003794841de', N'd111f77c-b4dc-4776-95a8-58ba59dce28d', N'f7951c90-9a51-4974-981b-e720d97faa26', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Caramel Macchiato', N'Our McCafe Caramel Macchiato recipe features rich, dark-roast espresso served with steamed whole milk, mixed with sweet caramel syrup. Available in small, medium, and large. There are 260 calories in a small Caramel Macchiato with whole milk from McDonald''s.', CAST(250.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444654587139392.jpg', 1, CAST(N'2024-02-20T14:53:54.353' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T13:44:22.357' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'1 cup', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'98c41584-b268-41d1-8659-319ab8a17575', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'e0b4858b-4b19-45e6-8a84-5a881775b316', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533', N'Tandoori Chicken Pav Bhaji', N'Infused with the smoky flavors of tandoori spices, this Pav Bhaji variation showcases marinated tandoori chicken pieces served alongside the spicy vegetable mash, creating a deliciously unique blend of Indian flavors.', CAST(230.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638444718806485709.jpg', 1, CAST(N'2024-02-20T21:56:49.670' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T15:31:21.453' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'250g bhaji, 2 pavs', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'eeeaa723-2b33-4958-be19-331f62a361ce', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'3610fb4c-09af-429d-aca3-6647970801ff', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'Black Coffie', N'Perfectly brewed for any time of the day.', CAST(199.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444666927121017.png', 1, CAST(N'2024-02-20T17:54:07.897' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T14:04:53.337' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'200ml', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'035354cb-5e83-4fc6-b745-3aa0e76f6695', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'23719e9b-1d26-4355-9ce6-0396866d61a1', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Cheesy Fries', N'Salted Fries, Smoky Chipotle Sauce', CAST(179.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444669995294735.jpg', 1, CAST(N'2024-02-23T20:44:16.030' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T11:58:53.110' AS DateTime), N'03add488-8eee-4bdb-848b-f5871aff3be6', N'150g', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'9fca2ba7-dc00-4b8f-8367-4b69cd2318d3', N'51b84cd3-7d8e-427c-a093-b5f7c07cd3c0', N'1740febf-1e09-4c15-8f6d-de9beedd702a', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899,f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,96948819-7f12-4a5b-82f1-b007efc6b159', N'McAloo Tikki Burger', N'Regular bun crown, Tom-Mayo sauce, Sliced tomatoes, Shredded onion, Aloo tikki patty, Regular bun heel', CAST(180.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638444660182733128.jpg', 1, CAST(N'2024-02-24T10:52:20.157' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-26T12:43:56.807' AS DateTime), N'03add488-8eee-4bdb-848b-f5871aff3be6', N'146 gm', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'88cd167f-a598-4213-af14-5b02356533f8', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'1d31fd7f-f626-464e-ba9c-511be41f4ac5', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533', N'Masala Chai', N'Masala chai is a smooth and spicy blend of natural tea extract, milk solids, black pepper, fennel, clove and cinnamon.', CAST(40.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444694438948414.png', 1, CAST(N'2024-02-20T15:04:11.013' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T14:50:44.667' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'Big Cup (150ml)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'30a9359d-425a-41de-8837-5c86d2b42d72', N'abc55fa5-5d2c-456d-848d-190d5f8efb19', N'1ae013b8-049a-45e8-96fe-7fd61615d769', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899,f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,96948819-7f12-4a5b-82f1-b007efc6b159', N'Classic Margherita', N'A timeless favorite, the Classic Margherita features a thin crust topped with tangy tomato sauce, creamy mozzarella cheese, and fresh basil leaves.', CAST(250.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638444728205608556.jpg', 1, CAST(N'2024-02-23T11:15:22.743' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T15:47:01.370' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'350g (10-inch radius)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'f8819154-5897-40f2-8e01-61966c8c2193', N'a8701ccb-51c8-4ce6-b80e-45cda50f36d1', N'1740febf-1e09-4c15-8f6d-de9beedd702a', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,dc46044f-e764-4a07-b065-8b085fd71533', N'McVeggie Burger', N'Quarter bun crown, Veg mayonnaise, Shredded lettuce, Vegetable patty, Quarter bun heel', CAST(299.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444663151536476.png', 1, CAST(N'2024-02-20T17:48:51.927' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T13:58:35.790' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'168g', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'ee037bb7-3e02-43fa-b56b-68e1b2432476', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'91d92aa8-0b04-403f-8116-b05dbcb6508c', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533,e166be98-ed02-4ded-9cec-17778d6d90ce,643bd02c-6e67-4f0d-91a1-2b9d4fc86899', N'Chicken Nuggets', N'white boneless chicken, coated in a seasoned batter for a crispy texture. The ingredients also include water, wheat flour, modified corn starch, salt, and various seasonings for flavor. They may contain vegetable oil for frying and preservatives to maintain freshness. Chicken McNuggets are a popular menu item known for their savory taste and convenient bite-sized form, often served with a variety of dipping sauces.', CAST(350.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444687885145243.jpg', 1, CAST(N'2024-02-19T11:58:44.440' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-26T11:39:39.427' AS DateTime), N'140e8efc-26d7-4282-8e5e-74658e44cf9b', N'500g', 0)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'22a9dd13-3bbf-44d2-85ab-7a6042b778ce', N'a8701ccb-51c8-4ce6-b80e-45cda50f36d1', N'23719e9b-1d26-4355-9ce6-0396866d61a1', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Super Burger', N'abcdef', CAST(199.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638440326214026312.jpg', 1, CAST(N'2024-02-20T13:30:23.463' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL, NULL, 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'b690ab83-9d55-4238-aeb2-7f657612706e', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'e0b4858b-4b19-45e6-8a84-5a881775b316', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533', N'Chicken Pav bhaji', N'Chicken, Potatoes, tomatoes, and peas form the hearty base of the bhaji, while onions and bell peppers add savory sweetness. Carrots and cauliflower provide texture and color, complemented by the earthy crunch of green beans. Garlic, ginger, and a blend of spices such as cumin, coriander, turmeric, chili powder, and garam masala infuse the dish with aromatic flavor. Butter adds richness, while fresh coriander leaves and lemon juice lend a refreshing finish. Served with buttered and toasted dinner rolls (pav), Pav Bhaji is a beloved Indian street food known for its spicy and satisfying taste.', CAST(150.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444713709578563.jpg', 1, CAST(N'2024-02-23T18:02:43.823' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T15:22:51.763' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'250g bhaji, 2 Pavs', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'3a365710-04b1-4eb4-8f4f-81e96d39ec61', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'1d31fd7f-f626-464e-ba9c-511be41f4ac5', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533', N'Masala Chai', N'Masala chai is a smooth and spicy blend of natural tea extract, milk solids, black pepper, fennel, clove and cinnamon.', CAST(20.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444695225009675.png', 1, CAST(N'2024-02-20T15:01:19.407' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T14:52:03.250' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'Small Cup (90ml)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'8eb55042-684f-455e-a50e-98ca12757c7f', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'3610fb4c-09af-429d-aca3-6647970801ff', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'Latte Coffie', N'a coffee drink made with espresso and steamed milk. It has a creamy texture and a mild, smooth flavor, with a layer of frothed milk on top. Lattes are often served in a glass or cup and can be customized with flavored syrups or topped with a sprinkle of cocoa powder or cinnamon.', CAST(180.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444707874784547.jpg', 1, CAST(N'2024-02-19T11:39:03.817' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T15:13:08.227' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N' 1 cup (200 ml)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'0cf3d010-4779-48b6-8f71-9cc64b617096', N'7feb158b-740b-44b8-9d6c-33c2526b55d1', N'8a147de2-a6fd-4649-a1a8-833e28d3e10c', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Bati Churma', N'Testy Bati Churma Without Ghee', CAST(235.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638445489720240547.png', 1, CAST(N'2024-02-26T12:56:15.633' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL, N'4 bati', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'6552ed4a-fb72-4d09-8d58-9f1407502fcf', N'e58598e0-c559-48ef-847f-97159294dc0b', N'ad0f17f5-14d0-4184-8743-d42915a652ef', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'delete', N'abc', CAST(190.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638442980445830986.jpg', 1, CAST(N'2024-02-23T15:14:05.250' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL, NULL, 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'ecaa78d7-e638-4eee-8f0c-a5b03e04363b', N'a8701ccb-51c8-4ce6-b80e-45cda50f36d1', N'1740febf-1e09-4c15-8f6d-de9beedd702a', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533', N'McAloo Tikki Burger', N'Regular bun crown, Tom-Mayo sauce, Sliced tomatoes, Shredded onion, Aloo tikki patty, Regular bun heel', CAST(90.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638444668213262077.png', 1, CAST(N'2024-02-23T21:18:42.370' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T14:07:01.960' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'168g', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'e38e095e-3397-4317-a596-ac6adea8292f', N'567cec1b-75e1-4108-8b84-a62e0ac2e4e2', N'ad0f17f5-14d0-4184-8743-d42915a652ef', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Tomato Soup', N'Delicious tomato soup served hot with a hint of spices.', CAST(80.00 AS Decimal(10, 2)), 1, NULL, N'~/Content/Images/MENU_638443973637510092.jpg', 1, CAST(N'2024-02-21T22:32:03.263' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T21:27:26.120' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'1 bowl (200ml)', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'720b6e03-26e0-4048-a52e-c7bbcbd24290', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'e0b4858b-4b19-45e6-8a84-5a881775b316', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Pav bhaji', N'Potatoes, tomatoes, and peas form the hearty base of the bhaji, while onions and bell peppers add savory sweetness. Carrots and cauliflower provide texture and color, complemented by the earthy crunch of green beans. Garlic, ginger, and a blend of spices such as cumin, coriander, turmeric, chili powder, and garam masala infuse the dish with aromatic flavor. Butter adds richness, while fresh coriander leaves and lemon juice lend a refreshing finish. Served with buttered and toasted dinner rolls (pav), Pav Bhaji is a beloved Indian street food known for its spicy and satisfying taste.', CAST(80.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638441306364124137.jpg', 1, CAST(N'2024-02-21T16:44:02.057' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-25T14:30:42.983' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'250g Bhaji, 2 Pavs', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'd61109ff-5765-4e4c-831e-cd6df047e462', N'a8701ccb-51c8-4ce6-b80e-45cda50f36d1', N'594f830e-c54d-4883-9452-51f13201a32f', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,643bd02c-6e67-4f0d-91a1-2b9d4fc86899,dc46044f-e764-4a07-b065-8b085fd71533', N'McChicken Burger', N'Quarter bun crown, Veg mayonnaise, Shredded lettuce, McChicken patty, Quarter bun heel', CAST(289.00 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638444700998185488.png', 1, CAST(N'2024-02-20T14:59:09.447' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-25T15:01:40.553' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'173g', 1)
INSERT [dbo].[MenuMaster] ([MenuItemIDP], [CategoryIDF], [SubCategoryIDF], [CompanyIDF], [SiteIDF], [ItemName], [Description], [Price], [IsProductOfDay], [Seasonal], [ItemImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy], [QuantitySpecification], [IsVeg]) VALUES (N'ddad48aa-e228-463d-a4bf-d9211388615c', N'926a9523-c69c-4168-9500-8ebbe8203633', N'0904474d-d6c3-4111-94e6-7313341e555c', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Margherita Pizza', N'Classic Italian pizza topped with tomato sauce, mozzarella cheese, fresh basil leaves, and a drizzle of olive oil. A simple yet delicious combination that captures the essence of Italian cuisine. Quantity: 1 large pizza (12 inches).', CAST(199.99 AS Decimal(10, 2)), 0, NULL, N'~/Content/Images/MENU_638443975997714449.jpg', 1, CAST(N'2024-02-21T22:24:33.987' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T18:53:22.663' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, 1)
GO
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'b4a724e2-2b3d-4a1b-ade6-0affafbf8205', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'asgdhv', CAST(23.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-16T16:32:05.093' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'e2e61742-8690-4f2b-b802-1b7443d4d1d7', N'00000000-0000-0000-0000-000000000000', NULL, N'ehgdfsyjkm', CAST(23.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-16T16:29:20.960' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'43716b47-98dd-493a-8d55-23096dbb77ff', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'sdjfnifkdlnv', CAST(34.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-19T18:46:26.003' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'de81ae8a-11fd-4768-975b-2388270d497c', N'00000000-0000-0000-0000-000000000000', NULL, N'Check modifier two', CAST(56.89 AS Decimal(10, 2)), 0, CAST(N'2024-02-22T07:06:50.113' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-22T07:07:00.957' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'7b46579b-f97a-40f3-87b6-25d2f4d33891', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'jsdbjgzfx', CAST(45.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-16T16:47:16.627' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'6c8cb342-233c-48dc-a5a3-493782957c8c', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'hejdszsdbnfm', CAST(26.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-16T16:32:55.247' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-16T16:33:03.600' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'620941d8-fe35-469f-b352-50211efc89be', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'fguj', CAST(34.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-20T12:40:45.643' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', NULL, NULL)
INSERT [dbo].[ModifierMaster] ([ModifierIDP], [CompanyIDF], [SiteIDF], [ModifierName], [Price], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'27ee04a9-60e9-45bd-aeb6-df3002c35f58', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, N'abcd', CAST(35.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-16T17:06:03.887' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
GO
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'1a3b9879-45b3-4466-980a-034d899295bc', CAST(N'2024-02-20T18:41:11.810' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'f736ca99-6393-4aea-ac82-1335f53fa33c', CAST(N'2024-02-20T18:42:28.623' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'4eedc1a7-fb35-4389-8525-2f40d0f32efa', CAST(N'2024-02-16T15:19:47.867' AS DateTime), N'AspNetUsers_Update', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'0062e78c-4e17-4bbb-9fc1-3c7303321d89', CAST(N'2024-02-20T18:17:14.310' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'fc95b4e6-8530-439d-baa9-3d2df7bf9778', CAST(N'2024-02-15T13:32:47.017' AS DateTime), N'SitesMaster_GetSiteByID', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'e48c255e-1628-433f-a8c0-3f4a2bc1c7d3', CAST(N'2024-02-20T18:17:56.197' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'e0ca90bd-6f24-4957-950d-40b89ddc9e94', CAST(N'2024-02-20T17:54:15.203' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'aa3042fb-5c5a-4270-b3e2-446a47a8f307', CAST(N'2024-02-20T18:35:13.233' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'dce6524e-3ad7-4947-b61b-46c64b427a42', CAST(N'2024-02-15T13:31:12.710' AS DateTime), N'SitesMaster_GetSiteByID', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'04813dce-85a2-4aaf-bdcc-4b04ca37ebb8', CAST(N'2024-02-16T15:23:09.693' AS DateTime), N'AspNetUsers_Update', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'2ca7d3b6-0c69-41ae-ab7f-4ce64ec1b7df', CAST(N'2024-02-16T15:21:00.763' AS DateTime), N'AspNetUsers_Update', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'5b272555-ef88-4f4b-babd-5502263318d3', CAST(N'2024-02-20T18:40:55.160' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'a9e96eee-ae45-47c0-852d-562fd05289b1', CAST(N'2024-02-20T17:50:35.580' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'c8065057-6f0c-42e4-a5ec-67d2615cbff1', CAST(N'2024-02-20T18:58:53.370' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'dd77f8c6-3cd7-421a-8912-6c46448f8aea', CAST(N'2024-02-20T17:48:54.523' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'f8bfcc10-4c4f-4475-9a90-7671af50b9a4', CAST(N'2024-02-20T19:02:18.500' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'6ac5197e-6205-42c2-be37-835451886b85', CAST(N'2024-02-20T19:04:47.810' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'dfd5e019-a85b-4d4e-b783-8e09fe833632', CAST(N'2024-02-20T18:16:31.580' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'd2b54afa-67d7-41d9-973b-93447721d724', CAST(N'2024-02-20T18:49:38.000' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'4f438e2b-c869-4deb-8095-9a8781596a12', CAST(N'2024-02-15T13:30:30.910' AS DateTime), N'SitesMaster_GetSiteByID', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'64ea1216-96fe-4f7a-9b44-9b9351b0e6d1', CAST(N'2024-02-20T18:18:43.840' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'0b1165eb-c457-4235-9532-9ebaebdd4e73', CAST(N'2024-02-20T18:20:42.347' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'13197360-827d-4539-8434-adbe7ff6b1bb', CAST(N'2024-02-20T20:20:06.257' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'ee34bfe9-e251-4086-a4b3-bb8d98db0cc7', CAST(N'2024-02-20T18:29:41.663' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'063896f2-99ad-47c3-96b4-c410ce219093', CAST(N'2024-02-15T13:32:02.763' AS DateTime), N'SitesMaster_GetSiteByID', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'be0c10a8-e468-469e-a0fd-c4461f86bb1e', CAST(N'2024-02-20T18:51:05.553' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'3ee1e523-4ee7-4d3c-b12b-c7f679cfe2cf', CAST(N'2024-02-20T20:22:43.643' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'336f955c-dfa9-4c8c-b56a-d8ee45af74fa', CAST(N'2024-02-20T18:27:24.110' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'8ea5a583-5c2f-4fe0-a7a3-dbdd41c8ac0d', CAST(N'2024-02-20T18:19:47.210' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'0147249d-05fc-4464-b276-eee967562b5e', CAST(N'2024-02-20T18:53:20.350' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
INSERT [dbo].[ProcErrorLog] ([ExceptionID], [EntryDateTime], [ProcedureName], [ErrorMessage]) VALUES (N'e310b90b-7b18-4b4e-98f6-fa3852121f73', CAST(N'2024-02-20T18:32:23.037' AS DateTime), N'MenuMaster_GetAll', N'Conversion failed when converting from a character string to uniqueidentifier.')
GO
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'a9edc852-e2a5-4678-986c-03624ed86e70', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat7', CAST(N'2024-02-19T12:06:20.967' AS DateTime), CAST(N'2024-02-19T12:06:20.967' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.967' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'a4ac0b11-18ef-46cf-80ca-04188fe68286', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-1', CAST(N'2024-02-26T12:33:51.513' AS DateTime), CAST(N'2024-02-26T12:33:51.513' AS DateTime), N'Indoor', N'Table', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445476310946457.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'807f2543-ca17-499c-9651-0aec32b5eafc', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'B2', CAST(N'2024-02-22T17:52:17.320' AS DateTime), CAST(N'2024-02-22T17:52:17.320' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442211370387683.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'a1300954-150f-4dba-8745-115cbd277b95', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-51', CAST(N'2024-02-26T13:36:13.003' AS DateTime), CAST(N'2024-02-26T13:36:13.003' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445513726493229.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'e78f1038-2916-45c2-86f4-1658b3089f33', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'2', CAST(N'2024-02-22T16:58:54.380' AS DateTime), CAST(N'2024-02-22T16:58:54.380' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442179338370337.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'4c37f56e-9c80-4672-a09b-1b393ce8bcf1', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'aaaaaaaa', CAST(N'2024-02-22T17:26:38.250' AS DateTime), CAST(N'2024-02-22T17:26:38.250' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195977469357.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'36ba0b3b-5baf-4f0a-bef6-1f5521470cec', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A1', CAST(N'2024-02-22T16:58:53.620' AS DateTime), CAST(N'2024-02-22T16:58:53.620' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442179330799442.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'243a4411-807a-4045-b49a-282e741b0003', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'B4', CAST(N'2024-02-22T17:53:58.180' AS DateTime), CAST(N'2024-02-22T17:53:58.180' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442212379000935.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'3529847d-0dcb-4d1a-84b7-32cf5fe95ee9', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A3', CAST(N'2024-02-22T17:53:57.750' AS DateTime), CAST(N'2024-02-22T17:53:57.750' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442212374710662.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'dec4e5d9-fdb1-4f99-a8ec-363f2233eb66', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A1', CAST(N'2024-02-22T17:26:36.470' AS DateTime), CAST(N'2024-02-22T17:26:36.470' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195959674601.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'2851cbef-9c78-451d-9824-3f8bdf0c4190', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A1BC', CAST(N'2024-02-22T17:18:12.650' AS DateTime), CAST(N'2024-02-22T17:18:12.650' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442190920323367.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'e26900b4-659b-4470-98f9-428887269004', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'B', CAST(N'2024-02-22T16:58:54.000' AS DateTime), CAST(N'2024-02-22T16:58:54.000' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442179334592051.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'fa1d05c2-11fd-4cab-974f-45eb4089e8b1', N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A5', CAST(N'2024-02-26T13:38:11.847' AS DateTime), CAST(N'2024-02-26T13:38:11.847' AS DateTime), N'Indoor', N'Seat', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514914947973.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'ffe70f8a-6da0-400e-b786-4bf2670863f2', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A1', CAST(N'2024-02-22T17:52:16.933' AS DateTime), CAST(N'2024-02-22T17:52:16.933' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442211366515081.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'cc1b76de-c5b3-45c5-b234-677d734b70ae', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-5', CAST(N'2024-02-26T13:12:05.940' AS DateTime), CAST(N'2024-02-26T13:12:05.940' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445499255565757.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'7c07cc2f-b60e-4455-b21a-7284c0532f83', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'C', CAST(N'2024-02-22T17:26:37.893' AS DateTime), CAST(N'2024-02-22T17:26:37.893' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195973908501.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'7a70a318-cd22-45ab-ae5b-729fb3d7e149', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-2', CAST(N'2024-02-26T13:12:04.707' AS DateTime), CAST(N'2024-02-26T13:12:04.707' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445499243217181.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'd047bb18-f465-4484-8522-780ea83897ff', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A1B2V3', CAST(N'2024-02-22T17:51:25.767' AS DateTime), CAST(N'2024-02-22T17:51:25.767' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442210854815351.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'ed2a1386-fcb8-47b2-b41a-7a46d7eabdca', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A1', CAST(N'2024-02-26T12:27:00.087' AS DateTime), CAST(N'2024-02-26T12:27:00.087' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445472196513102.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'42650f03-61f1-44f1-88d1-7f66a661c4f5', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'aaaaaa', CAST(N'2024-02-22T17:26:37.550' AS DateTime), CAST(N'2024-02-22T17:26:37.550' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195970458964.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'dc7c112c-a5d9-45b0-96fa-8772074e15f2', N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A2', CAST(N'2024-02-26T13:38:10.653' AS DateTime), CAST(N'2024-02-26T13:38:10.653' AS DateTime), N'Indoor', N'Seat', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514902871703.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'350eaf34-9df3-480a-bc6e-8c685834983b', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-52', CAST(N'2024-02-26T13:37:50.703' AS DateTime), CAST(N'2024-02-26T13:37:50.703' AS DateTime), N'Indoor', N'Table', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514703516168.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'32db7a63-6c17-4bdd-b2fe-8fbba1f1d4b1', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat4', CAST(N'2024-02-19T12:06:20.953' AS DateTime), CAST(N'2024-02-19T12:06:20.953' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.953' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'e2919b0d-601e-4337-bf0e-9b206577d186', N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A3', CAST(N'2024-02-26T13:38:11.070' AS DateTime), CAST(N'2024-02-26T13:38:11.070' AS DateTime), N'Indoor', N'Seat', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514907191112.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'0b44e2fa-55a1-45b6-aba9-a229442da37f', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A1', CAST(N'2024-02-26T12:27:53.870' AS DateTime), CAST(N'2024-02-26T12:27:53.870' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445472734379127.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'89cf5a24-a71a-4686-a392-a825b4756a20', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'2', CAST(N'2024-02-22T16:58:55.190' AS DateTime), CAST(N'2024-02-22T16:58:55.190' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442179346481262.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'fa3c85be-06fd-4f04-bdb4-a930d7d84eb4', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'B', CAST(N'2024-02-22T17:26:37.173' AS DateTime), CAST(N'2024-02-22T17:26:37.173' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195966684399.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'f7ec370a-7fc1-4dd1-a981-adeea7005a71', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat8', CAST(N'2024-02-19T12:06:20.980' AS DateTime), CAST(N'2024-02-19T12:06:20.980' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.980' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'3ea5a8b3-bc2e-4e81-8534-b072fb3b496e', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'C3', CAST(N'2024-02-22T17:52:17.727' AS DateTime), CAST(N'2024-02-22T17:52:17.727' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442211374455414.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'06f3bb20-a08a-48e0-8ccb-b29de81667f8', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-4', CAST(N'2024-02-26T13:12:05.520' AS DateTime), CAST(N'2024-02-26T13:12:05.520' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445499251382307.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'ecfcea5a-eab3-44a8-8acd-b2e1130ec1e4', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat10', CAST(N'2024-02-19T12:06:20.997' AS DateTime), CAST(N'2024-02-19T12:06:20.997' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.997' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'851b11e3-ebe6-46c9-b190-b3bf3681a186', N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A1', CAST(N'2024-02-26T13:38:10.257' AS DateTime), CAST(N'2024-02-26T13:38:10.257' AS DateTime), N'Indoor', N'Seat', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514898906177.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'd084962d-a675-4e5d-9372-b5ce8284863b', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat5', CAST(N'2024-02-19T12:06:20.957' AS DateTime), CAST(N'2024-02-19T12:06:20.957' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.957' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'80b32a6e-51df-40e3-9fbf-bef523e24a49', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A2', CAST(N'2024-02-22T17:26:36.823' AS DateTime), CAST(N'2024-02-22T17:26:36.823' AS DateTime), N'Outdoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442195963196845.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'b68fb4f4-da8a-4898-b1e4-c2e2d12a1154', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'C', CAST(N'2024-02-22T16:58:54.810' AS DateTime), CAST(N'2024-02-22T16:58:54.810' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442179342714606.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'2e70809c-7931-48d9-914c-c6179e0bb241', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat6', CAST(N'2024-02-19T12:06:20.957' AS DateTime), CAST(N'2024-02-19T12:06:20.957' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.957' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'779e793e-5a7e-47dd-acd0-c63add74cb78', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A2', CAST(N'2024-02-22T17:53:57.397' AS DateTime), CAST(N'2024-02-22T17:53:57.397' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442212371166213.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'1a5adb82-4628-4f24-897e-cbb46acb6752', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-1', CAST(N'2024-02-26T13:11:58.050' AS DateTime), CAST(N'2024-02-26T13:11:58.050' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445499156499056.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'1b58e6ad-3d5b-4794-a89e-d4eb42d9ba68', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat3', CAST(N'2024-02-19T12:06:20.947' AS DateTime), CAST(N'2024-02-19T12:06:20.947' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.947' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'01719139-d2b4-4537-aba0-dbcffe3c7250', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat2', CAST(N'2024-02-19T12:06:20.943' AS DateTime), CAST(N'2024-02-19T12:06:20.943' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.943' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'75f4263b-f682-4e3b-9c2f-ded45bf72806', N'1dde1831-685d-4a07-813f-2742a2ce4c05', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'a1', CAST(N'2024-02-22T15:49:49.533' AS DateTime), CAST(N'2024-02-22T15:49:49.533' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442137889276185.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'176df3e3-929d-4a37-bf85-e3e1d1d63e18', N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Seat9', CAST(N'2024-02-19T12:06:20.990' AS DateTime), CAST(N'2024-02-19T12:06:20.990' AS DateTime), N'Indoor', N'Seat', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-19T12:06:20.990' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', N'~/Content/Images/QR/1065_QRCode.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'87dc5e50-4b1b-43f0-96a3-e717ad3afcf5', N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'A1', CAST(N'2024-02-22T17:53:57.043' AS DateTime), CAST(N'2024-02-22T17:53:57.043' AS DateTime), N'Indoor', N'Seat', 1, N'00000000-0000-0000-0000-000000000000', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638442212367623724.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'161bb2c7-f1bf-4bbb-9581-f5d237f33c3d', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'Table-3', CAST(N'2024-02-26T13:12:05.087' AS DateTime), CAST(N'2024-02-26T13:12:05.087' AS DateTime), N'Indoor', N'Table', 1, N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445499246981479.png')
INSERT [dbo].[SeatMappingMaster] ([SeatIDP], [SiteIDF], [CompanyIDF], [SeatNumber], [CreationDate], [ModificationDate], [Location], [Seattype], [isActive], [CreatedBy], [UpdationDate], [UpdatedBy], [QRCode]) VALUES (N'c121696d-d6da-401f-baac-ff4fa2140cfb', N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'A4', CAST(N'2024-02-26T13:38:11.490' AS DateTime), CAST(N'2024-02-26T13:38:11.490' AS DateTime), N'Indoor', N'Seat', 1, N'05de934b-ee78-41b0-bd47-460e504739db', NULL, N'00000000-0000-0000-0000-000000000000', N'~/Content/Images/QR/QR_638445514911388299.png')
GO
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'380c4c1a-89c5-499b-93b4-06051d473498', N'81bc939b-4e23-4edf-a597-682973db6ab1', 101, 1636, 16562, N'360005', N'TRBR  - Mota Mava', N'Rajkot Rd, Mota Mava, Rajkot, Gujarat 360005', N'1111111111', N't@t.com', 1, CAST(N'2024-02-22T12:18:32.587' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:29:37.227' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'e166be98-ed02-4ded-9cec-17778d6d90ce', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1646, 18315, N'411014', N'Mcd Pune', N'Mcd Pune , Kharadi,Nyati Plaza', N'1212112211', N'Mcd_Pune@mcd.com', 1, CAST(N'2024-02-15T16:48:13.717' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-24T12:04:11.467' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1dde1831-685d-4a07-813f-2742a2ce4c05', N'81bc939b-4e23-4edf-a597-682973db6ab1', 101, 1636, 16562, N'360002', N'TRBR - Umiya (Gondal Road)', N'abc, dfe', N'7777777777', N'umiya@gmail.com', 1, CAST(N'2024-02-15T12:52:21.917' AS DateTime), N'ab49f82a-269f-4e61-9aca-171a749b2a8f', CAST(N'2024-02-24T13:28:49.043' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1646, 18278, N'400099', N'McD Mumbai', N'McD Mumbai , Airport T1 Departure', N'9876543210', N'McD_Mumbai@gmail.com', 1, CAST(N'2024-02-22T10:47:00.720' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-24T12:01:38.830' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', 101, 1636, 16334, N'380002', N'Head Office', N'SP Ringroad, Ahmedabad', N'6700067000', N'vikramsinghania@gmail.com', 1, CAST(N'2024-02-16T12:50:16.353' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:20:24.290' AS DateTime), NULL)
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f41fc129-a275-4802-8571-5901470a288b', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1636, 16334, N'382418', N'McD Ahmedabad', N'McD Ahmedabad ,Vastral, Orinda Arcade', N'9999999999', N'McD_Ahmedabad@ricebowl.com', 1, CAST(N'2024-02-14T16:23:23.863' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-24T13:17:54.460' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'8a618792-fad2-4783-8abd-59fea8ef02b8', N'f8436d66-20e2-4943-ae74-0e5018512212', 101, 1636, 16562, N'360001', N'Head Office', N'Dr Yagnik Road The Imperial Palace, Lounge Level, Rajkot 360001 India', N'2222222222', N'arjunmehra@gmail.com', 1, CAST(N'2024-02-16T17:26:55.650' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T11:15:27.230' AS DateTime), NULL)
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'd1fe709c-4b61-4a44-aa48-6e35459308ef', N'f8436d66-20e2-4943-ae74-0e5018512212', 101, 1646, 18315, N'411001', N'befoodie - Siddharth Chambers', N'GVPW+VRH Siddharth Chambers, Lane, off North Main Road, Koregaon Park, Pune, Maharashtra 411001', N'1212112212', N'hq@viraj.com', 1, CAST(N'2024-02-16T17:36:13.310' AS DateTime), N'31e78ca3-7708-43ac-b576-0aa1de1f9f80', CAST(N'2024-02-24T13:18:19.147' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'deae5355-e9d9-4b99-a3f9-7bee6a000890', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1636, 16456, N'361001', N'McD Jamnagar', N'Hardcastle Restaurants Pvt Ltd, McDonalds Family Restaurants Reliance Mall, Nana Mava', N'9175254433', N'McD_Jamnagar@gmail.com', 1, CAST(N'2024-02-25T16:45:03.530' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1636, 16334, N'380001', N'Head Office', N'assssdsfs', N'8928304199', N'chris@mcdonald.com', 1, CAST(N'2024-02-14T10:53:46.793' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:49:40.140' AS DateTime), NULL)
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'dc46044f-e764-4a07-b065-8b085fd71533', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1660, 20011, N'500006', N'McD Hyderabad', N'McD Hyderabad , RGIA, International Departures', N'1111111111', N'McD_Hyderabad@mcdonal.com', 1, CAST(N'2024-02-19T11:33:47.360' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T12:03:25.067' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'96948819-7f12-4a5b-82f1-b007efc6b159', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1636, 16562, N'360002', N'McD Rajkot', N'McD Rajkot ,Ayodhya Chowkdy , West Gate 2', N'1212122212', N'McD_Rajkot@mcdonald.com', 1, CAST(N'2024-02-14T14:38:07.053' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-24T13:19:43.587' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', 101, 1636, 16562, N'360001', N'Taste of Home (Kalawad main road)', N'Kalawad main road, rajkot', N'7777777777', N'tasteofhome@gmail.com', 1, CAST(N'2024-02-16T12:54:45.660' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:21:16.770' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'157e00a8-3198-48c9-b68f-d68acf90c549', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', 101, 1641, 17237, N'560100', N'McD Bangalore', N'McD Bangalore , Bommasandra ,SBR Lucky mall', N'1212212212', N'McD_Bangalore@gmail.com', 1, CAST(N'2024-02-15T16:38:33.510' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T13:13:16.037' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SitesMaster] ([SiteIDP], [CompanyIDF], [CountryIDF], [StateIDF], [CityIDF], [SitePinCode], [SiteName], [SiteAddress], [SiteContactNumber], [SiteContactEmail], [IsActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3b36870a-7783-4d53-8035-e8203128f3b5', N'81bc939b-4e23-4edf-a597-682973db6ab1', 101, 1636, 16562, N'360002', N'Head Office', N'New 150 Fit Ringroad, rajkot', N'9808088888', N'rajeshpatel@gmail.com', 1, CAST(N'2024-02-15T12:42:20.527' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T11:39:40.367' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[StateMaster] ON 

INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1625, N'Andaman and Nicobar Islands', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1626, N'Andhra Pradesh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1627, N'Arunachal Pradesh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1628, N'Assam', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1629, N'Bihar', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1630, N'Chandigarh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1631, N'Chhattisgarh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1632, N'Dadra and Nagar Haveli', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1633, N'Daman and Diu', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1634, N'Delhi', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1635, N'Goa', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1636, N'Gujarat', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1637, N'Haryana', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1638, N'Himachal Pradesh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1639, N'Jammu and Kashmir', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1640, N'Jharkhand', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1641, N'Karnataka', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1642, N'Kenmore', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1643, N'Kerala', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1644, N'Lakshadweep', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1645, N'Madhya Pradesh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1646, N'Maharashtra', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1647, N'Manipur', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1648, N'Meghalaya', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1649, N'Mizoram', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1650, N'Nagaland', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1651, N'Narora', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1652, N'Natwar', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1653, N'Odisha', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1654, N'Paschim Medinipur', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1655, N'Pondicherry', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1656, N'Punjab', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1657, N'Rajasthan', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1658, N'Sikkim', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1659, N'Tamil Nadu', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1660, N'Telangana', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1661, N'Tripura', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1662, N'Uttar Pradesh', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1663, N'Uttarakhand', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1664, N'Vaishali', 101)
INSERT [dbo].[StateMaster] ([StateIDP], [StateName], [CountryIDF]) VALUES (1665, N'West Bengal', 101)
SET IDENTITY_INSERT [dbo].[StateMaster] OFF
GO
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'23719e9b-1d26-4355-9ce6-0396866d61a1', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'French Fries', N'~/Content/Images/SCAT_638444101378104619.jpg', 1, CAST(N'2024-02-20T17:51:54.530' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T22:22:18.010' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'42428bfb-3dd9-4675-a4fc-0b1a450f23b2', N'386ae14c-69db-484b-a8fc-d4fe544faea3', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6CB14B37-9CD4-457C-B4A5-86083C17E156', N'aaaa', N'~/Content/Images/SCAT_638435255267529350.jpg', 1, CAST(N'2024-02-14T16:38:47.580' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-14T16:39:16.690' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'19113953-8f34-4aa3-9b4d-127103d92e51', N'1e97c05c-8243-4fe6-8dad-d4325810168e', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Coldrinks', N'~/Content/Images/SCAT_638443959332239686.jpg', 1, CAST(N'2024-02-24T18:25:33.730' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'bb5b04d3-caf4-435b-8720-16402368def0', N'95e5a565-6804-4c79-a01c-4c93bad32516', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7F12-4A5B-82F1-B007EFC6B159', N'Italiansajbxfc', N'~/Content/Images/SCAT_638435278997622598.jpeg', 1, CAST(N'2024-02-14T17:18:21.493' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-14T17:33:47.297' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'5b5aa769-b27d-4aff-98e6-2ec23000db53', N'7feb158b-740b-44b8-9d6c-33c2526b55d1', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8,9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Dalbati with Ghee', N'~/Content/Images/SCAT_638445486591220104.png', 1, CAST(N'2024-02-26T12:51:02.727' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'33f9e6cb-ae86-4b3c-bea2-31c6787389c4', N'95e5a565-6804-4c79-a01c-4c93bad32516', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'00000000-0000-0000-0000-000000000000', N'NEw pizzaaaaaaaaaaaaaaaaa', N'~/Content/Images/SCAT_638435282949714572.jpeg', 1, CAST(N'2024-02-14T17:24:57.567' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-14T18:19:08.280' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1d31fd7f-f626-464e-ba9c-511be41f4ac5', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159,157e00a8-3198-48c9-b68f-d68acf90c549', N'Chai', N'~/Content/Images/SCAT_638444692819502143.png', 1, CAST(N'2024-02-25T14:48:02.790' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'594f830e-c54d-4883-9452-51f13201a32f', N'51b84cd3-7d8e-427c-a093-b5f7c07cd3c0', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'643bd02c-6e67-4f0d-91a1-2b9d4fc86899,dc46044f-e764-4a07-b065-8b085fd71533,157e00a8-3198-48c9-b68f-d68acf90c549', N'Non Veg Burger', N'~/Content/Images/SCAT_638444697982627585.jpg', 1, CAST(N'2024-02-25T14:56:38.997' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T12:03:37.713' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'e0b4858b-4b19-45e6-8a84-5a881775b316', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'f41fc129-a275-4802-8571-5901470a288b,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Pav bhaji', N'~/Content/Images/SCAT_638444679716209910.jpg', 1, CAST(N'2024-02-25T14:26:12.307' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'890f08de-f2cf-404c-b28c-5d7bb0fbe832', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'Crunchy Pizza', N'~/Content/Images/SCAT_638436170353805679.png', 1, CAST(N'2024-02-15T18:03:57.140' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-26T12:04:28.177' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3610fb4c-09af-429d-aca3-6647970801ff', N'1d09cf24-a735-4b20-a865-0e3acbb56d23', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'96948819-7f12-4a5b-82f1-b007efc6b159', N'Hot Coffie', N'~/Content/Images/SCAT_638444110332689263.jpg', 1, CAST(N'2024-02-20T12:12:28.407' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-24T22:37:13.523' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a7ed9cd4-b7a2-4ac7-a855-6e96d363a4ab', N'b84ce96c-a80c-4343-968a-06dee05bf121', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Fry Papad', N'~/Content/Images/SCAT_638445487500602740.jpg', 1, CAST(N'2024-02-26T12:52:33.660' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'0904474d-d6c3-4111-94e6-7313341e555c', N'926a9523-c69c-4168-9500-8ebbe8203633', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Pizza', N'~/Content/Images/SCAT_638443955495400183.jpg', 1, CAST(N'2024-02-24T18:19:09.907' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'67d776a9-5cab-498d-9643-75afd95b2bc7', N'972d0faf-c1ef-48b3-8f4b-5bfdd55bcac5', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'00000000-0000-0000-0000-000000000000', N'New', N'~/Content/Images/SCAT_638435187195190306.jpg', 1, CAST(N'2024-02-14T14:45:21.420' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1ae013b8-049a-45e8-96fe-7fd61615d769', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,643bd02c-6e67-4f0d-91a1-2b9d4fc86899,f41fc129-a275-4802-8571-5901470a288b,6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Cheese Pizza', N'~/Content/Images/SCAT_638444726406197307.jpg', 1, CAST(N'2024-02-25T15:44:01.420' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T12:03:08.950' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'8a147de2-a6fd-4649-a1a8-833e28d3e10c', N'7feb158b-740b-44b8-9d6c-33c2526b55d1', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8', N'Dalbati Without Ghee', N'~/Content/Images/SCAT_638445486909713985.png', 1, CAST(N'2024-02-26T12:51:34.573' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'cec610c6-0633-408f-8eeb-abb128767e7c', N'e58598e0-c559-48ef-847f-97159294dc0b', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Sweets', N'~/Content/Images/SCAT_638443957836914844.jpg', 1, CAST(N'2024-02-24T18:23:04.410' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'880a083e-ae87-413c-872b-ac87544098cd', N'567cec1b-75e1-4108-8b84-a62e0ac2e4e2', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Papad', N'~/Content/Images/SCAT_638443954015690975.jpg', 1, CAST(N'2024-02-15T17:45:26.970' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', CAST(N'2024-02-24T18:16:41.873' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'91d92aa8-0b04-403f-8116-b05dbcb6508c', N'3da9ca50-fe1a-4ea4-bc53-b6bdb7fa20ef', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'Nuggets', N'~/Content/Images/SCAT_638444109123485462.jpg', 1, CAST(N'2024-02-20T12:18:15.643' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-24T22:35:12.693' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'7d1ae91c-6fc2-4e52-91a8-b31b4419eca0', N'2745d572-de84-41b7-9ad7-6f1dcd408c4a', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'E166BE98-ED02-4DED-9CEC-17778D6D90CE', N'aaaaa', N'~/Content/Images/SCAT_638436125851693114.jpeg', 1, CAST(N'2024-02-15T16:49:47.180' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1ccffa1c-3654-49a1-a0ec-b5dec8d58aec', N'e7d16907-45d4-4912-908e-45dd9cff138e', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'00000000-0000-0000-0000-000000000000', N'Crunchy Pizza', N'~/Content/Images/SCAT_638435260069324129.png', 1, CAST(N'2024-02-14T16:46:47.780' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'9c81c8fa-b93f-476a-a0b4-bb006529d09b', N'926a9523-c69c-4168-9500-8ebbe8203633', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'South Indian', N'~/Content/Images/SCAT_638443956656559425.jpg', 1, CAST(N'2024-02-24T18:21:05.990' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'fecdaac7-8cae-47df-b6c5-bdd74fcc92cd', N'6c46cf25-1daa-4a16-9296-a8937e71f02d', N'5a990481-bf8b-4be3-bf5c-0dbcdc105719', N'F1B53DC5-846B-4155-A207-A6E573C4736F', N'neew test', N'~/Content/Images/SCAT_638435265858138965.jpeg', 1, CAST(N'2024-02-14T16:56:27.577' AS DateTime), N'23302c8f-bc36-4a79-8a30-8f33a9536d22', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f173c288-69b9-485e-ad9c-c1a6e97774c5', N'95e5a565-6804-4c79-a01c-4c93bad32516', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'00000000-0000-0000-0000-000000000000', N'mexican new', N'~/Content/Images/SCAT_638435280971612546.jpeg', 1, CAST(N'2024-02-14T17:21:38.890' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4', CAST(N'2024-02-14T17:22:34.527' AS DateTime), N'8a211dc0-ad23-4b80-8bb5-f613efb446b4')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'17ea1977-23f0-4a9a-a2f3-d355f575cac6', N'6609d3a0-7fbe-4552-bb3b-8b17b795b788', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'00000000-0000-0000-0000-000000000000', N'aaaa', N'~/Content/Images/SCAT_638435195118068961.jpg', 1, CAST(N'2024-02-14T14:58:33.703' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'ad0f17f5-14d0-4184-8743-d42915a652ef', N'567cec1b-75e1-4108-8b84-a62e0ac2e4e2', N'81bc939b-4e23-4edf-a597-682973db6ab1', N'1dde1831-685d-4a07-813f-2742a2ce4c05,3b36870a-7783-4d53-8035-e8203128f3b5', N'Soups', N'~/Content/Images/SCAT_638443952004688975.jpg', 1, CAST(N'2024-02-15T17:45:56.950' AS DateTime), N'e0427a63-dfb5-410b-b3bc-f5bfa9114ace', CAST(N'2024-02-24T18:13:20.773' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'8e645537-420f-434c-95c5-d47d777a633c', N'd14e2a90-8c5c-43c1-90cf-0746dfff7015', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8,9412a921-3afb-4db7-a74b-431eb3b5e00c', N'French Lime soda', N'~/Content/Images/SCAT_638445485124926519.png', 1, CAST(N'2024-02-26T12:48:36.097' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'992ce98d-6eb0-4b50-b3c0-de1a9d5de87b', N'b84ce96c-a80c-4343-968a-06dee05bf121', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8,9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Green Salad', N'~/Content/Images/SCAT_638445487215921874.png', 1, CAST(N'2024-02-26T12:52:05.197' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1740febf-1e09-4c15-8f6d-de9beedd702a', N'51b84cd3-7d8e-427c-a093-b5f7c07cd3c0', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'e166be98-ed02-4ded-9cec-17778d6d90ce,6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Veg Burger', N'~/Content/Images/SCAT_638436938505178662.png', 1, CAST(N'2024-02-16T15:24:10.783' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-26T12:04:02.773' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'1f33ba13-768a-4baa-8dbe-e475c6cb978c', N'9f74f3bc-b7ed-4959-862c-b6d7d0bc4430', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'deae5355-e9d9-4b99-a3f9-7bee6a000890,6cb14b37-9cd4-457c-b4a5-86083c17e156,96948819-7f12-4a5b-82f1-b007efc6b159', N'Dhosa', N'~/Content/Images/SCAT_638444651599785588.jpg', 1, CAST(N'2024-02-14T16:40:50.387' AS DateTime), N'00ade20b-b3ef-483b-93d5-c44bf2ce344c', CAST(N'2024-02-26T13:29:11.060' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'f7951c90-9a51-4974-981b-e720d97faa26', N'd111f77c-b4dc-4776-95a8-58ba59dce28d', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156', N'Hot Coffees', N'~/Content/Images/SCAT_638444099847639194.jpg', 1, CAST(N'2024-02-24T11:45:04.417' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9', CAST(N'2024-02-24T22:19:44.957' AS DateTime), N'a35ca135-4c38-42a2-8aec-da4d4746aad9')
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'913d4bc2-b3bb-4389-bf0c-edc835510c8a', N'6f125ffb-c67c-4324-8dd6-cfeb5ec32b3e', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Butter Milk', N'~/Content/Images/SCAT_638445486101365464.jpg', 1, CAST(N'2024-02-26T12:50:13.740' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'3038980d-3cec-4558-b182-f87fe6784778', N'4d064a95-4614-422b-b790-3d517cf44995', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8,9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Pineapple Raita', N'~/Content/Images/SCAT_638445488191465019.jpg', 1, CAST(N'2024-02-26T12:53:43.087' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
INSERT [dbo].[SubCategoryMaster] ([SubCategoryIDP], [CategoryIDF], [CompanyIDF], [SiteIDF], [SubCategoryName], [SubCategoryImagePath], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'fbe7fe0f-3446-4107-86fd-feb98c820137', N'5f4f1d49-faa4-439f-96bd-b165b154f221', N'193b37f8-c7f4-4531-90d2-3de1c661e8e2', N'8caf47de-0e0d-428f-9872-b6caf0744fa8,9412a921-3afb-4db7-a74b-431eb3b5e00c', N'Gulab Jambu', N'~/Content/Images/SCAT_638445488792502784.jpg', 1, CAST(N'2024-02-26T12:54:42.857' AS DateTime), N'ac59b16f-7567-472a-9a92-3742af812e13', NULL, NULL)
GO
INSERT [dbo].[TaxesMaster] ([TaxIDP], [CompanyIDF], [SiteIDF], [TaxName], [TaxRate], [isActive], [CreationDate], [CreatedBy], [UpdationDate], [UpdatedBy]) VALUES (N'a35ca135-4c38-42a2-8aec-da4d4746aad9', N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', N'6cb14b37-9cd4-457c-b4a5-86083c17e156,dc46044f-e764-4a07-b065-8b085fd71533,96948819-7f12-4a5b-82f1-b007efc6b159', N'CGST', CAST(18.00 AS Decimal(10, 2)), 1, CAST(N'2024-02-26T00:00:00.000' AS DateTime), N'4ee08f5a-167c-4cf4-be5f-107579f4e32f', NULL, NULL)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 26-02-2024 16:15:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 26-02-2024 16:15:27 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 26-02-2024 16:15:27 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_RoleId]    Script Date: 26-02-2024 16:15:27 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_UserId]    Script Date: 26-02-2024 16:15:27 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 26-02-2024 16:15:27 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[CartMaster] ADD  CONSTRAINT [DF_CartMaster_CartIdP]  DEFAULT (newid()) FOR [CartIDP]
GO
ALTER TABLE [dbo].[CartMaster] ADD  CONSTRAINT [DF_CartMaster_IsOrdered]  DEFAULT ((0)) FOR [IsOrdered]
GO
ALTER TABLE [dbo].[CartMaster] ADD  CONSTRAINT [DF_CartMaster_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CartMaster] ADD  CONSTRAINT [DF_CartMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
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
ALTER TABLE [dbo].[SeatMappingMaster] ADD  CONSTRAINT [DF_SeatMappingMaster_IsActive]  DEFAULT ((1)) FOR [isActive]
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
ALTER TABLE [dbo].[TaxesMaster] ADD  CONSTRAINT [DF_TaxesMaster_TaxIDP]  DEFAULT (newid()) FOR [TaxIDP]
GO
ALTER TABLE [dbo].[TaxesMaster] ADD  CONSTRAINT [DF_TaxesMaster_IsActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[TaxesMaster] ADD  CONSTRAINT [DF_TaxesMaster_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_CheckUserStatus]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
    @SiteIDF NVARCHAR(MAX)  
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
                -- Allow GM-Site Wise to see records matching the SiteIDF parameter
                (
                    @UserRole = 'GM-Site Wise'
                    AND
                    EXISTS (
                        SELECT 1
                        FROM dbo.splitstring(U.SiteIDF, ',') AS CS
                        CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                        WHERE CS.Value = PS.Value
                    )
                    AND
                    (
                        -- Exclude other GM-Site Wise users and the current user
                        NOT EXISTS (
                            SELECT 1
                            FROM AspNetUserRoles UR3
                            INNER JOIN AspNetRoles R2 ON UR3.RoleId = R2.Id
                            WHERE UR3.UserId = U.Id
                            AND R2.Name IN ('GM-Site Wise', 'CEO')
                        )
                        AND U.Id != @UserId -- Include the current user's record
                    )
                )
                OR
                -- Non-admin users can see records based on their roles
                (
                    CurrentRole.Name IN ( 'Operator', 'Chef', 'Waiter', 'User')
					AND
					EXISTS (
                        SELECT 1
                        FROM dbo.splitstring(U.SiteIDF, ',') AS CS
                        CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                        WHERE CS.Value = PS.Value
                    )
					 AND
                    (
                        -- Exclude other GM-Site Wise users and the current user
                        NOT EXISTS (
                            SELECT 1
                            FROM AspNetUserRoles UR3
                            INNER JOIN AspNetRoles R2 ON UR3.RoleId = R2.Id
                            WHERE UR3.UserId = U.Id
                            AND R2.Name = 'Operator'
                        )
                        AND U.Id != @UserId -- Include the current user's record
                    )
                    --AND 
                    --(
                    --    U.CompanyIDF = @CompanyIDF 
                    --    OR 
                    --    @UserRole = 'Admin'
                    --)
                )
            )  
            --AND ((U.SiteIDF = @SiteIDF) OR @UserRole = 'Admin'  OR @UserRole = 'CEO') -- Filter by SiteIDF, allowing Admin and CEO to bypass  
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_GetCompanyandSiteID]    Script Date: 26-02-2024 16:15:27 ******/
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
				   CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS AllSiteID,
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
				CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS AllSiteID,
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
				CAST('00000000-0000-0000-0000-000000000000' AS UNIQUEIDENTIFIER) AS AllSiteID,
                ISNULL(U.Gender, '') AS Gender
            FROM AspNetUsers U
            WHERE U.Email = @Email;
            RETURN;
        END
        -- For non-admin users, retrieve company and site information
			SELECT ISNULL(u.CompanyIDF, '00000000-0000-0000-0000-000000000000') AS CompanyIDF,
				   ISNULL(s.SiteIDP, '00000000-0000-0000-0000-000000000000') AS SiteID,
				   ISNULL(u.SiteIDF, '00000000-0000-0000-0000-000000000000') AS AllSiteID,
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_UpdateActiveSiteID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[AspNetUsers_UpdateByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CartMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <21-02-2024>
-- Description:    <Select all from CartMaster>
-- =============================================
CREATE PROCEDURE [dbo].[CartMaster_GetAll] 
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
        SELECT cm.CartIDP,              
			   cm.Quantity,
			   mm.Price,
			   mm.ItemName,
			   mm.ItemImagePath,
			   mm.CompanyIDF,
			   mm.SiteIDF,
			   ISNULL(cms.CompanyName, 'Unknown') AS CompanyName,
			   ISNULL(sms.SiteName, 'Unknown') AS SiteName,
               cm.isActive,
               FORMAT(cm.CreationDate, 'dd-cm-yyyy') AS CreationDate,
               cm.CreatedBy,
               cm.UpdationDate,
               cm.UpdatedBy,
			   @UserRole AS CurrentRole -- Include the current role
        FROM CartMaster cm
		LEFT JOIN MenuMaster mm ON cm.MenuItemIDF = mm.MenuItemIDP
		LEFT JOIN CompanyMaster cms ON cm.CompanyIDF = cms.CompanyIDP		
		LEFT JOIN SitesMaster sms ON cm.SiteIDF = sms.SiteIDP
  
		WHERE ((cm.CompanyIDF = @CompanyIDF AND cm.SiteIDF = @SiteIDF) OR @UserRole = 'Admin' OR (@UserRole = 'CEO' AND cm.CompanyIDF = @CompanyIDF))
        ORDER BY cm.CreationDate DESC
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'CartMaster_GetAll', @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
    @CompanyIDF UNIQUEIDENTIFIER,
    @UserID UNIQUEIDENTIFIER,
    @SiteIDF NVARCHAR(MAX)
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
           CONVERT(VARCHAR(10), cam.CreationDate, 120) AS CreationDate,
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
    WHERE 
        -- Allow Admin to see all records
        @UserRole = 'Admin'
        OR
        -- Allow CEO to see records for their company without specifying a site
        (@UserRole = 'CEO' AND cam.CompanyIDF = @CompanyIDF)
        OR
        -- Allow GM-Site Wise to see records matching the SiteIDF parameter
        (
            @UserRole = 'GM-Site Wise'
            AND
            EXISTS (
                SELECT 1
                FROM dbo.splitstring(cam.SiteIDF, ',') AS CS
                CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                WHERE CS.Value = PS.Value
            )
        )
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (
            cam.CompanyIDF = @CompanyIDF 
			AND 
			EXISTS (
				SELECT 1
				FROM dbo.splitstring(cam.SiteIDF, ',') AS CS
				WHERE CS.Value = @SiteIDF
			)
        )
    ORDER BY CreationDate DESC, CategoryName
    FOR JSON PATH;
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
			   cm.priorityIndex,
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
/****** Object:  StoredProcedure [dbo].[CategoryMaster_GetCategoryFromSites]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CategoryMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
	@priorityIndex int,
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
				  priorityIndex,
				  CompanyIDF,
				  SiteIDF,
				  CategoryImagePath,
                  CreatedBy
				 )
        VALUES (
                 @CategoryName,
				 @priorityIndex,
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
			priorityIndex = @priorityIndex,
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
/****** Object:  StoredProcedure [dbo].[CheckIDExistence]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CityMaster_GetByStateID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_CheckCompanyExistenceByGSTINNumber]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_CheckEmailExistence]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CompanyTypeMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[CountryMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[FeedbackQuestionsMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertErrorLog]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertProcErrorLog]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[MenuMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[MenuMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
@SiteIDF NVARCHAR(MAX),
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
			   mm.Seasonal,
			   mm.IsVeg,
			   mm.QuantitySpecification,
			   cm.priorityIndex,
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
        WHERE 
        -- Allow Admin to see all records
        @UserRole = 'Admin'
        OR
        -- Allow CEO to see records for their company without specifying a site
        (@UserRole = 'CEO' AND mm.CompanyIDF = @CompanyIDF)
        OR
        -- Allow GM-Site Wise to see records matching the SiteIDF parameter
        (
            @UserRole = 'GM-Site Wise'
            AND
            EXISTS (
                SELECT 1
                FROM dbo.splitstring(mm.SiteIDF, ',') AS CS
                CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                WHERE CS.Value = PS.Value
            )
        )
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (
            mm.CompanyIDF = @CompanyIDF 
			AND 
			EXISTS (
				SELECT 1
				FROM dbo.splitstring(mm.SiteIDF, ',') AS CS
				WHERE CS.Value = @SiteIDF
			)
        )
		
        ORDER BY cm.priorityIndex ASC,mm.ItemName ASC,mm.CreationDate DESC
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
/****** Object:  StoredProcedure [dbo].[MenuMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi vagadiya
-- Create date: 13-02-24
-- Description: Retrieve a Menu by MenuID from MenuMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[MenuMaster_GetByID]
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
            mm.Seasonal,
			mm.IsVeg,
			mm.QuantitySpecification,
			cm.priorityIndex,
            mm.ItemImagePath,
            mm.isActive,
            FORMAT(mm.CreationDate, 'dd-MM-yyyy') AS CreatedDate,
            mm.CreatedBy,
            mm.UpdationDate,
            mm.UpdatedBy,
            cm.CategoryName,
            sm.SubCategoryName,
            cms.CompanyName,
            SiteNames.SiteName
        FROM 
            MenuMaster mm
        LEFT JOIN 
            CategoryMaster cm ON mm.CategoryIDF = cm.CategoryIDP
        LEFT JOIN 
            SubCategoryMaster sm ON mm.SubCategoryIDF = sm.SubCategoryIDP
        LEFT JOIN 
            CompanyMaster cms ON mm.CompanyIDF = cms.CompanyIDP
        LEFT JOIN (
            SELECT 
                mm.SiteIDF, 
                STUFF((
                    SELECT ', ' + SM.SiteName
                    FROM dbo.splitstring(mm.SiteIDF, ',') S
                    LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                    FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM 
                MenuMaster mm
            GROUP BY 
                mm.SiteIDF
        ) AS SiteNames ON mm.SiteIDF = SiteNames.SiteIDF
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
/****** Object:  StoredProcedure [dbo].[MenuMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
	@IsVeg bit,
	@Price decimal(10,2),
	@Seasonal NVARCHAR(100) = NULL,
	@QuantitySpecification NVARCHAR(100),
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
				  IsVeg,
				  Price,
				  Seasonal,
				  QuantitySpecification,
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
				  @IsVeg,
				  @Price,
				  @Seasonal,
				  @QuantitySpecification,
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
			Seasonal = @Seasonal,
			IsVeg = @IsVeg,
			QuantitySpecification = @QuantitySpecification,
			ItemImagePath = @ItemImagePath,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE MenuItemIDP = @MenuItemIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[MenuMaster_UpdateStatusOfIsProductOfDay]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Prashant Chauhan
-- Create date: 22-02-24
-- Description: Update Status of IsProductOfDay
-- =============================================
CREATE PROCEDURE [dbo].[MenuMaster_UpdateStatusOfIsProductOfDay]
    @MenuMasterIDP UNIQUEIDENTIFIER,
    @OUTVAL VARCHAR(50) OUTPUT
AS
BEGIN
    BEGIN TRY
        BEGIN
            UPDATE MenuMaster
            SET IsProductOfDay = ~IsProductOfDay
            WHERE MenuItemIDP = @MenuMasterIDP;

            SET @OUTVAL = 'Status changed successfully.';
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        EXEC InsertProcErrorLog 'MenuMaster_UpdateStatusOfIsProductOfDay', @ErrorMessage;
        SET @OUTVAL = 'An error occurred: ' + @ErrorMessage;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[ModifierMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[ModifierMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    Aditya Joshi
-- Create date: 20-02-2024
-- Description:    SeatMappingMaster Delete and Status Change
-- =============================================
CREATE PROCEDURE [dbo].[SeatMappingMaster_GeneralAction]
    @SeatIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    BEGIN TRY
        IF @ActionType = 1
        BEGIN
            -- Check if the record exists
            DECLARE @CheckResult NVARCHAR(MAX);
            EXEC dbo.CheckIDExistence @SeatIDP, 'SeatMappingMaster', @CheckResult OUTPUT;

            IF @CheckResult IS NOT NULL
            BEGIN
                -- Record exists, set @OUTVAL and return
                SET @OUTVAL = @CheckResult;
                RETURN;
            END

            -- Perform logical delete
            DELETE FROM SeatMappingMaster
            WHERE SeatIDP = @SeatIDP;
            SET @OUTVAL = 'Record deleted successfully.';
        END
        ELSE
        BEGIN
            -- Update isActive status
            DECLARE @IsActive BIT;
            SELECT @IsActive = isActive FROM SeatMappingMaster WHERE SeatIDP = @SeatIDP;

            -- Negate the existing isActive value
            SET @IsActive = ~@IsActive;

            -- Execute UpdateIsActive stored procedure to update isActive status
            DECLARE @Output NVARCHAR(MAX);
            EXEC dbo.UpdateIsActive @SeatIDP, @IsActive, 'SeatMappingMaster', @Output OUTPUT;

            -- Set success message
            UPDATE SeatMappingMaster
            SET isActive = ~isActive -- Toggles the isActive status
            WHERE SeatIDP = @SeatIDP;

            -- Concatenate output message with success message
            SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SeatMappingMaster_GeneralAction', @ErrorMessage;

        -- Set @OUTVAL to indicate error occurred
        SET @OUTVAL = 'An error occurred. Please contact the administrator.';
    END CATCH
END

GO
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
    @UserID UNIQUEIDENTIFIER,
    @SiteIDF NVARCHAR(MAX)
AS
BEGIN
    BEGIN TRY

		 DECLARE @UserRole NVARCHAR(100)

		-- Retrieve the current role of the user
		SELECT @UserRole = r.Name
		FROM AspNetUsers u
		INNER JOIN AspNetUserRoles ur ON u.Id = ur.UserId
		INNER JOIN AspNetRoles r ON ur.RoleId = r.Id
		WHERE u.Id = @UserID;

        SELECT
            sm.SeatIDP,
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
            sm.isActive,
            sm.CreatedBy,
            sm.UpdationDate,
            sm.UpdatedBy
        FROM 
            SeatMappingMaster sm
        LEFT JOIN CompanyMaster cm ON sm.CompanyIdF = cm.CompanyIDP
        LEFT JOIN SitesMaster s ON sm.SiteIdF = s.SiteIDP
        WHERE 
             @UserRole = 'Admin'
            OR
            (@UserRole = 'CEO' AND sm.CompanyIDF = @CompanyIDF) -- Retrieve records associated with CompanyId for non-admin users
			OR
        -- Allow GM-Site Wise to see records matching the SiteIDF parameter
        (
            @UserRole = 'GM-Site Wise'
            AND
            EXISTS (
                SELECT 1
                FROM dbo.splitstring(sm.SiteIDF, ',') AS CS
                CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                WHERE CS.Value = PS.Value
            )
        )
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (
            sm.CompanyIDF = @CompanyIDF 
			AND 
			EXISTS (
				SELECT 1
				FROM dbo.splitstring(sm.SiteIDF, ',') AS CS
				WHERE CS.Value = @SiteIDF
			)
        )
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
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 21-02-24
-- Description: Retrieve a Seat Details by SeatID from SeatMappingMaster with additional information
-- =============================================
CREATE PROCEDURE [dbo].[SeatMappingMaster_GetByID]  
    @SeatIDP UNIQUEIDENTIFIER  
AS  
BEGIN  
    BEGIN TRY  
        SELECT  
            sm.SeatIDP,  
            sm.SiteIDF,  
            sm.CompanyIDF,  
            cm.CompanyName,  
            s.SiteName,  
            sm.SeatNumber,  
            sm.QRCode,  
            CONVERT(VARCHAR(10), cm.CreationDate, 120) AS CreatedDate,  
            sm.ModificationDate,  
            sm.Location,  
            sm.Seattype,  
            sm.CreatedBy,  
            sm.UpdatedBy  
        FROM   
            SeatMappingMaster sm  
        LEFT JOIN CompanyMaster cm ON sm.CompanyIdF = cm.CompanyIDP  
        LEFT JOIN SitesMaster s ON sm.SiteIdF = s.SiteIDP  
        WHERE   
            sm.SeatIDP = @SeatIDP  
        FOR JSON PATH;  
    END TRY  
    BEGIN CATCH  
        DECLARE @ErrorMessage NVARCHAR(MAX);  
        SET @ErrorMessage = ERROR_MESSAGE();  
  
        -- Log error directly for this procedure  
        EXEC InsertProcErrorLog 'SeatMappingMaster_GetByID', @ErrorMessage;  
    END CATCH  
END
GO
/****** Object:  StoredProcedure [dbo].[SeatMappingMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SitesMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
		-- Admin: Retrieve all records
		(
			@UserID IN (SELECT UserId FROM AspNetUserRoles WHERE RoleId = (SELECT Id FROM AspNetRoles WHERE Name = 'Admin'))
		)
		OR
		-- CEO: Retrieve records associated with the company
		(
			@UserID IN (SELECT UserId FROM AspNetUserRoles WHERE RoleId = (SELECT Id FROM AspNetRoles WHERE Name = 'CEO')) 
			AND sm.CompanyIDF = @CompanyIDF
		)
		OR
		-- Other Users: Retrieve records associated with their site IDs
		(
			sm.SiteIDP IN (SELECT value FROM dbo.splitstring((SELECT SiteIDF FROM AspNetUsers WHERE Id = @UserID), ','))
		)
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
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SitesMaster_GetSitesByCompany]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Aditya Joshi
-- Create date: 16-02-24
-- Description: Retrieve Sites By CompanyID based on User's Role
-- =============================================
CREATE PROCEDURE [dbo].[SitesMaster_GetSitesByCompany] 
    @CompanyIDF UNIQUEIDENTIFIER,
    @UserID UNIQUEIDENTIFIER
AS
BEGIN
    BEGIN TRY
        SET NOCOUNT ON;

        DECLARE @UserRole NVARCHAR(128);

        -- Get the user's role
        SELECT @UserRole = R.Name
        FROM AspNetUserRoles UR
        INNER JOIN AspNetRoles R ON UR.RoleId = R.Id
        WHERE UR.UserId = @UserID;

        IF @UserRole = 'GM-Site Wise'
        BEGIN
            -- User has GM-Site Wise role
            SELECT DISTINCT s.SiteIDP, s.SiteName
            FROM SitesMaster s
            INNER JOIN dbo.splitstring((SELECT SiteIDF FROM AspNetUsers WHERE Id = @UserID), ',') AS uSites ON s.SiteIDP = uSites.Value
            FOR JSON PATH;
        END
        ELSE
        BEGIN
            -- User does not have GM-Site Wise role
            SELECT DISTINCT s.SiteIDP, s.SiteName
            FROM SitesMaster s
            INNER JOIN CompanyMaster c ON s.CompanyIDF = c.CompanyIDP
            WHERE c.CompanyIDP = @CompanyIDF
            FOR JSON PATH;
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        -- Log error directly for this procedure
        EXEC InsertProcErrorLog 'SitesMaster_GetSitesByCompany', @ErrorMessage;
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[SitesMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
				CompanyIDF = @CompanyIDF,
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
/****** Object:  StoredProcedure [dbo].[StateMaster_GetByCountryID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
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
    @SiteIDF  NVARCHAR(MAX),
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
            -- Allow Admin to see all records
        @UserRole = 'Admin'
        OR
        -- Allow CEO to see records for their company without specifying a site
        (@UserRole = 'CEO' AND sm.CompanyIDF = @CompanyIDF)
        OR
        -- Allow GM-Site Wise to see records matching the SiteIDF parameter
        (
            @UserRole = 'GM-Site Wise'
            AND
            EXISTS (
                SELECT 1
                FROM dbo.splitstring(sm.SiteIDF, ',') AS CS
                CROSS JOIN dbo.splitstring(@SiteIDF, ',') AS PS
                WHERE CS.Value = PS.Value
            )
        )
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (
            sm.CompanyIDF = @CompanyIDF 
			AND 
			EXISTS (
				SELECT 1
				FROM dbo.splitstring(sm.SiteIDF, ',') AS CS
				WHERE CS.Value = @SiteIDF
			)
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
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_GetSubCategoryFromCategory]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[SubCategoryMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
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
/****** Object:  StoredProcedure [dbo].[TaxesMaster_GeneralAction]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 26-02-2024
-- Description: Delete or Update records from TaxesMaster
-- =============================================

Create PROCEDURE [dbo].[TaxesMaster_GeneralAction]
    @TaxIDP UNIQUEIDENTIFIER,
    @ActionType BIT,
    @OUTVAL NVARCHAR(MAX) OUTPUT
AS
BEGIN
    IF @ActionType = 1
    BEGIN
        -- Check if the record exists
        DECLARE @CheckResult NVARCHAR(50);
        EXEC dbo.CheckIDExistence @TaxIDP, 'TaxesMaster', @CheckResult OUTPUT;

        IF @CheckResult IS NOT NULL
        BEGIN
            -- Record exists, set @OUTVAL and return
            SET @OUTVAL = @CheckResult;
            RETURN;
        END

        -- Perform logical delete
        DELETE FROM TaxesMaster
        WHERE TaxIDP = @TaxIDP;

        SET @OUTVAL = 'Record deleted successfully.';
    END
    ELSE
    BEGIN
        -- Update isActive status
        DECLARE @IsActive BIT;
        SELECT @IsActive = isActive FROM TaxesMaster WHERE TaxIDP = @TaxIDP;

        -- Negate the existing isActive value
        SET @IsActive = ~@IsActive;

        -- Execute UpdateIsActive stored procedure to update isActive status
        DECLARE @Output NVARCHAR(50);
        EXEC dbo.UpdateIsActive @TaxIDP, @IsActive, 'TaxesMaster', @Output OUTPUT;

        -- Set success message
        UPDATE TaxesMaster
        SET isActive = ~isActive -- Toggles the isActive status
        WHERE TaxIDP = @TaxIDP;

        -- Concatenate output message with success message
        SET @OUTVAL = 'Status changed successfully.' + ISNULL(@Output, '');
    END
END;

GO
/****** Object:  StoredProcedure [dbo].[TaxesMaster_GetAll]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <23-02-2024>
-- Description:    <Select all from TaxesMaster>
-- =============================================

Create PROCEDURE [dbo].[TaxesMaster_GetAll]
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

    SELECT tm.TaxIDP,
           tm.TaxName,
           tm.TaxRate,
           ISNULL(CM.CompanyName, 'Unknown') AS CompanyName,
           ISNULL(SiteNames.SiteName, '-') AS SiteName,
           tm.isActive,
		   CONVERT(VARCHAR(10), tm.CreationDate, 120) AS CreationDate, -- 120 is the style code for 'YYYY-MM-DD'
           tm.CreatedBy,
           tm.UpdationDate,
           tm.UpdatedBy,
           @UserRole AS CurrentRole -- Include the current role
    FROM TaxesMaster tm
    LEFT JOIN CompanyMaster CM ON tm.CompanyIDF = CM.CompanyIDP
	 LEFT JOIN (
            SELECT tm.SiteIDF, STUFF((
                SELECT ', ' + SM.SiteName
                FROM dbo.splitstring(tm.SiteIDF, ',') S
                LEFT JOIN SitesMaster SM ON S.Value = SM.SiteIDP
                FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS SiteName
            FROM CategoryMaster tm
            GROUP BY tm.SiteIDF
        ) AS SiteNames ON tm.SiteIDF = SiteNames.SiteIDF
	WHERE 
        -- Allow Admin to see all records
        (@UserRole = 'Admin')
        OR
        -- Allow CEO to see records for their company without specifying a site
        (@UserRole = 'CEO' AND tm.CompanyIDF = @CompanyIDF)
        OR
        -- Filter by both CompanyIDF and SiteIDF for other roles
        (tm.CompanyIDF = @CompanyIDF AND tm.SiteIDF = @SiteIDF)
    ORDER BY CreationDate DESC
    FOR JSON PATH;
END


GO
/****** Object:  StoredProcedure [dbo].[TaxesMaster_GetByID]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    <Banshi Vagadiya>
-- Create date: <26-02-2024>
-- Description:    <Select all from TaxesMaster>
-- =============================================

Create PROCEDURE [dbo].[TaxesMaster_GetByID]
    @TaxIDP Uniqueidentifier
AS
BEGIN
    BEGIN TRY
        SELECT tm.TaxIDP,
               tm.TaxName,
			   tm.TaxRate,
			   tm.CompanyIDF,
			   tms.CompanyName,
			   tm.SiteIDF,
			   sm.SiteName,
               tm.isActive,
               tm.CreationDate,
               tm.CreatedBy,
               tm.UpdationDate,
               tm.UpdatedBy
        FROM TaxesMaster tm
		left join CompanyMaster tms on tm.CompanyIDF = tms.CompanyIDP
		left join SitesMaster sm on tm.SiteIDF = sm.SiteIDP
		
        WHERE TaxIDP = @TaxIDP
        FOR JSON PATH;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(MAX);
        SET @ErrorMessage = ERROR_MESSAGE();

        EXEC InsertProcErrorLog 'TaxesMaster_GetByID', @ErrorMessage;

    END CATCH;
END;
GO
/****** Object:  StoredProcedure [dbo].[TaxesMaster_Insert_Update]    Script Date: 26-02-2024 16:15:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Banshi Vagadiya
-- Create date: 26-02-2024
-- Description: Insert and Update Records Into TaxesMaster
-- =============================================
Create PROCEDURE [dbo].[TaxesMaster_Insert_Update]
    @TaxIDP Uniqueidentifier,
	@CompanyIDF uniqueidentifier,
	@SiteIDF nvarchar(max),
    @TaxName NVarchar(100),
	@TaxRate decimal(10,2),
	@OUTVAL Int OUTPUT,
    @OUTMESSAGE Varchar(50) OUTPUT,
    @UpdationDate DateTime = NULL,
    @UpdatedBy Uniqueidentifier = NULL,
	@CreatedBy Uniqueidentifier
AS
BEGIN
    IF (@TaxIDP = '00000000-0000-0000-0000-000000000000')
    BEGIN
        INSERT INTO TaxesMaster
                (
                  TaxName,
				  TaxRate,
				  CompanyIDF,
				  SiteIDF,
                  CreatedBy
				 )
        VALUES (
                 @TaxName,
				 @TaxRate,
				 @CompanyIDF,
				 @SiteIDF,
				 @CreatedBy
				 )

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Saved Successfully.'
    END
    ELSE
    BEGIN
        UPDATE TaxesMaster
        SET TaxName = @TaxName,
			TaxRate = @TaxRate,
			CompanyIDF = @CompanyIDF,
			SiteIDF = @SiteIDF,
            UpdationDate = GETDATE(),
            UpdatedBy = @UpdatedBy
        WHERE TaxIDP = @TaxIDP

        SET @OUTVAL = 1
        SET @OUTMESSAGE = 'Record Updated Successfully.'
    END
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateIsActive]    Script Date: 26-02-2024 16:15:27 ******/
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
