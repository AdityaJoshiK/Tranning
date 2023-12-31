USE [master]
GO
/****** Object:  Database [CarInfo]    Script Date: 08-11-2023 17:39:59 ******/
CREATE DATABASE [CarInfo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CarInfo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CarInfo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CarInfo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CarInfo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CarInfo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CarInfo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CarInfo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CarInfo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CarInfo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CarInfo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CarInfo] SET ARITHABORT OFF 
GO
ALTER DATABASE [CarInfo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CarInfo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CarInfo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CarInfo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CarInfo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CarInfo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CarInfo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CarInfo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CarInfo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CarInfo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CarInfo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CarInfo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CarInfo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CarInfo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CarInfo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CarInfo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CarInfo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CarInfo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CarInfo] SET  MULTI_USER 
GO
ALTER DATABASE [CarInfo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CarInfo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CarInfo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CarInfo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CarInfo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CarInfo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CarInfo] SET QUERY_STORE = OFF
GO
USE [CarInfo]
GO
/****** Object:  Table [dbo].[CAR_CarWiseFeature]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_CarWiseFeature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NULL,
	[FeatureName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[VariantID] [int] NULL,
 CONSTRAINT [PK__CAR_Feat__82230A291FF59FAA] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_CarWiseFuelType]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_CarWiseFuelType](
	[FuelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FuelTypeName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CarID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FuelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_CarWiseTransmissionType]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_CarWiseTransmissionType](
	[TransmissionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TransmissionTypeName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[CarID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransmissionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_CarWiseVariant]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_CarWiseVariant](
	[CarWiseVariantID] [int] IDENTITY(1,1) NOT NULL,
	[VariantID] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[CarID] [int] NULL,
	[UserID] [int] NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK__CAR_Vari__0EA233E4384E9483] PRIMARY KEY CLUSTERED 
(
	[CarWiseVariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Dealer]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Dealer](
	[DealerID] [int] IDENTITY(1,1) NOT NULL,
	[MakeID] [int] NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[Country] [nvarchar](100) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DealerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Feature]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Feature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureName] [nvarchar](500) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK_CAR_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_FuelType]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_FuelType](
	[FuelTypeID] [int] IDENTITY(1,1) NOT NULL,
	[FuelTypeName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FuelTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Image]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Image](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[PhotoPath] [nvarchar](500) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[CarID] [int] NOT NULL,
	[UserID] [int] NULL,
 CONSTRAINT [PK__CAR_Imag__7516F4EC89C9DCF5] PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Make]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Make](
	[MakeID] [int] IDENTITY(1,1) NOT NULL,
	[MakeName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[PhotoPath] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[MakeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Review]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[CarID] [int] NULL,
	[ClientID] [int] NULL,
	[ReviewText] [nvarchar](max) NULL,
	[Rating] [int] NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK__CAR_Revi__74BC79AECD2C901C] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_TransmissionType]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_TransmissionType](
	[TransmissionTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TransmissionTypeName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransmissionTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Type]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Type](
	[TypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](100) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UseriD] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAR_Variant]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAR_Variant](
	[VariantID] [int] IDENTITY(1,1) NOT NULL,
	[VariantName] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[UserID] [int] NULL,
	[MakeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VariantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Favourite]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Favourite](
	[FavouriteID] [int] IDENTITY(1,1) NOT NULL,
	[FavouriteCarID] [int] NOT NULL,
	[ClientID] [int] NOT NULL,
 CONSTRAINT [PK_Client_Favourite] PRIMARY KEY CLUSTERED 
(
	[FavouriteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Car]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Car](
	[CarID] [int] IDENTITY(1,1) NOT NULL,
	[MakeID] [int] NULL,
	[TypeID] [int] NULL,
	[UserID] [int] NULL,
	[Year] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
	[PhotoPath] [nvarchar](max) NULL,
 CONSTRAINT [PK__Car__68A0340E3783B05E] PRIMARY KEY CLUSTERED 
(
	[CarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_Client]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_Client](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MST_Client] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MST_User]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MST_User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[MobileNumber] [nvarchar](20) NULL,
	[PhotoPath] [nvarchar](max) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK__MST_User__1788CCAC3DC6FD6F] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 08-11-2023 17:39:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[RollNo] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Branch] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RollNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CAR_CarWiseFeature] ON 

INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1071, 1025, N'Air Conditioner', CAST(N'2023-04-16T20:29:14.270' AS DateTime), CAST(N'2023-04-16T20:29:14.270' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1072, 1025, N'4 smart USB chargers (A Type, Front and Rear)', CAST(N'2023-04-16T20:29:14.273' AS DateTime), CAST(N'2023-04-16T20:29:14.273' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1073, 1025, N'Adjustable Headrest', CAST(N'2023-04-16T20:29:14.273' AS DateTime), CAST(N'2023-04-16T20:29:14.273' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1074, 1025, N'Accessory Power Outlet', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1075, 1025, N'Adjustable Seats', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1076, 1025, N'Adjustable Steering', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1077, 1025, N'Advance Safety Features', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1078, 1025, N'Anti-Lock Braking System', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1079, 1025, N'Anti-Theft Alarm', CAST(N'2023-04-16T20:29:14.277' AS DateTime), CAST(N'2023-04-16T20:29:14.277' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1080, 1025, N'Bench Folding', CAST(N'2023-04-16T20:29:14.280' AS DateTime), CAST(N'2023-04-16T20:29:14.280' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1081, 1025, N'Brake Disc Wiping', CAST(N'2023-04-16T20:29:14.280' AS DateTime), CAST(N'2023-04-16T20:29:14.280' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1082, 1025, N'Central Console ArmrestWith Storage', CAST(N'2023-04-16T20:29:14.280' AS DateTime), CAST(N'2023-04-16T20:29:14.280' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1083, 1025, N'Central Locking', CAST(N'2023-04-16T20:29:14.280' AS DateTime), CAST(N'2023-04-16T20:29:14.280' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1084, 1025, N'Child Safety Locks', CAST(N'2023-04-16T20:29:14.280' AS DateTime), CAST(N'2023-04-16T20:29:14.280' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1085, 1025, N'Corner Stability Control', CAST(N'2023-04-16T20:29:14.283' AS DateTime), CAST(N'2023-04-16T20:29:14.283' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1086, 1025, N'Crash Sensor', CAST(N'2023-04-16T20:29:14.283' AS DateTime), CAST(N'2023-04-16T20:29:14.283' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1087, 1025, N'Cup Holders-Front', CAST(N'2023-04-16T20:29:14.283' AS DateTime), CAST(N'2023-04-16T20:29:14.283' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1088, 1025, N'Driver Airbag', CAST(N'2023-04-16T20:29:14.283' AS DateTime), CAST(N'2023-04-16T20:29:14.283' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1089, 1025, N'EBD (Electronic Brakeforce Distribution)', CAST(N'2023-04-16T20:29:14.287' AS DateTime), CAST(N'2023-04-16T20:29:14.287' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1090, 1025, N'Electronic Stability Control', CAST(N'2023-04-16T20:29:14.287' AS DateTime), CAST(N'2023-04-16T20:29:14.287' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1091, 1025, N'Engine Check Warning', CAST(N'2023-04-16T20:29:14.287' AS DateTime), CAST(N'2023-04-16T20:29:14.287' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1092, 1025, N'Gear Shift Indicator', CAST(N'2023-04-16T20:29:14.287' AS DateTime), CAST(N'2023-04-16T20:29:14.287' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1093, 1025, N'Heater', CAST(N'2023-04-16T20:29:14.287' AS DateTime), CAST(N'2023-04-16T20:29:14.287' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1094, 1025, N'Hill Assist', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1095, 1025, N'Low Fuel Warning Light', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1096, 1025, N'Luggage Hook & Net', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1097, 1025, N'Parking Sensors', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1098, 1025, N'Passenger Airbag', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1099, 1025, N'Passenger Side Rear View Mirror', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1100, 1025, N'Perimetric Alarm System', CAST(N'2023-04-16T20:29:14.290' AS DateTime), CAST(N'2023-04-16T20:29:14.290' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1101, 1025, N'Power Door Locks', CAST(N'2023-04-16T20:29:14.293' AS DateTime), CAST(N'2023-04-16T20:29:14.293' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1102, 1025, N'Power Steering', CAST(N'2023-04-16T20:29:14.293' AS DateTime), CAST(N'2023-04-16T20:29:14.293' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1103, 1025, N'Power Windows-Front', CAST(N'2023-04-16T20:29:14.293' AS DateTime), CAST(N'2023-04-16T20:29:14.293' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1104, 1025, N'Power Windows-Rear', CAST(N'2023-04-16T20:29:14.293' AS DateTime), CAST(N'2023-04-16T20:29:14.293' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1105, 1025, N'Rear Curtain', CAST(N'2023-04-16T20:29:14.293' AS DateTime), CAST(N'2023-04-16T20:29:14.293' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1106, 1025, N'Rear Foldable Rear Seat', CAST(N'2023-04-16T20:29:14.297' AS DateTime), CAST(N'2023-04-16T20:29:14.297' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1107, 1025, N'Rear Seat Belts', CAST(N'2023-04-16T20:29:14.297' AS DateTime), CAST(N'2023-04-16T20:29:14.297' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1108, 1025, N'Rear Seat Headrest', CAST(N'2023-04-16T20:29:14.297' AS DateTime), CAST(N'2023-04-16T20:29:14.297' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1109, 1025, N'Roll Over Mitigation', CAST(N'2023-04-16T20:29:14.297' AS DateTime), CAST(N'2023-04-16T20:29:14.297' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1110, 1025, N'Traction Control', CAST(N'2023-04-16T20:29:14.300' AS DateTime), CAST(N'2023-04-16T20:29:14.300' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1111, 1025, N'USB ChargerFront & Rear', CAST(N'2023-04-16T20:29:14.300' AS DateTime), CAST(N'2023-04-16T20:29:14.300' AS DateTime), 1, 15)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1112, 1025, N'Apple CarPlay', CAST(N'2023-04-16T20:41:42.653' AS DateTime), CAST(N'2023-04-16T20:41:42.653' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1113, 1025, N'Android Auto', CAST(N'2023-04-16T20:41:42.660' AS DateTime), CAST(N'2023-04-16T20:41:42.660' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1114, 1025, N'Connectivity', CAST(N'2023-04-16T20:41:42.660' AS DateTime), CAST(N'2023-04-16T20:41:42.660' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1115, 1025, N'Bluetooth Connectivity', CAST(N'2023-04-16T20:41:42.660' AS DateTime), CAST(N'2023-04-16T20:41:42.660' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1116, 1025, N'Integrated 2DIN Audio', CAST(N'2023-04-16T20:41:42.660' AS DateTime), CAST(N'2023-04-16T20:41:42.660' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1117, 1025, N'Speakers Rear', CAST(N'2023-04-16T20:41:42.663' AS DateTime), CAST(N'2023-04-16T20:41:42.663' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1118, 1025, N'Speakers Front', CAST(N'2023-04-16T20:41:42.663' AS DateTime), CAST(N'2023-04-16T20:41:42.663' AS DateTime), 1, 16)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1119, 1025, N'Harman Touchscreen infotainment, 4 Tweeters, Radio', CAST(N'2023-04-16T20:44:24.640' AS DateTime), CAST(N'2023-04-16T20:44:24.640' AS DateTime), 1, 17)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1120, 1025, N'Android Auto', CAST(N'2023-04-16T20:44:24.643' AS DateTime), CAST(N'2023-04-16T20:44:24.643' AS DateTime), 1, 17)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1121, 1025, N'Apple CarPlay', CAST(N'2023-04-16T20:44:24.643' AS DateTime), CAST(N'2023-04-16T20:44:24.643' AS DateTime), 1, 17)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1122, 1025, N'Bluetooth Connectivity', CAST(N'2023-04-16T20:44:24.643' AS DateTime), CAST(N'2023-04-16T20:44:24.643' AS DateTime), 1, 17)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1123, 1025, N'Dual Function LED DRLs with Turn Indicators', CAST(N'2023-04-16T20:50:31.563' AS DateTime), CAST(N'2023-04-16T20:50:31.563' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1124, 1025, N'Panoramic Sunroof', CAST(N'2023-04-16T20:50:31.567' AS DateTime), CAST(N'2023-04-16T20:50:31.567' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1125, 1025, N'Soft Touch Dashboard with Anti Reflective ''Nappa'' Grain Top Layer', CAST(N'2023-04-16T20:50:31.567' AS DateTime), CAST(N'2023-04-16T20:50:31.567' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1126, 1025, N'5 Smart USB Chargers (A & C Type, Front and Rear)', CAST(N'2023-04-16T20:50:31.567' AS DateTime), CAST(N'2023-04-16T20:50:31.567' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1127, 1025, N'Instrument Cluster with 17.76 cm (7") Colour TFT Display', CAST(N'2023-04-16T20:50:31.570' AS DateTime), CAST(N'2023-04-16T20:50:31.570' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1128, 1025, N'Premium Benecke KalikoTM Oak Brown Perforated Leather Seat Upholstery and Door Pad Inserts', CAST(N'2023-04-16T20:50:31.570' AS DateTime), CAST(N'2023-04-16T20:50:31.570' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1129, 1025, N'Signature Oak Brown Interior Colour Scheme', CAST(N'2023-04-16T20:50:31.570' AS DateTime), CAST(N'2023-04-16T20:50:31.570' AS DateTime), 1, 18)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1130, 1025, N'Alloy Wheels', CAST(N'2023-04-16T20:52:25.743' AS DateTime), CAST(N'2023-04-16T20:52:25.743' AS DateTime), 1, 19)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1131, 1026, N'Adjustable Headrest', CAST(N'2023-04-17T08:43:14.030' AS DateTime), CAST(N'2023-04-17T08:43:14.030' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1132, 1026, N'Adjustable Steering', CAST(N'2023-04-17T08:43:14.030' AS DateTime), CAST(N'2023-04-17T08:43:14.030' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1133, 1026, N'Air Conditioner', CAST(N'2023-04-17T08:43:14.030' AS DateTime), CAST(N'2023-04-17T08:43:14.030' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1134, 1026, N'Anti-Lock Braking System', CAST(N'2023-04-17T08:43:14.030' AS DateTime), CAST(N'2023-04-17T08:43:14.030' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1135, 1026, N'Central Locking', CAST(N'2023-04-17T08:43:14.033' AS DateTime), CAST(N'2023-04-17T08:43:14.033' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1136, 1026, N'Anti-Theft Alarm', CAST(N'2023-04-17T08:43:14.033' AS DateTime), CAST(N'2023-04-17T08:43:14.033' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1137, 1026, N'Child Safety Locks', CAST(N'2023-04-17T08:43:14.033' AS DateTime), CAST(N'2023-04-17T08:43:14.033' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1138, 1026, N'Driver Airbag', CAST(N'2023-04-17T08:43:14.033' AS DateTime), CAST(N'2023-04-17T08:43:14.033' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1139, 1026, N'Heater', CAST(N'2023-04-17T08:43:14.033' AS DateTime), CAST(N'2023-04-17T08:43:14.033' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1140, 1026, N'Parking Sensors', CAST(N'2023-04-17T08:43:14.037' AS DateTime), CAST(N'2023-04-17T08:43:14.037' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1141, 1026, N'Rear AC Vents', CAST(N'2023-04-17T08:43:14.037' AS DateTime), CAST(N'2023-04-17T08:43:14.037' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1142, 1026, N'Power Windows-Rear', CAST(N'2023-04-17T08:43:14.037' AS DateTime), CAST(N'2023-04-17T08:43:14.037' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1143, 1026, N'Power Door Locks', CAST(N'2023-04-17T08:43:14.037' AS DateTime), CAST(N'2023-04-17T08:43:14.037' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1144, 1026, N'Power Windows-Front', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1145, 1026, N'Corner Stability Control', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1146, 1026, N'Passenger Airbag', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1147, 1026, N'Engine Check Warning', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1148, 1026, N'Accessory Power Outlet', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1149, 1026, N'4 smart USB chargers (A Type, Front and Rear)', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1150, 1026, N'Adjustable Seats', CAST(N'2023-04-17T08:43:14.040' AS DateTime), CAST(N'2023-04-17T08:43:14.040' AS DateTime), 1, 20)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1151, 1026, N'Adjustable Steering', CAST(N'2023-04-17T08:50:42.687' AS DateTime), CAST(N'2023-04-17T08:50:42.687' AS DateTime), 1, 21)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1152, 1026, N'Adjustable Seats', CAST(N'2023-04-17T08:50:42.690' AS DateTime), CAST(N'2023-04-17T08:50:42.690' AS DateTime), 1, 21)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1153, 1026, N'EBD (Electronic Brakeforce Distribution)', CAST(N'2023-04-17T08:50:42.697' AS DateTime), CAST(N'2023-04-17T08:50:42.697' AS DateTime), 1, 21)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1154, 1026, N'Traction Control', CAST(N'2023-04-17T08:50:42.697' AS DateTime), CAST(N'2023-04-17T08:50:42.697' AS DateTime), 1, 21)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1156, 1026, N'5 Smart USB Chargers (A & C Type, Front and Rear)', CAST(N'2023-04-17T08:52:41.137' AS DateTime), CAST(N'2023-04-17T08:52:41.137' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1157, 1026, N'Apple CarPlay', CAST(N'2023-04-17T08:52:41.140' AS DateTime), CAST(N'2023-04-17T08:52:41.140' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1158, 1026, N'Android Auto', CAST(N'2023-04-17T08:52:41.140' AS DateTime), CAST(N'2023-04-17T08:52:41.140' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1159, 1026, N'Central Console ArmrestWith Storage', CAST(N'2023-04-17T08:52:41.140' AS DateTime), CAST(N'2023-04-17T08:52:41.140' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1160, 1026, N'Connectivity', CAST(N'2023-04-17T08:52:41.143' AS DateTime), CAST(N'2023-04-17T08:52:41.143' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1161, 1026, N'Cup Holders-Front', CAST(N'2023-04-17T08:52:41.143' AS DateTime), CAST(N'2023-04-17T08:52:41.143' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1162, 1026, N'Dual Function LED DRLs with Turn Indicators', CAST(N'2023-04-17T08:52:41.143' AS DateTime), CAST(N'2023-04-17T08:52:41.143' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1163, 1026, N'Hill Assist', CAST(N'2023-04-17T08:52:41.147' AS DateTime), CAST(N'2023-04-17T08:52:41.147' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1164, 1026, N'LED Taillights', CAST(N'2023-04-17T08:52:41.147' AS DateTime), CAST(N'2023-04-17T08:52:41.147' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1165, 1026, N'LED Headlights', CAST(N'2023-04-17T08:52:41.147' AS DateTime), CAST(N'2023-04-17T08:52:41.147' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1166, 1026, N'Instrument Cluster with 17.76 cm (7") Colour TFT Display', CAST(N'2023-04-17T08:52:41.150' AS DateTime), CAST(N'2023-04-17T08:52:41.150' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1167, 1026, N'Panoramic Sunroof', CAST(N'2023-04-17T08:52:41.150' AS DateTime), CAST(N'2023-04-17T08:52:41.150' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1168, 1026, N'Rear Camera', CAST(N'2023-04-17T08:52:41.150' AS DateTime), CAST(N'2023-04-17T08:52:41.150' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1169, 1026, N'USB ChargerFront & Rear', CAST(N'2023-04-17T08:52:41.150' AS DateTime), CAST(N'2023-04-17T08:52:41.150' AS DateTime), 1, 22)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1170, 1026, N'Adaptive cruise control with Start and Go', CAST(N'2023-04-17T08:54:01.983' AS DateTime), CAST(N'2023-04-17T08:54:01.983' AS DateTime), 1, 23)
GO
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1171, 1026, N'Advance Safety Features', CAST(N'2023-04-17T08:54:01.987' AS DateTime), CAST(N'2023-04-17T08:54:01.987' AS DateTime), 1, 23)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1172, 1026, N'Soft Touch Dashboard with Anti Reflective ''Nappa'' Grain Top Layer', CAST(N'2023-04-17T08:54:01.990' AS DateTime), CAST(N'2023-04-17T08:54:01.990' AS DateTime), 1, 23)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1173, 1026, N'ADAS', CAST(N'2023-04-17T08:54:01.990' AS DateTime), CAST(N'2023-04-17T08:54:01.990' AS DateTime), 1, 23)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1174, 1026, N'Big TouchScreen', CAST(N'2023-04-17T08:54:01.993' AS DateTime), CAST(N'2023-04-17T08:54:01.993' AS DateTime), 1, 23)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1175, 1027, N'Accessory Power Outlet', CAST(N'2023-04-17T23:05:46.703' AS DateTime), CAST(N'2023-04-17T23:05:46.703' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1176, 1027, N'Adjustable Headrest', CAST(N'2023-04-17T23:05:46.707' AS DateTime), CAST(N'2023-04-17T23:05:46.707' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1177, 1027, N'Adjustable Seats', CAST(N'2023-04-17T23:05:46.707' AS DateTime), CAST(N'2023-04-17T23:05:46.707' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1178, 1027, N'Air Conditioner', CAST(N'2023-04-17T23:05:46.707' AS DateTime), CAST(N'2023-04-17T23:05:46.707' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1179, 1027, N'Anti-Lock Braking System', CAST(N'2023-04-17T23:05:46.707' AS DateTime), CAST(N'2023-04-17T23:05:46.707' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1180, 1027, N'Central Locking', CAST(N'2023-04-17T23:05:46.707' AS DateTime), CAST(N'2023-04-17T23:05:46.707' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1181, 1027, N'Child Safety Locks', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1182, 1027, N'Digital Clock', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1183, 1027, N'Heater', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1184, 1027, N'Wheel Covers', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1185, 1027, N'Power Windows-Rear', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1186, 1027, N'Power Windows-Front', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1187, 1027, N'Rear Seat Belts', CAST(N'2023-04-17T23:05:46.710' AS DateTime), CAST(N'2023-04-17T23:05:46.710' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1188, 1027, N'Power Steering', CAST(N'2023-04-17T23:05:46.713' AS DateTime), CAST(N'2023-04-17T23:05:46.713' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1189, 1027, N'EBD (Electronic Brakeforce Distribution)', CAST(N'2023-04-17T23:05:46.713' AS DateTime), CAST(N'2023-04-17T23:05:46.713' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1190, 1027, N'KeyLess Entry', CAST(N'2023-04-17T23:05:46.713' AS DateTime), CAST(N'2023-04-17T23:05:46.713' AS DateTime), 1, 24)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1191, 1027, N'4 smart USB chargers (A Type, Front and Rear)', CAST(N'2023-04-17T23:09:19.677' AS DateTime), CAST(N'2023-04-17T23:09:19.677' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1192, 1027, N'Accessory Power Outlet', CAST(N'2023-04-17T23:09:19.680' AS DateTime), CAST(N'2023-04-17T23:09:19.680' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1193, 1027, N'Anti-Theft Alarm', CAST(N'2023-04-17T23:09:19.683' AS DateTime), CAST(N'2023-04-17T23:09:19.683' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1194, 1027, N'Bluetooth Connectivity', CAST(N'2023-04-17T23:09:19.683' AS DateTime), CAST(N'2023-04-17T23:09:19.683' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1195, 1027, N'Hill Assist', CAST(N'2023-04-17T23:09:19.683' AS DateTime), CAST(N'2023-04-17T23:09:19.683' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1196, 1027, N'Instrument Cluster with 17.76 cm (7") Colour TFT Display', CAST(N'2023-04-17T23:09:19.687' AS DateTime), CAST(N'2023-04-17T23:09:19.687' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1197, 1027, N'Rear Curtain', CAST(N'2023-04-17T23:09:19.687' AS DateTime), CAST(N'2023-04-17T23:09:19.687' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1198, 1027, N'LED Headlights', CAST(N'2023-04-17T23:09:19.687' AS DateTime), CAST(N'2023-04-17T23:09:19.687' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1199, 1027, N'Luggage Hook & Net', CAST(N'2023-04-17T23:09:19.687' AS DateTime), CAST(N'2023-04-17T23:09:19.687' AS DateTime), 1, 25)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1200, 1027, N'Apple CarPlay', CAST(N'2023-04-17T23:15:35.673' AS DateTime), CAST(N'2023-04-17T23:15:35.673' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1201, 1027, N'Android Auto', CAST(N'2023-04-17T23:15:35.677' AS DateTime), CAST(N'2023-04-17T23:15:35.677' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1202, 1027, N'Automatic Climate Control', CAST(N'2023-04-17T23:15:35.677' AS DateTime), CAST(N'2023-04-17T23:15:35.677' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1203, 1027, N'LED Taillights', CAST(N'2023-04-17T23:15:35.680' AS DateTime), CAST(N'2023-04-17T23:15:35.680' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1204, 1027, N'Cruise Control', CAST(N'2023-04-17T23:15:35.680' AS DateTime), CAST(N'2023-04-17T23:15:35.680' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1205, 1027, N'Big TouchScreen', CAST(N'2023-04-17T23:15:35.680' AS DateTime), CAST(N'2023-04-17T23:15:35.680' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1206, 1027, N'Driver Airbag', CAST(N'2023-04-17T23:15:35.680' AS DateTime), CAST(N'2023-04-17T23:15:35.680' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1207, 1027, N'Passenger Airbag', CAST(N'2023-04-17T23:15:35.680' AS DateTime), CAST(N'2023-04-17T23:15:35.680' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1208, 1027, N'Engine Start Stop Button', CAST(N'2023-04-17T23:15:35.683' AS DateTime), CAST(N'2023-04-17T23:15:35.683' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1209, 1027, N'Hill Assist', CAST(N'2023-04-17T23:15:35.683' AS DateTime), CAST(N'2023-04-17T23:15:35.683' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1210, 1027, N'Parking Sensors', CAST(N'2023-04-17T23:15:35.683' AS DateTime), CAST(N'2023-04-17T23:15:35.683' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1211, 1027, N'Speakers Rear', CAST(N'2023-04-17T23:15:35.683' AS DateTime), CAST(N'2023-04-17T23:15:35.683' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1212, 1027, N'Sun Roof', CAST(N'2023-04-17T23:15:35.683' AS DateTime), CAST(N'2023-04-17T23:15:35.683' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1213, 1027, N'Speakers Front', CAST(N'2023-04-17T23:15:35.687' AS DateTime), CAST(N'2023-04-17T23:15:35.687' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1214, 1027, N'Automatic Headlamps', CAST(N'2023-04-17T23:15:35.687' AS DateTime), CAST(N'2023-04-17T23:15:35.687' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1215, 1027, N'Central Console ArmrestWith Storage', CAST(N'2023-04-17T23:15:35.687' AS DateTime), CAST(N'2023-04-17T23:15:35.687' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1216, 1027, N'Rear Camera', CAST(N'2023-04-17T23:15:35.687' AS DateTime), CAST(N'2023-04-17T23:15:35.687' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1217, 1027, N'Wheel Covers', CAST(N'2023-04-17T23:15:35.687' AS DateTime), CAST(N'2023-04-17T23:15:35.687' AS DateTime), 1, 26)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1218, 1027, N'ADAS', CAST(N'2023-04-17T23:17:41.023' AS DateTime), CAST(N'2023-04-17T23:17:41.023' AS DateTime), 1, 27)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1219, 1027, N'Advance Safety Features', CAST(N'2023-04-17T23:17:41.027' AS DateTime), CAST(N'2023-04-17T23:17:41.027' AS DateTime), 1, 27)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1220, 1027, N'Adaptive cruise control with Start and Go', CAST(N'2023-04-17T23:17:41.030' AS DateTime), CAST(N'2023-04-17T23:17:41.030' AS DateTime), 1, 27)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1221, 1027, N'Alloy Wheels', CAST(N'2023-04-17T23:17:41.030' AS DateTime), CAST(N'2023-04-17T23:17:41.030' AS DateTime), 1, 27)
INSERT [dbo].[CAR_CarWiseFeature] ([FeatureID], [CarID], [FeatureName], [CreationDate], [ModificationDate], [UserID], [VariantID]) VALUES (1222, 1027, N'Electric Adjustable Seats', CAST(N'2023-04-17T23:17:41.030' AS DateTime), CAST(N'2023-04-17T23:17:41.030' AS DateTime), 1, 27)
SET IDENTITY_INSERT [dbo].[CAR_CarWiseFeature] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_CarWiseFuelType] ON 

INSERT [dbo].[CAR_CarWiseFuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (2022, N'Diesel', CAST(N'2023-04-16T19:48:24.743' AS DateTime), CAST(N'2023-04-16T19:48:24.743' AS DateTime), 1, 1025)
INSERT [dbo].[CAR_CarWiseFuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (2023, N'Petrol', CAST(N'2023-04-17T08:28:50.683' AS DateTime), CAST(N'2023-04-17T08:28:50.683' AS DateTime), 1, 1026)
INSERT [dbo].[CAR_CarWiseFuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (2024, N'Diesel', CAST(N'2023-04-17T08:28:50.707' AS DateTime), CAST(N'2023-04-17T08:28:50.707' AS DateTime), 1, 1026)
INSERT [dbo].[CAR_CarWiseFuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (2025, N'Petrol', CAST(N'2023-04-17T22:42:24.157' AS DateTime), CAST(N'2023-04-17T22:42:24.157' AS DateTime), 1, 1027)
INSERT [dbo].[CAR_CarWiseFuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (2026, N'Diesel', CAST(N'2023-04-17T22:42:24.180' AS DateTime), CAST(N'2023-04-17T22:42:24.180' AS DateTime), 1, 1027)
SET IDENTITY_INSERT [dbo].[CAR_CarWiseFuelType] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_CarWiseTransmissionType] ON 

INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (14, N'Manual', CAST(N'2023-04-16T19:40:56.610' AS DateTime), CAST(N'2023-04-16T19:40:56.610' AS DateTime), 1, 0)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (15, N'Automatic', CAST(N'2023-04-16T19:40:56.613' AS DateTime), CAST(N'2023-04-16T19:40:56.613' AS DateTime), 1, 0)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (16, N'Manual', CAST(N'2023-04-16T19:48:24.750' AS DateTime), CAST(N'2023-04-16T19:48:24.750' AS DateTime), 1, 1025)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (17, N'Automatic', CAST(N'2023-04-16T19:48:24.753' AS DateTime), CAST(N'2023-04-16T19:48:24.753' AS DateTime), 1, 1025)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (18, N'Manual', CAST(N'2023-04-17T08:28:50.710' AS DateTime), CAST(N'2023-04-17T08:28:50.710' AS DateTime), 1, 1026)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (19, N'Automatic', CAST(N'2023-04-17T08:28:50.737' AS DateTime), CAST(N'2023-04-17T08:28:50.737' AS DateTime), 1, 1026)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (20, N'Manual', CAST(N'2023-04-17T22:42:24.190' AS DateTime), CAST(N'2023-04-17T22:42:24.190' AS DateTime), 1, 1027)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (21, N'DCT', CAST(N'2023-04-17T22:42:24.210' AS DateTime), CAST(N'2023-04-17T22:42:24.210' AS DateTime), 1, 1027)
INSERT [dbo].[CAR_CarWiseTransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID], [CarID]) VALUES (22, N'Automatic', CAST(N'2023-04-17T22:42:24.210' AS DateTime), CAST(N'2023-04-17T22:42:24.210' AS DateTime), 1, 1027)
SET IDENTITY_INSERT [dbo].[CAR_CarWiseTransmissionType] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_CarWiseVariant] ON 

INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (3, 15, CAST(N'2023-04-16T20:18:35.043' AS DateTime), CAST(N'2023-04-16T20:18:35.043' AS DateTime), 1025, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (4, 16, CAST(N'2023-04-16T20:18:58.387' AS DateTime), CAST(N'2023-04-16T20:18:58.387' AS DateTime), 1025, 1, CAST(1645000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (5, 17, CAST(N'2023-04-16T20:19:32.577' AS DateTime), CAST(N'2023-04-16T20:19:32.577' AS DateTime), 1025, 1, CAST(1869000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (6, 18, CAST(N'2023-04-16T20:20:22.407' AS DateTime), CAST(N'2023-04-16T20:20:22.407' AS DateTime), 1025, 1, CAST(1924000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (7, 19, CAST(N'2023-04-16T20:20:48.140' AS DateTime), CAST(N'2023-04-16T20:20:48.140' AS DateTime), 1025, 1, CAST(2132000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (8, 20, CAST(N'2023-04-17T08:30:37.047' AS DateTime), CAST(N'2023-04-17T08:30:37.047' AS DateTime), 1026, 1, CAST(1345000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (9, 21, CAST(N'2023-04-17T08:30:53.817' AS DateTime), CAST(N'2023-04-17T08:30:53.817' AS DateTime), 1026, 1, CAST(1588000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (10, 22, CAST(N'2023-04-17T08:31:15.667' AS DateTime), CAST(N'2023-04-17T08:31:15.667' AS DateTime), 1026, 1, CAST(1719000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (11, 23, CAST(N'2023-04-17T08:32:41.303' AS DateTime), CAST(N'2023-04-17T08:32:41.303' AS DateTime), 1026, 1, CAST(2374000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (12, 24, CAST(N'2023-04-17T22:44:14.393' AS DateTime), CAST(N'2023-04-17T22:44:14.393' AS DateTime), 1027, 1, CAST(1090000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (13, 25, CAST(N'2023-04-17T22:45:23.793' AS DateTime), CAST(N'2023-04-17T22:45:23.793' AS DateTime), 1027, 1, CAST(1196000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (14, 26, CAST(N'2023-04-17T22:45:45.680' AS DateTime), CAST(N'2023-04-17T22:45:45.680' AS DateTime), 1027, 1, CAST(1298000.00 AS Decimal(18, 2)))
INSERT [dbo].[CAR_CarWiseVariant] ([CarWiseVariantID], [VariantID], [CreationDate], [ModificationDate], [CarID], [UserID], [Price]) VALUES (15, 27, CAST(N'2023-04-17T22:46:07.780' AS DateTime), CAST(N'2023-04-17T22:46:07.780' AS DateTime), 1027, 1, CAST(1738000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[CAR_CarWiseVariant] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Dealer] ON 

INSERT [dbo].[CAR_Dealer] ([DealerID], [MakeID], [Name], [Address], [City], [State], [Country], [Phone], [CreationDate], [ModificationDate], [UserID]) VALUES (9, 8, N'Demo', N'XYZ', N'Rajkot', N'Gujarat', N'India', N'544464464644', CAST(N'2023-09-11T23:13:18.230' AS DateTime), CAST(N'2023-09-11T23:13:18.230' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[CAR_Dealer] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Feature] ON 

INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (6, N'Power Steering', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (7, N'Power Windows-Front', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (8, N'Power Windows-Rear', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (9, N'Air Conditioner', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (10, N'Heater', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (11, N'Adjustable Steering', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (12, N'Low Fuel Warning Light', CAST(N'2023-04-16T20:23:59.920' AS DateTime), CAST(N'2023-04-16T20:23:59.920' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (13, N'Accessory Power Outlet', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (14, N'Rear Seat Headrest', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (15, N'Adjustable Headrest', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (16, N'Cup Holders-Front', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (17, N'Parking Sensors', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (18, N'Rear Foldable Rear Seat', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (19, N'Bench Folding', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (20, N'USB ChargerFront & Rear', CAST(N'2023-04-16T20:23:59.923' AS DateTime), CAST(N'2023-04-16T20:23:59.923' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (21, N'Central Console ArmrestWith Storage', CAST(N'2023-04-16T20:23:59.927' AS DateTime), CAST(N'2023-04-16T20:23:59.927' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (22, N'Gear Shift Indicator', CAST(N'2023-04-16T20:23:59.927' AS DateTime), CAST(N'2023-04-16T20:23:59.927' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (23, N'Rear Curtain', CAST(N'2023-04-16T20:23:59.927' AS DateTime), CAST(N'2023-04-16T20:23:59.927' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (24, N'Luggage Hook & Net', CAST(N'2023-04-16T20:23:59.927' AS DateTime), CAST(N'2023-04-16T20:23:59.927' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (25, N'Anti-Lock Braking System', CAST(N'2023-04-16T20:25:06.317' AS DateTime), CAST(N'2023-04-16T20:25:06.317' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (26, N'Central Locking', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (27, N'Power Door Locks', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (28, N'Child Safety Locks', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (29, N'Anti-Theft Alarm', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (31, N'Driver Airbag', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (32, N'Passenger Airbag', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (33, N'Passenger Side Rear View Mirror', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (34, N'Rear Seat Belts', CAST(N'2023-04-16T20:25:06.320' AS DateTime), CAST(N'2023-04-16T20:25:06.320' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (35, N'Traction Control', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (36, N'Adjustable Seats', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (37, N'Crash Sensor', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (38, N'Engine Check Warning', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (39, N'EBD (Electronic Brakeforce Distribution)', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (40, N'Electronic Stability Control', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (41, N'Advance Safety Features', CAST(N'2023-04-16T20:25:06.323' AS DateTime), CAST(N'2023-04-16T20:25:06.323' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (42, N'Roll Over Mitigation', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (43, N'Corner Stability Control', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (44, N'Brake Disc Wiping', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (45, N'Perimetric Alarm System', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (46, N'4 smart USB chargers (A Type, Front and Rear)', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (47, N'Hill Assist', CAST(N'2023-04-16T20:25:06.327' AS DateTime), CAST(N'2023-04-16T20:25:06.327' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (49, N'Harman Touchscreen infotainment, 4 Tweeters, Radio', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (50, N'Speakers Front', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (51, N'Speakers Rear', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (52, N'Integrated 2DIN Audio', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (53, N'Bluetooth Connectivity', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (54, N'Connectivity', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (55, N'Android Auto', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (56, N'Apple CarPlay', CAST(N'2023-04-16T20:35:10.083' AS DateTime), CAST(N'2023-04-16T20:35:10.083' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (63, N'Signature Oak Brown Interior Colour Scheme', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (64, N'Premium Benecke KalikoTM Oak Brown Perforated Leather Seat Upholstery and Door Pad Inserts', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (65, N'Instrument Cluster with 17.76 cm (7") Colour TFT Display', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (66, N'5 Smart USB Chargers (A & C Type, Front and Rear)', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (67, N'Soft Touch Dashboard with Anti Reflective ''Nappa'' Grain Top Layer', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (68, N'Panoramic Sunroof', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (69, N'Dual Function LED DRLs with Turn Indicators', CAST(N'2023-04-16T20:49:14.500' AS DateTime), CAST(N'2023-04-16T20:49:14.500' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (70, N'Alloy Wheels', CAST(N'2023-04-16T20:52:06.773' AS DateTime), CAST(N'2023-04-16T20:52:06.773' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (71, N'Automatic Climate Control', CAST(N'2023-04-17T08:38:48.680' AS DateTime), CAST(N'2023-04-17T08:38:48.680' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (72, N'Rear AC Vents', CAST(N'2023-04-17T08:38:48.680' AS DateTime), CAST(N'2023-04-17T08:38:48.680' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (73, N'Adaptive cruise control with Start and Go', CAST(N'2023-04-17T08:38:48.680' AS DateTime), CAST(N'2023-04-17T08:38:48.680' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (74, N'TachometerElectronic', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (75, N'Leather Seats', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (76, N' Multi-Tripmeter', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (77, N'Digital Clock', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (78, N'Digital Clock', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (79, N'Electric Adjustable Seats', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (80, N'Rain Sensing Wiper', CAST(N'2023-04-17T08:38:48.683' AS DateTime), CAST(N'2023-04-17T08:38:48.683' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (81, N'Wheel Covers', CAST(N'2023-04-17T08:38:48.687' AS DateTime), CAST(N'2023-04-17T08:38:48.687' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (82, N'Rear Spoiler', CAST(N'2023-04-17T08:38:48.687' AS DateTime), CAST(N'2023-04-17T08:38:48.687' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (83, N'Sun Roof', CAST(N'2023-04-17T08:38:48.687' AS DateTime), CAST(N'2023-04-17T08:38:48.687' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (84, N'LED Headlights', CAST(N'2023-04-17T08:38:48.687' AS DateTime), CAST(N'2023-04-17T08:38:48.687' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (85, N'LED Taillights', CAST(N'2023-04-17T08:38:48.690' AS DateTime), CAST(N'2023-04-17T08:38:48.690' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (86, N'Rear Camera', CAST(N'2023-04-17T08:38:48.690' AS DateTime), CAST(N'2023-04-17T08:38:48.690' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (88, N'ADAS', CAST(N'2023-04-17T08:54:01.993' AS DateTime), CAST(N'2023-04-17T08:54:01.993' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (89, N'Big TouchScreen', CAST(N'2023-04-17T08:54:01.997' AS DateTime), CAST(N'2023-04-17T08:54:01.997' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (90, N'Power Adjustable Exterior Rear View Mirror', CAST(N'2023-04-17T22:51:02.633' AS DateTime), CAST(N'2023-04-17T22:51:02.633' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (91, N'Engine Start Stop Button', CAST(N'2023-04-17T22:51:02.637' AS DateTime), CAST(N'2023-04-17T22:51:02.637' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (92, N'Rear Seat Centre Arm Rest', CAST(N'2023-04-17T22:51:02.640' AS DateTime), CAST(N'2023-04-17T22:51:02.640' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (93, N'KeyLess Entry', CAST(N'2023-04-17T22:51:02.640' AS DateTime), CAST(N'2023-04-17T22:51:02.640' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (94, N'Ventilated Seats', CAST(N'2023-04-17T22:51:02.640' AS DateTime), CAST(N'2023-04-17T22:51:02.640' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (95, N'Touch Screen', CAST(N'2023-04-17T22:51:02.643' AS DateTime), CAST(N'2023-04-17T22:51:02.643' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (96, N'Cruise Control', CAST(N'2023-04-17T22:51:02.643' AS DateTime), CAST(N'2023-04-17T22:51:02.643' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (97, N'Vehicle Stability Control System', CAST(N'2023-04-17T22:51:02.647' AS DateTime), CAST(N'2023-04-17T22:51:02.647' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (98, N'Automatic Headlamps', CAST(N'2023-04-17T22:51:02.647' AS DateTime), CAST(N'2023-04-17T22:51:02.647' AS DateTime), 1)
INSERT [dbo].[CAR_Feature] ([FeatureID], [FeatureName], [CreationDate], [ModificationDate], [UserID]) VALUES (99, N'Wireless Phone Charging', CAST(N'2023-04-17T22:51:02.647' AS DateTime), CAST(N'2023-04-17T22:51:02.647' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CAR_Feature] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_FuelType] ON 

INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1002, N'Petrol', CAST(N'2023-04-16T19:37:40.663' AS DateTime), CAST(N'2023-04-16T19:37:40.663' AS DateTime), 1)
INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1003, N'Diesel', CAST(N'2023-04-16T19:37:49.780' AS DateTime), CAST(N'2023-04-16T19:37:49.780' AS DateTime), 1)
INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1004, N'CNG', CAST(N'2023-04-16T19:37:56.463' AS DateTime), CAST(N'2023-04-16T19:37:56.463' AS DateTime), 1)
INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1005, N'Electric', CAST(N'2023-04-16T19:38:04.267' AS DateTime), CAST(N'2023-04-16T19:38:04.267' AS DateTime), 1)
INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1006, N'Hybrid', CAST(N'2023-04-16T19:38:22.643' AS DateTime), CAST(N'2023-04-16T19:38:22.643' AS DateTime), 1)
INSERT [dbo].[CAR_FuelType] ([FuelTypeID], [FuelTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1008, N'CNGs', CAST(N'2023-09-29T11:19:44.967' AS DateTime), CAST(N'2023-09-29T11:19:44.967' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CAR_FuelType] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Image] ON 

INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (15, N'/Upload/ac-controls-151.webp', CAST(N'2023-04-17T18:05:07.367' AS DateTime), CAST(N'2023-04-17T18:05:07.367' AS DateTime), 1025, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (17, N'/Upload/dashboard-59.webp', CAST(N'2023-04-17T18:05:07.377' AS DateTime), CAST(N'2023-04-17T18:05:07.377' AS DateTime), 1025, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (19, N'/Upload/top-view-117.webp', CAST(N'2023-04-17T18:05:07.383' AS DateTime), CAST(N'2023-04-17T18:05:07.383' AS DateTime), 1025, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (21, N'/Upload/exterior-image-164.webp', CAST(N'2023-04-17T22:39:22.767' AS DateTime), CAST(N'2023-04-17T22:39:22.767' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (22, N'/Upload/exterior-image-168.webp', CAST(N'2023-04-17T22:39:22.773' AS DateTime), CAST(N'2023-04-17T22:39:22.773' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (23, N'/Upload/front-view-118 (1).webp', CAST(N'2023-04-17T22:39:22.777' AS DateTime), CAST(N'2023-04-17T22:39:22.777' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (24, N'/Upload/infotainment-system-main-menu-183.webp', CAST(N'2023-04-17T22:39:22.780' AS DateTime), CAST(N'2023-04-17T22:39:22.780' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (25, N'/Upload/instrument-cluster-62.webp', CAST(N'2023-04-17T22:39:22.780' AS DateTime), CAST(N'2023-04-17T22:39:22.780' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (26, N'/Upload/sun-roof-moon-roof-81.webp', CAST(N'2023-04-17T22:39:22.783' AS DateTime), CAST(N'2023-04-17T22:39:22.783' AS DateTime), 1026, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (28, N'/Upload/exterior-image-165.webp', CAST(N'2023-04-17T22:51:32.273' AS DateTime), CAST(N'2023-04-17T22:51:32.273' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (30, N'/Upload/rear-view-119 (1).webp', CAST(N'2023-04-17T22:51:32.283' AS DateTime), CAST(N'2023-04-17T22:51:32.283' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (32, N'/Upload/sun-roof-moon-roof-81.webp', CAST(N'2023-04-17T22:51:32.290' AS DateTime), CAST(N'2023-04-17T22:51:32.290' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (33, N'/Upload/wheel-42.webp', CAST(N'2023-04-17T22:51:32.297' AS DateTime), CAST(N'2023-04-17T22:51:32.297' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (37, N'/Upload/vairbag.webp', CAST(N'2023-04-17T22:58:54.673' AS DateTime), CAST(N'2023-04-17T22:58:54.673' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (38, N'/Upload/vfront.webp', CAST(N'2023-04-17T22:58:54.683' AS DateTime), CAST(N'2023-04-17T22:58:54.683' AS DateTime), 1027, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (39, N'/Upload/vairbag(1).webp', CAST(N'2023-04-18T12:35:06.603' AS DateTime), CAST(N'2023-04-18T12:35:06.603' AS DateTime), 1025, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (40, N'/Upload/front-view-118(1).webp', CAST(N'2023-04-18T12:36:49.417' AS DateTime), CAST(N'2023-04-18T12:36:49.417' AS DateTime), 1025, 1)
INSERT [dbo].[CAR_Image] ([ImageID], [PhotoPath], [CreationDate], [ModificationDate], [CarID], [UserID]) VALUES (41, N'/Upload/rear-view-119(1).webp', CAST(N'2023-04-18T12:36:49.423' AS DateTime), CAST(N'2023-04-18T12:36:49.423' AS DateTime), 1025, 1)
SET IDENTITY_INSERT [dbo].[CAR_Image] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Make] ON 

INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (1, N'Toyota', CAST(N'2023-03-24T12:51:34.140' AS DateTime), CAST(N'2023-09-12T23:45:32.930' AS DateTime), 1, N'/MakerLogoUpload/toyota.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (2, N'Ford', CAST(N'2023-03-24T12:51:34.140' AS DateTime), CAST(N'2023-09-12T23:37:25.440' AS DateTime), 1, N'/MakerLogoUpload/ford.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (3, N'Chevrolet', CAST(N'2023-03-24T12:51:34.140' AS DateTime), CAST(N'2023-09-12T23:10:44.040' AS DateTime), 1, N'/MakerLogoUpload/chervelo.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (4, N'Tesla', CAST(N'2023-03-24T12:51:34.140' AS DateTime), CAST(N'2023-09-12T23:44:51.590' AS DateTime), 1, N'/MakerLogoUpload/tesla.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (5, N'Nissan', CAST(N'2023-03-24T12:51:34.140' AS DateTime), CAST(N'2023-09-12T23:43:55.690' AS DateTime), 1, N'/MakerLogoUpload/nissan.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (8, N'Tata', CAST(N'2023-04-02T22:20:05.907' AS DateTime), CAST(N'2023-09-12T23:36:26.210' AS DateTime), 1, N'/MakerLogoUpload/tata.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (1014, N'Maruti Suzuki', CAST(N'2023-04-13T19:00:06.363' AS DateTime), CAST(N'2023-09-12T23:42:51.753' AS DateTime), 1, N'/MakerLogoUpload/Maruti-Suzuki-Logo-Transparent-Background.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (1015, N'Mahindra', CAST(N'2023-04-16T19:39:31.993' AS DateTime), CAST(N'2023-09-12T23:41:47.483' AS DateTime), 1, N'/MakerLogoUpload/Mahindra-SUV.png')
INSERT [dbo].[CAR_Make] ([MakeID], [MakeName], [CreationDate], [ModificationDate], [UserID], [PhotoPath]) VALUES (1016, N'Hyundai', CAST(N'2023-04-17T22:41:05.467' AS DateTime), CAST(N'2023-09-12T23:38:10.653' AS DateTime), 1, N'/MakerLogoUpload/hyundai.png')
SET IDENTITY_INSERT [dbo].[CAR_Make] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Review] ON 

INSERT [dbo].[CAR_Review] ([ReviewID], [CarID], [ClientID], [ReviewText], [Rating], [CreationDate], [ModificationDate]) VALUES (10, 1026, NULL, N'Nice', 5, CAST(N'2023-09-13T11:44:27.920' AS DateTime), CAST(N'2023-09-13T11:44:27.920' AS DateTime))
INSERT [dbo].[CAR_Review] ([ReviewID], [CarID], [ClientID], [ReviewText], [Rating], [CreationDate], [ModificationDate]) VALUES (11, 1025, 1004, N'Best Car', 5, CAST(N'2023-09-13T11:47:39.090' AS DateTime), CAST(N'2023-09-13T11:47:39.090' AS DateTime))
INSERT [dbo].[CAR_Review] ([ReviewID], [CarID], [ClientID], [ReviewText], [Rating], [CreationDate], [ModificationDate]) VALUES (12, 1025, 1004, N'demo', 5, CAST(N'2023-09-13T11:49:36.770' AS DateTime), CAST(N'2023-09-13T11:49:36.770' AS DateTime))
INSERT [dbo].[CAR_Review] ([ReviewID], [CarID], [ClientID], [ReviewText], [Rating], [CreationDate], [ModificationDate]) VALUES (13, 1026, 1004, N'w', 5, CAST(N'2023-09-13T11:52:08.193' AS DateTime), CAST(N'2023-09-13T11:52:08.193' AS DateTime))
INSERT [dbo].[CAR_Review] ([ReviewID], [CarID], [ClientID], [ReviewText], [Rating], [CreationDate], [ModificationDate]) VALUES (1010, 1026, 2, N'Average', 2, CAST(N'2023-09-14T16:39:56.373' AS DateTime), CAST(N'2023-09-14T16:39:56.373' AS DateTime))
SET IDENTITY_INSERT [dbo].[CAR_Review] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_TransmissionType] ON 

INSERT [dbo].[CAR_TransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (1, N'Automatic', CAST(N'2023-03-27T22:38:32.537' AS DateTime), CAST(N'2023-03-27T22:38:32.537' AS DateTime), 1)
INSERT [dbo].[CAR_TransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (2, N'Manual', CAST(N'2023-03-27T22:38:32.537' AS DateTime), CAST(N'2023-03-27T22:38:32.537' AS DateTime), 1)
INSERT [dbo].[CAR_TransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (3, N'CVT', CAST(N'2023-03-27T22:38:32.537' AS DateTime), CAST(N'2023-03-27T22:38:32.537' AS DateTime), 1)
INSERT [dbo].[CAR_TransmissionType] ([TransmissionTypeID], [TransmissionTypeName], [CreationDate], [ModificationDate], [UserID]) VALUES (4, N'DCT', CAST(N'2023-03-27T22:38:32.537' AS DateTime), CAST(N'2023-03-27T22:38:32.537' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CAR_TransmissionType] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Type] ON 

INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (1, N'Sedan', CAST(N'2023-03-24T12:54:25.700' AS DateTime), CAST(N'2023-03-24T12:54:25.700' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (2, N'Coupe', CAST(N'2023-03-24T12:54:25.700' AS DateTime), CAST(N'2023-03-24T12:54:25.700' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (3, N'Sports Car', CAST(N'2023-03-24T12:54:25.700' AS DateTime), CAST(N'2023-03-24T12:54:25.700' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (4, N'Electric', CAST(N'2023-03-24T12:54:25.700' AS DateTime), CAST(N'2023-03-24T12:54:25.700' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (5, N'Supercar', CAST(N'2023-03-24T12:54:25.700' AS DateTime), CAST(N'2023-03-24T12:54:25.700' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (6, N'MUV', CAST(N'2023-03-27T22:13:24.190' AS DateTime), CAST(N'2023-03-27T22:13:24.190' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (7, N'SUV', CAST(N'2023-03-27T22:13:24.190' AS DateTime), CAST(N'2023-03-27T22:13:24.190' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (8, N'Truck', CAST(N'2023-03-27T22:13:24.190' AS DateTime), CAST(N'2023-03-27T22:13:24.190' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (9, N'Hatchback', CAST(N'2023-03-27T22:13:24.190' AS DateTime), CAST(N'2023-03-27T22:13:24.190' AS DateTime), 1)
INSERT [dbo].[CAR_Type] ([TypeID], [TypeName], [CreationDate], [ModificationDate], [UseriD]) VALUES (10, N'Crossover', CAST(N'2023-03-27T22:13:24.190' AS DateTime), CAST(N'2023-03-27T22:13:24.190' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[CAR_Type] OFF
GO
SET IDENTITY_INSERT [dbo].[CAR_Variant] ON 

INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (15, N'XE', CAST(N'2023-04-16T19:50:03.273' AS DateTime), CAST(N'2023-04-16T19:50:03.273' AS DateTime), 1, 8)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (16, N'XM', CAST(N'2023-04-16T19:50:03.280' AS DateTime), CAST(N'2023-04-16T19:50:03.280' AS DateTime), 1, 8)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (17, N'XT', CAST(N'2023-04-16T19:50:03.283' AS DateTime), CAST(N'2023-04-16T19:50:03.283' AS DateTime), 1, 8)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (18, N'XZ', CAST(N'2023-04-16T19:50:03.287' AS DateTime), CAST(N'2023-04-16T19:50:03.287' AS DateTime), 1, 8)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (19, N'XZ+', CAST(N'2023-04-16T19:50:03.287' AS DateTime), CAST(N'2023-04-16T19:50:03.287' AS DateTime), 1, 8)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (20, N'MX', CAST(N'2023-04-17T08:30:01.590' AS DateTime), CAST(N'2023-04-17T08:30:01.590' AS DateTime), 1, 1015)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (21, N'AX3', CAST(N'2023-04-17T08:30:01.590' AS DateTime), CAST(N'2023-04-17T08:30:01.590' AS DateTime), 1, 1015)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (22, N'AX5', CAST(N'2023-04-17T08:30:01.593' AS DateTime), CAST(N'2023-04-17T08:30:01.593' AS DateTime), 1, 1015)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (23, N'AX7', CAST(N'2023-04-17T08:30:01.593' AS DateTime), CAST(N'2023-04-17T08:30:01.593' AS DateTime), 1, 1015)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (24, N'EX', CAST(N'2023-04-17T22:43:27.317' AS DateTime), CAST(N'2023-04-17T22:43:27.317' AS DateTime), 1, 1016)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (25, N'S', CAST(N'2023-04-17T22:43:27.323' AS DateTime), CAST(N'2023-04-17T22:43:27.323' AS DateTime), 1, 1016)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (26, N'SX', CAST(N'2023-04-17T22:43:27.323' AS DateTime), CAST(N'2023-04-17T22:43:27.323' AS DateTime), 1, 1016)
INSERT [dbo].[CAR_Variant] ([VariantID], [VariantName], [CreationDate], [ModificationDate], [UserID], [MakeID]) VALUES (27, N'SX Opt', CAST(N'2023-04-17T22:43:27.323' AS DateTime), CAST(N'2023-04-17T22:43:27.323' AS DateTime), 1, 1016)
SET IDENTITY_INSERT [dbo].[CAR_Variant] OFF
GO
SET IDENTITY_INSERT [dbo].[Client_Favourite] ON 

INSERT [dbo].[Client_Favourite] ([FavouriteID], [FavouriteCarID], [ClientID]) VALUES (9, 1025, 2)
INSERT [dbo].[Client_Favourite] ([FavouriteID], [FavouriteCarID], [ClientID]) VALUES (10, 1025, 1004)
SET IDENTITY_INSERT [dbo].[Client_Favourite] OFF
GO
SET IDENTITY_INSERT [dbo].[MST_Car] ON 

INSERT [dbo].[MST_Car] ([CarID], [MakeID], [TypeID], [UserID], [Year], [Name], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (1025, 8, 7, 1, 2018, N'Harrier', CAST(N'2023-04-16T19:48:22.293' AS DateTime), CAST(N'2023-04-16T19:48:22.293' AS DateTime), N'/Upload/Harrier.jpg')
INSERT [dbo].[MST_Car] ([CarID], [MakeID], [TypeID], [UserID], [Year], [Name], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (1026, 1015, 7, 1, 2021, N'XUV700', CAST(N'2023-04-17T08:28:50.667' AS DateTime), CAST(N'2023-04-17T08:28:50.667' AS DateTime), N'/Upload/Xuv700.webp')
INSERT [dbo].[MST_Car] ([CarID], [MakeID], [TypeID], [UserID], [Year], [Name], [CreationDate], [ModificationDate], [PhotoPath]) VALUES (1027, 1016, 1, 1, 2023, N'Verna', CAST(N'2023-04-17T22:42:24.133' AS DateTime), CAST(N'2023-04-17T22:42:24.133' AS DateTime), N'/Upload/verna.jpg')
SET IDENTITY_INSERT [dbo].[MST_Car] OFF
GO
SET IDENTITY_INSERT [dbo].[MST_Client] ON 

INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (1, N'prashant@gmail.com', N'Prashant')
INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (2, N'aditya@gmail.com', N'Aditya')
INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (1002, N'prasant@gmail.com', N'Prashant')
INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (1003, N'prashant@gmail.com', N'Prashant')
INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (1004, N'prashant@gmail.com', N'Prashant')
INSERT [dbo].[MST_Client] ([ClientID], [Email], [Password]) VALUES (1005, N'aditya2@gmail.com', N'Aditya')
SET IDENTITY_INSERT [dbo].[MST_Client] OFF
GO
SET IDENTITY_INSERT [dbo].[MST_User] ON 

INSERT [dbo].[MST_User] ([UserID], [UserName], [Password], [FirstName], [LastName], [Email], [MobileNumber], [PhotoPath], [CreationDate], [ModificationDate]) VALUES (1, N'admin', N'admin', NULL, NULL, NULL, NULL, NULL, CAST(N'2023-03-27T22:12:46.500' AS DateTime), CAST(N'2023-03-27T22:12:46.500' AS DateTime))
SET IDENTITY_INSERT [dbo].[MST_User] OFF
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature] ADD  CONSTRAINT [DF__CAR_Featu__Creat__286302EC]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature] ADD  CONSTRAINT [DF__CAR_Featu__Modif__29572725]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseTransmissionType] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseTransmissionType] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant] ADD  CONSTRAINT [DF__CAR_Varia__Creat__2C3393D0]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant] ADD  CONSTRAINT [DF__CAR_Varia__Modif__2D27B809]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Dealer] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Dealer] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Feature] ADD  CONSTRAINT [DF_CAR_Feature_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Feature] ADD  CONSTRAINT [DF_CAR_Feature_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_FuelType] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_FuelType] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Image] ADD  CONSTRAINT [DF__CAR_Image__Creat__70A8B9AE]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Image] ADD  CONSTRAINT [DF__CAR_Image__Modif__719CDDE7]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Make] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Make] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Review] ADD  CONSTRAINT [DF__CAR_Revie__Creat__44FF419A]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Review] ADD  CONSTRAINT [DF__CAR_Revie__Modif__45F365D3]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_TransmissionType] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_TransmissionType] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Type] ADD  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Type] ADD  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_Variant] ADD  CONSTRAINT [DF_CAR_Variant_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[CAR_Variant] ADD  CONSTRAINT [DF_CAR_Variant_ModificationDate]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_Car] ADD  CONSTRAINT [DF__Car__CreationDat__4F7CD00D]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_Car] ADD  CONSTRAINT [DF__Car__Modificatio__5070F446]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[MST_User] ADD  CONSTRAINT [DF__MST_User__Creati__38996AB5]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[MST_User] ADD  CONSTRAINT [DF__MST_User__Modifi__398D8EEE]  DEFAULT (getdate()) FOR [ModificationDate]
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature]  WITH CHECK ADD  CONSTRAINT [FK_CAR_CarWiseFeature_CAR_CarWiseVariant] FOREIGN KEY([VariantID])
REFERENCES [dbo].[CAR_Variant] ([VariantID])
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature] CHECK CONSTRAINT [FK_CAR_CarWiseFeature_CAR_CarWiseVariant]
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Feature_MST_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature] CHECK CONSTRAINT [FK_CAR_Feature_MST_Car]
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Feature_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_CarWiseFeature] CHECK CONSTRAINT [FK_CAR_Feature_MST_User]
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType]  WITH CHECK ADD  CONSTRAINT [FK_CAR_FuelType_MST_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType] CHECK CONSTRAINT [FK_CAR_FuelType_MST_Car]
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType]  WITH CHECK ADD  CONSTRAINT [FK_CAR_FuelType_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_CarWiseFuelType] CHECK CONSTRAINT [FK_CAR_FuelType_MST_User]
GO
ALTER TABLE [dbo].[CAR_CarWiseTransmissionType]  WITH CHECK ADD  CONSTRAINT [FK_CAR_CarWiseTransmissionType_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_CarWiseTransmissionType] CHECK CONSTRAINT [FK_CAR_CarWiseTransmissionType_MST_User]
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant]  WITH CHECK ADD  CONSTRAINT [FK_CAR_CarWiseVariant_CAR_Variant] FOREIGN KEY([VariantID])
REFERENCES [dbo].[CAR_Variant] ([VariantID])
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant] CHECK CONSTRAINT [FK_CAR_CarWiseVariant_CAR_Variant]
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Variant_MST_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant] CHECK CONSTRAINT [FK_CAR_Variant_MST_Car]
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Variant_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_CarWiseVariant] CHECK CONSTRAINT [FK_CAR_Variant_MST_User]
GO
ALTER TABLE [dbo].[CAR_Dealer]  WITH CHECK ADD FOREIGN KEY([MakeID])
REFERENCES [dbo].[CAR_Make] ([MakeID])
GO
ALTER TABLE [dbo].[CAR_Dealer]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Dealer_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_Dealer] CHECK CONSTRAINT [FK_CAR_Dealer_MST_User]
GO
ALTER TABLE [dbo].[CAR_Feature]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Feature_MST_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_Feature] CHECK CONSTRAINT [FK_CAR_Feature_MST_User1]
GO
ALTER TABLE [dbo].[CAR_FuelType]  WITH CHECK ADD  CONSTRAINT [FK_CAR_FuelType_MST_User1] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_FuelType] CHECK CONSTRAINT [FK_CAR_FuelType_MST_User1]
GO
ALTER TABLE [dbo].[CAR_Image]  WITH CHECK ADD  CONSTRAINT [FK__CAR_Image__CarID__74794A92] FOREIGN KEY([CarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[CAR_Image] CHECK CONSTRAINT [FK__CAR_Image__CarID__74794A92]
GO
ALTER TABLE [dbo].[CAR_Image]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Image_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_Image] CHECK CONSTRAINT [FK_CAR_Image_MST_User]
GO
ALTER TABLE [dbo].[CAR_Review]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Review_MST_Car] FOREIGN KEY([CarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[CAR_Review] CHECK CONSTRAINT [FK_CAR_Review_MST_Car]
GO
ALTER TABLE [dbo].[CAR_TransmissionType]  WITH CHECK ADD  CONSTRAINT [FK_CAR_TransmissionType_MST_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_TransmissionType] CHECK CONSTRAINT [FK_CAR_TransmissionType_MST_User]
GO
ALTER TABLE [dbo].[CAR_Type]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Type_MST_User] FOREIGN KEY([UseriD])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[CAR_Type] CHECK CONSTRAINT [FK_CAR_Type_MST_User]
GO
ALTER TABLE [dbo].[CAR_Variant]  WITH CHECK ADD  CONSTRAINT [FK_CAR_Variant_CAR_Make] FOREIGN KEY([MakeID])
REFERENCES [dbo].[CAR_Make] ([MakeID])
GO
ALTER TABLE [dbo].[CAR_Variant] CHECK CONSTRAINT [FK_CAR_Variant_CAR_Make]
GO
ALTER TABLE [dbo].[Client_Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Client_Favourite_MST_Car] FOREIGN KEY([FavouriteCarID])
REFERENCES [dbo].[MST_Car] ([CarID])
GO
ALTER TABLE [dbo].[Client_Favourite] CHECK CONSTRAINT [FK_Client_Favourite_MST_Car]
GO
ALTER TABLE [dbo].[Client_Favourite]  WITH CHECK ADD  CONSTRAINT [FK_Client_Favourite_MST_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[MST_Client] ([ClientID])
GO
ALTER TABLE [dbo].[Client_Favourite] CHECK CONSTRAINT [FK_Client_Favourite_MST_Client]
GO
ALTER TABLE [dbo].[MST_Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__MakeID__48CFD27E] FOREIGN KEY([MakeID])
REFERENCES [dbo].[CAR_Make] ([MakeID])
GO
ALTER TABLE [dbo].[MST_Car] CHECK CONSTRAINT [FK__Car__MakeID__48CFD27E]
GO
ALTER TABLE [dbo].[MST_Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__TypeID__49C3F6B7] FOREIGN KEY([TypeID])
REFERENCES [dbo].[CAR_Type] ([TypeID])
GO
ALTER TABLE [dbo].[MST_Car] CHECK CONSTRAINT [FK__Car__TypeID__49C3F6B7]
GO
ALTER TABLE [dbo].[MST_Car]  WITH CHECK ADD  CONSTRAINT [FK__Car__UserID__4E88ABD4] FOREIGN KEY([UserID])
REFERENCES [dbo].[MST_User] ([UserID])
GO
ALTER TABLE [dbo].[MST_Car] CHECK CONSTRAINT [FK__Car__UserID__4E88ABD4]
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFeature_DeleteByPK]
	  @FeatureID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_CarWiseFeature]
WHERE [DBO].[CAR_CarWiseFeature].[FeatureID] = @FeatureID
AND [dbo].[CAR_CarWiseFeature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFeature_Insert]
	@FeatureName       nvarchar(100),
	@UserID int,
	@VariantID int,
	@CarID int


AS

INSERT INTO [dbo].[CAR_CarWiseFeature]
(
	FeatureName,
	UserID,
	VariantID,
	CarID
)
VALUES
(
    @FeatureName,
	@UserID,
	@VariantID,
	@CarID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFeature_SelectAll]
@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_CarWiseFeature].[FeatureID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_CarWiseFeature].[FeatureName],
		[dbo].[CAR_CarWiseFeature].[CreationDate],
		[dbo].[CAR_CarWiseFeature].[ModificationDate]
	FROM [dbo].[CAR_CarWiseFeature]

	INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseFeature].CarID = [dbo].[MST_Car].CarID
	INNER JOIN [dbo].[CAR_Variant] ON [dbo].[CAR_CarWiseFeature].VariantID = [dbo].[CAR_Variant].VariantID

    WHERE [dbo].[CAR_CarWiseFeature].[UserID]=@UserID

	ORDER BY [dbo].[CAR_CarWiseFeature].[FeatureName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_SelectByCarIDFeatureName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PR_CAR_CarWiseFeature_SelectByCarIDFeatureName]
@CarID    nvarchar(50),
@FeatureName		nvarchar(50),
@UserID		int

AS

SELECT
[dbo].[CAR_CarWiseFeature].[FeatureID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_CarWiseFeature].[FeatureName],
		[dbo].[CAR_CarWiseFeature].[CreationDate],
		[dbo].[CAR_CarWiseFeature].[ModificationDate]

FROM [dbo].[CAR_CarWiseFeature]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseFeature].CarID = [dbo].[MST_Car].CarID
	INNER JOIN [dbo].[CAR_Variant] ON [dbo].[CAR_CarWiseFeature].VariantID = [dbo].[CAR_Variant].VariantID


WHERE (@CarID IS NULL OR [dbo].[MST_Car].[CarID] like '%'+@CarID+'%')
AND (@FeatureName IS NULL OR [dbo].[CAR_CarWiseFeature].[FeatureName] like '%'+@FeatureName+'%')
and [dbo].[CAR_CarWiseFeature].[UserID]=@UserID
--AND   (@CountryCode IS NULL OR [dbo].[CAR_CarWiseFeature].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFeature_SelectByPK]
	@FeatureID int,
	@UserID int

AS
	SELECT 
		[dbo].[CAR_CarWiseFeature].[FeatureID],
		[dbo].[CAR_CarWiseFeature].[CarID],
		[dbo].[CAR_CarWiseFeature].[VariantID],
		[dbo].[CAR_CarWiseFeature].[FeatureName],
		[dbo].[CAR_CarWiseFeature].[CreationDate],
		[dbo].[CAR_CarWiseFeature].[ModificationDate]
	FROM 
		[dbo].[CAR_CarWiseFeature]
	WHERE 
		[dbo].[CAR_CarWiseFeature].[FeatureID] = @FeatureID
		and [dbo].[CAR_CarWiseFeature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFeature_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFeature_UpdateByPK]
    @FeatureID     int,
    @FeatureName   nvarchar(50),
	@UserID int,
	@VariantID int,
	@CarID int

AS
UPDATE [dbo].[CAR_CarWiseFeature]
SET    [dbo].[CAR_CarWiseFeature].[FeatureName] = @FeatureName,
	    [dbo].[CAR_CarWiseFeature].[CarID]=@CarID,
	    [dbo].[CAR_CarWiseFeature].[VariantID]=@VariantID,
       [dbo].[CAR_CarWiseFeature].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_CarWiseFeature].[FeatureID] = @FeatureID
    and [dbo].[CAR_CarWiseFeature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_DeleteByPK]
	  @FuelTypeID			  int,
	  @UserID				  int

AS

DELETE 
FROM [DBO].[CAR_CarWiseFuelType]
WHERE [DBO].[CAR_CarWiseFuelType].[FuelTypeID]=@FuelTypeID
AND [dbo].[CAR_CarWiseFuelType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_Insert]
	@FuelTypeName      nvarchar(100),
	@CarID int,
	@UserID int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[CAR_CarWiseFuelType]
(
	FuelTypeName,
	CarID,
	UserID
	--CreationDate,
	--ModificationDate
)
VALUES
(
    @FuelTypeName,
	@CarID,
	@UserID
	--@CreationDate,
	--@ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_SelectAll]

@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_CarWiseFuelType].[FuelTypeID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_CarWiseFuelType].[FuelTypeName],
		[dbo].[CAR_CarWiseFuelType].[CreationDate],
		[dbo].[CAR_CarWiseFuelType].[ModificationDate]
	FROM [dbo].[CAR_CarWiseFuelType]

	INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseFuelType].CarID = [dbo].[MST_Car].CarID

	WHERE [dbo].[CAR_CarWiseFuelType].[UserID]=@UserID

	ORDER BY [dbo].[CAR_CarWiseFuelType].[FuelTypeName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_SelectByFuelTypeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_SelectByFuelTypeName]
@FuelTypeName    nvarchar(50),
@UserID			Int

AS

SELECT
	[dbo].[CAR_CarWiseFuelType].[FuelTypeID],
	[dbo].[CAR_CarWiseFuelType].[FuelTypeName],
    [dbo].[CAR_CarWiseFuelType].[CreationDate],
    [dbo].[CAR_CarWiseFuelType].[ModificationDate]

FROM [dbo].[CAR_CarWiseFuelType]


INNER JOIN [dbo].[MST_User]
ON		   [dbo].[MST_User].[UserId] = [CAR_CarWiseFuelType].[UserId]


WHERE (@FuelTypeName IS NULL OR [dbo].[CAR_CarWiseFuelType].[FuelTypeName] like '%'+@FuelTypeName+'%')
And   [dbo].[CAR_CarWiseFuelType].[UserId]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_SelectByPK]
	@FuelTypeID int,
	@UserID int

AS

SELECT
	[dbo].[CAR_CarWiseFuelType].[FuelTypeID],
	[dbo].[MST_Car].[Name],
	[dbo].[CAR_CarWiseFuelType].[FuelTypeName],
	[dbo].[CAR_CarWiseFuelType].[CreationDate],
	[dbo].[CAR_CarWiseFuelType].[ModificationDate]
FROM
	[dbo].[CAR_CarWiseFuelType]
	INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseFuelType].CarID = [dbo].[MST_Car].CarID
WHERE
	[dbo].[CAR_CarWiseFuelType].[FuelTypeID] = @FuelTypeID
	and [dbo].[CAR_CarWiseFuelType].[UserID]=@UserID

GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseFuelType_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseFuelType_UpdateByPK]
	@FuelTypeID int,
	@CarID int,
	@UserID int,
	@FuelTypeName	nvarchar(50)

AS

UPDATE [dbo].[CAR_CarWiseFuelType]
SET	   
       [dbo].[CAR_CarWiseFuelType].[FuelTypeName] = @FuelTypeName,
	   [dbo].[CAR_CarWiseFuelType].[CarID] = @CarID,
	   [dbo].[CAR_CarWiseFuelType].[ModificationDate] = GETDATE()

WHERE  [dbo].[CAR_CarWiseFuelType].[FuelTypeID] = @FuelTypeID 
AND [dbo].[CAR_CarWiseFuelType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_DeleteByPK]
    @TransmissionTypeID int,
	@UserID				  int
AS
BEGIN
    DELETE FROM [dbo].[CAR_CarWiseTransmissionType]
    WHERE [TransmissionTypeID] = @TransmissionTypeID
	AND [dbo].[CAR_CarWiseTransmissionType].[UserID]=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_Insert]
	@TransmissionTypeName      nvarchar(100),
	@CarID int,
	@UserID int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[CAR_CarWiseTransmissionType]
(
	TransmissionTypeName,
	CarID,
	UserID
	--CreationDate,
	--ModificationDate
)
VALUES
(
    @TransmissionTypeName,
	@CarID,
	@UserID
	--@CreationDate,
	--@ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_SelectAll]

@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName],
		[dbo].[CAR_CarWiseTransmissionType].[CreationDate],
		[dbo].[CAR_CarWiseTransmissionType].[ModificationDate]
	FROM [dbo].[CAR_CarWiseTransmissionType]

	INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseTransmissionType].CarID = [dbo].[MST_Car].CarID

	WHERE [dbo].[CAR_CarWiseTransmissionType].[UserID]=@UserID

	ORDER BY [dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_SelectByPK]
	@TransmissionTypeID int,
	@UserID int

AS

SELECT
	[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeID],
	[dbo].[MST_Car].[Name],
	[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName],
	[dbo].[CAR_CarWiseTransmissionType].[CreationDate],
	[dbo].[CAR_CarWiseTransmissionType].[ModificationDate]
FROM
	[dbo].[CAR_CarWiseTransmissionType]
	INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseTransmissionType].CarID = [dbo].[MST_Car].CarID
WHERE
	[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeID] = @TransmissionTypeID
	and [dbo].[CAR_CarWiseTransmissionType].[UserID]=@UserID

GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_SelectByTransmissionTypeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_SelectByTransmissionTypeName]
@TransmissionTypeName    nvarchar(50),
@CarID    nvarchar(50),
@UserID			Int

AS

SELECT
	[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeID],
			[dbo].[MST_Car].[Name],
	[dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName],
    [dbo].[CAR_CarWiseTransmissionType].[CreationDate],
    [dbo].[CAR_CarWiseTransmissionType].[ModificationDate]

FROM [dbo].[CAR_CarWiseTransmissionType]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseTransmissionType].CarID = [dbo].[MST_Car].CarID

INNER JOIN [dbo].[MST_User]
ON		   [dbo].[MST_User].[UserId] = [CAR_CarWiseTransmissionType].[UserId]


WHERE 
 (@CarID IS NULL OR [dbo].[MST_Car].[CarID] like '%'+@CarID+'%')
And (@TransmissionTypeName IS NULL OR [dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName] like '%'+@TransmissionTypeName+'%')
And   [dbo].[CAR_CarWiseTransmissionType].[UserId]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseTransmissionType_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_CAR_CarWiseTransmissionType_UpdateByPK]
	@TransmissionTypeID int,
	@CarID int,
	@UserID int,
	@TransmissionTypeName	nvarchar(50)

AS

UPDATE [dbo].[CAR_CarWiseTransmissionType]
SET	   
       [dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeName] = @TransmissionTypeName,
	   [dbo].[CAR_CarWiseTransmissionType].[CarID] = @CarID,
	   [dbo].[CAR_CarWiseTransmissionType].[ModificationDate] = GETDATE()

WHERE  [dbo].[CAR_CarWiseTransmissionType].[TransmissionTypeID] = @TransmissionTypeID 
AND [dbo].[CAR_CarWiseTransmissionType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseVariant_DeleteByPK]
	  @CarWiseVariantID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_CarWiseVariant]
WHERE [DBO].[CAR_CarWiseVariant].[CarWiseVariantID] = @CarWiseVariantID
AND [dbo].[CAR_CarWiseVariant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseVariant_Insert]
	@VariantID     int,
	@UserID				int,
	@CarID              int,
	@Price			  decimal(18, 2)

AS

INSERT INTO [dbo].[CAR_CarWiseVariant]
(
	VariantID,
	UserID,
	CarID,
	Price
)
VALUES
(
    @VariantID,
	@UserID,
	@CarID,
	@Price
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseVariant_SelectAll]

@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_CarWiseVariant].[CarWiseVariantID],
[dbo].[CAR_CarWiseVariant].[Price],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_CarWiseVariant].[CreationDate],
		[dbo].[CAR_CarWiseVariant].[ModificationDate]
	FROM [dbo].[CAR_CarWiseVariant]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseVariant].CarID = [dbo].[MST_Car].CarID
INNER JOIN [dbo].[CAR_Variant] ON [dbo].[CAR_CarWiseVariant].VariantID = [dbo].[CAR_Variant].VariantID

 WHERE [dbo].[CAR_CarWiseVariant].[UserID]=@UserID

	ORDER BY [dbo].[CAR_Variant].[VariantName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_SelectByCarIDVariantName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_CarWiseVariant_SelectByCarIDVariantName]
@CarID    nvarchar(50),
@CarWiseVariantID		int,
@UserID		int

AS

SELECT
[dbo].[CAR_CarWiseVariant].[CarWiseVariantID],
[dbo].[CAR_CarWiseVariant].[VariantID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_CarWiseVariant].[Price],
		[dbo].[CAR_CarWiseVariant].[CreationDate],
		[dbo].[CAR_CarWiseVariant].[ModificationDate]

FROM [dbo].[CAR_CarWiseVariant]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_CarWiseVariant].CarID = [dbo].[MST_Car].CarID
INNER JOIN [dbo].[CAR_Variant] ON [dbo].[CAR_CarWiseVariant].VariantID = [dbo].[CAR_Variant].VariantID

WHERE (@CarID IS NULL OR [dbo].[MST_Car].[CarID] like '%'+@CarID+'%')
AND @CarWiseVariantID IS NULL OR [dbo].[CAR_CarWiseVariant].[CarWiseVariantID]=@CarWiseVariantID
and [dbo].[CAR_CarWiseVariant].[UserID]=@UserID
--AND   (@CountryCode IS NULL OR [dbo].[CAR_CarWiseVariant].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseVariant_SelectByPK]
	@CarWiseVariantID int,
	@UserID int
AS
	SELECT 
		[dbo].[CAR_CarWiseVariant].[CarWiseVariantID],
		[dbo].[CAR_CarWiseVariant].[CarID],
		[dbo].[CAR_CarWiseVariant].[Price],
		[dbo].[CAR_CarWiseVariant].[VariantID],
		[dbo].[CAR_CarWiseVariant].[CreationDate],
		[dbo].[CAR_CarWiseVariant].[ModificationDate]
	FROM 
		[dbo].[CAR_CarWiseVariant]
	WHERE 
		[dbo].[CAR_CarWiseVariant].[CarWiseVariantID] = @CarWiseVariantID
		 AND [dbo].[CAR_CarWiseVariant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_SelectForDropDownByCarID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_CarWiseVariant_SelectForDropDown]

create procedure [dbo].[PR_CAR_CarWiseVariant_SelectForDropDownByCarID]
@CarID int

AS

SELECT
		[dbo].[CAR_CarWiseVariant].[VariantID],
		[dbo].[CAR_Variant].[VariantName]
FROM	[dbo].[CAR_CarWiseVariant]


INNER JOIN [dbo].[CAR_Variant] ON [dbo].[CAR_CarWiseVariant].VariantID = [dbo].[CAR_Variant].VariantID
--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_CarWiseVariant].[UserId]

WHERE [dbo].[CAR_CarWiseVariant].[CarID]=@CarID

ORDER BY [dbo].[CAR_Variant].[VariantName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_CarWiseVariant_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_CarWiseVariant_UpdateByPK]
    @VariantID     int,
    @CarWiseVariantID   int,
	@UserID int,
	@CarID int,
	@Price decimal(18, 2)
AS
UPDATE [dbo].[CAR_CarWiseVariant]
SET    [dbo].[CAR_CarWiseVariant].[VariantID] = @VariantID,
[dbo].[CAR_CarWiseVariant].[CarID] = @CarID,
[dbo].[CAR_CarWiseVariant].[Price] = @Price,
       [dbo].[CAR_CarWiseVariant].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_CarWiseVariant].[CarWiseVariantID] = @CarWiseVariantID
 AND [dbo].[CAR_CarWiseVariant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Dealer_DeleteByPK]
	  @DealerID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Dealer]
WHERE [DBO].[CAR_Dealer].[DealerID] = @DealerID
AND [dbo].[CAR_Dealer].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Dealer_Insert]
	@MakeID        int,
	@UserID		   int,
	@Name          nvarchar(100),
	@Address       nvarchar(200),
	@City          nvarchar(100),
	@State         nvarchar(100),
	@Country       nvarchar(100),
	@Phone         nvarchar(20)
AS
BEGIN
	INSERT INTO [dbo].[Car_Dealer]
	(
		MakeID,
		UserID,
		Name,
		Address,
		City,
		State,
		Country,
		Phone
	)
	VALUES
	(
		@MakeID,
		@UserID,
		@Name,
		@Address,
		@City,
		@State,
		@Country,
		@Phone
	)
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Dealer_SelectAll]

@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_Dealer].[DealerID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Dealer].[Name],
		[dbo].[CAR_Dealer].[Address],
		[dbo].[CAR_Dealer].[City],
		[dbo].[CAR_Dealer].[State],
		[dbo].[CAR_Dealer].[Country],
		[dbo].[CAR_Dealer].[Phone],
		[dbo].[CAR_Dealer].[CreationDate],
		[dbo].[CAR_Dealer].[ModificationDate]
	FROM [dbo].[CAR_Dealer]
	INNER JOIN [dbo].[CAR_Make]
		ON [dbo].[CAR_Dealer].[MakeID] = [dbo].[CAR_Make].[MakeID]

	  WHERE [dbo].[CAR_Dealer].[UserID]=@UserID

	ORDER BY [dbo].[CAR_Dealer].[DealerID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_SelectByMakeIDNameCountryStateCity]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_Dealer_SelectByMakeIDNameCountryStateCity]
@MakeID    nvarchar(50),
@Name		nvarchar(50),
@Country    nvarchar(50),
@State    nvarchar(50),
@City   nvarchar(50),
@UserID		int

AS

SELECT
		[dbo].[CAR_Dealer].[DealerID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Dealer].[Name],
		[dbo].[CAR_Dealer].[Address],
		[dbo].[CAR_Dealer].[City],
		[dbo].[CAR_Dealer].[State],
		[dbo].[CAR_Dealer].[Country],
		[dbo].[CAR_Dealer].[Phone],
		[dbo].[CAR_Dealer].[CreationDate],
		[dbo].[CAR_Dealer].[ModificationDate]

FROM [dbo].[CAR_Dealer]

INNER JOIN [dbo].[CAR_Make] ON [dbo].[CAR_Dealer].MakeID = [dbo].[CAR_Make].MakeID


WHERE (@MakeID IS NULL OR [dbo].[CAR_Make].[MakeID] like '%'+@MakeID+'%')
AND (@Name IS NULL OR [dbo].[CAR_Dealer].[Name] like '%'+@Name+'%')
AND (@Country IS NULL OR [dbo].[CAR_Dealer].[Country] like '%'+@Country+'%')
AND (@State IS NULL OR [dbo].[CAR_Dealer].[State] like '%'+@State+'%')
AND (@City IS NULL OR [dbo].[CAR_Dealer].[City] like '%'+@City+'%')
and [dbo].[CAR_Dealer].[UserID]=@UserID
--AND   (@CountryCode IS NULL OR [dbo].[CAR_Dealer].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Dealer_SelectByPK]
	@DealerID int,
	@UserID int

AS

SELECT
	[dbo].[CAR_Dealer].[DealerID],
	[dbo].[CAR_Dealer].[MakeID],
	[dbo].[CAR_Dealer].[Name],
	[dbo].[CAR_Dealer].[Address],
	[dbo].[CAR_Dealer].[City],
	[dbo].[CAR_Dealer].[State],
	[dbo].[CAR_Dealer].[Country],
	[dbo].[CAR_Dealer].[Phone],
	[dbo].[CAR_Dealer].[CreationDate],
	[dbo].[CAR_Dealer].[ModificationDate]
FROM
	[dbo].[CAR_Dealer]
WHERE
	[dbo].[CAR_Dealer].[DealerID] = @DealerID
	 AND [dbo].[CAR_Dealer].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Dealer_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Dealer_UpdateByPK]
	@DealerID		  int,
	@MakeID           int,
	@UserID			  int,
	@Name			  nvarchar(50),
	@Address          nvarchar(100),
	@City             nvarchar(50),
	@State            nvarchar(50),
	@Country          nvarchar(50),
	@Phone            nvarchar(50)
AS

UPDATE [dbo].[CAR_Dealer]
SET	   
       [dbo].[CAR_Dealer].[MakeID] = @MakeID,
	   [dbo].[CAR_Dealer].[Name] = @Name,
	   [dbo].[CAR_Dealer].[Address] = @Address,
	   [dbo].[CAR_Dealer].[City] = @City,
	   [dbo].[CAR_Dealer].[State] = @State,
	   [dbo].[CAR_Dealer].[Country] = @Country,
	   [dbo].[CAR_Dealer].[Phone] = @Phone,
	   [dbo].[CAR_Dealer].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_Dealer].[DealerID] = @DealerID
AND [dbo].[CAR_Dealer].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Feature_DeleteByPK]
	  @FeatureID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Feature]
WHERE [DBO].[CAR_Feature].[FeatureID] = @FeatureID
AND [dbo].[CAR_Feature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Feature_Insert]
	@FeatureName       nvarchar(100),
	@UserID int


AS

INSERT INTO [dbo].[CAR_Feature]
(
	FeatureName,
	UserID
)
VALUES
(
    @FeatureName,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Feature_SelectAll]
@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_Feature].[FeatureID],
		[dbo].[CAR_Feature].[FeatureName],
		[dbo].[CAR_Feature].[CreationDate],
		[dbo].[CAR_Feature].[ModificationDate]
	FROM [dbo].[CAR_Feature]

    WHERE [dbo].[CAR_Feature].[UserID]=@UserID

	ORDER BY [dbo].[CAR_Feature].[FeatureName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_SelectByCarIDFeatureName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[PR_CAR_Feature_SelectByCarIDFeatureName]

@FeatureName		nvarchar(50),
@UserID		int

AS

SELECT
[dbo].[CAR_Feature].[FeatureID],
		[dbo].[CAR_Feature].[FeatureName],
		[dbo].[CAR_Feature].[CreationDate],
		[dbo].[CAR_Feature].[ModificationDate]

FROM [dbo].[CAR_Feature]



WHERE 
 (@FeatureName IS NULL OR [dbo].[CAR_Feature].[FeatureName] like '%'+@FeatureName+'%')
and [dbo].[CAR_Feature].[UserID]=@UserID
--AND   (@CountryCode IS NULL OR [dbo].[CAR_Feature].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Feature_SelectByPK]
	@FeatureID int,
	@UserID int

AS
	SELECT 
		[dbo].[CAR_Feature].[FeatureID],

		[dbo].[CAR_Feature].[FeatureName],
		[dbo].[CAR_Feature].[CreationDate],
		[dbo].[CAR_Feature].[ModificationDate]
	FROM 
		[dbo].[CAR_Feature]
	WHERE 
		[dbo].[CAR_Feature].[FeatureID] = @FeatureID
		and [dbo].[CAR_Feature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_Feature_SelectForDropDown]

CREATE procedure [dbo].[PR_CAR_Feature_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_Feature].[FeatureID],
		[dbo].[CAR_Feature].[FeatureName]
FROM	[dbo].[CAR_Feature]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_Feature].[UserId]

--WHERE [dbo].[CAR_Feature].[UserId]=@UserID

ORDER BY [dbo].[CAR_Feature].[FeatureID] DESC
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Feature_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Feature_UpdateByPK]
    @FeatureID     int,
    @FeatureName   nvarchar(50),
	@UserID int

AS
UPDATE [dbo].[CAR_Feature]
SET    [dbo].[CAR_Feature].[FeatureName] = @FeatureName,
       [dbo].[CAR_Feature].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_Feature].[FeatureID] = @FeatureID
    and [dbo].[CAR_Feature].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_FuelType_DeleteByPK]
	  @FuelTypeID			  int,
	  @UserID				  int

AS

DELETE 
FROM [DBO].[CAR_FuelType]
WHERE [DBO].[CAR_FuelType].[FuelTypeID]=@FuelTypeID
AND [dbo].[CAR_FuelType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_FuelType_Insert]
	@FuelTypeName      nvarchar(100),
	@UserID int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[CAR_FuelType]
(
	FuelTypeName,
	UserID
	--CreationDate,
	--ModificationDate
)
VALUES
(
    @FuelTypeName,
	@UserID
	--@CreationDate,
	--@ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_FuelType_SelectAll]

@UserID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_FuelType].[FuelTypeID],
		[dbo].[CAR_FuelType].[FuelTypeName],
		[dbo].[CAR_FuelType].[CreationDate],
		[dbo].[CAR_FuelType].[ModificationDate]
	FROM [dbo].[CAR_FuelType]

	WHERE [dbo].[CAR_FuelType].[UserID]=@UserID

	ORDER BY [dbo].[CAR_FuelType].[FuelTypeName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_SelectByFuelTypeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_CAR_FuelType_SelectByFuelTypeName]
@FuelTypeName    nvarchar(50),
@UserID			Int

AS

SELECT
	[dbo].[CAR_FuelType].[FuelTypeID],
	[dbo].[CAR_FuelType].[FuelTypeName],
    [dbo].[CAR_FuelType].[CreationDate],
    [dbo].[CAR_FuelType].[ModificationDate]

FROM [dbo].[CAR_FuelType]


INNER JOIN [dbo].[MST_User]
ON		   [dbo].[MST_User].[UserId] = [CAR_FuelType].[UserId]


WHERE (@FuelTypeName IS NULL OR [dbo].[CAR_FuelType].[FuelTypeName] like '%'+@FuelTypeName+'%')
And   [dbo].[CAR_FuelType].[UserId]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_FuelType_SelectByPK]
	@FuelTypeID int,
	@UserID int

AS

SELECT
	[dbo].[Car_FuelType].[FuelTypeID],
	[dbo].[Car_FuelType].[FuelTypeName],
	[dbo].[Car_FuelType].[CreationDate],
	[dbo].[Car_FuelType].[ModificationDate]
FROM
	[dbo].[Car_FuelType]
WHERE
	[dbo].[Car_FuelType].[FuelTypeID] = @FuelTypeID
	and [dbo].[CAR_FuelType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_FuelType_SelectForDropDown]

Create procedure [dbo].[PR_CAR_FuelType_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_FuelType].[FuelTypeID],
		[dbo].[CAR_FuelType].[FuelTypeName]
FROM	[dbo].[CAR_FuelType]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_FuelType].[UserId]

--WHERE [dbo].[CAR_FuelType].[UserId]=@UserID

ORDER BY [dbo].[CAR_FuelType].[FuelTypeName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_FuelType_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_FuelType_UpdateByPK]
	@FuelTypeID int,
	@UserID int,
	@FuelTypeName	nvarchar(50)

AS

UPDATE [dbo].[CAR_FuelType]
SET	   
       [dbo].[CAR_FuelType].[FuelTypeName] = @FuelTypeName,
	   [dbo].[CAR_FuelType].[ModificationDate] = GETDATE()

WHERE  [dbo].[CAR_FuelType].[FuelTypeID] = @FuelTypeID 
AND [dbo].[CAR_FuelType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Image_DeleteByPK]
	  @ImageID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Image]
WHERE [DBO].[CAR_Image].[ImageID] = @ImageID
AND [dbo].[CAR_Image].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Image_Insert]
	@PhotoPath     nvarchar(100),
	@UserID int,
	@CarID int


AS

INSERT INTO [dbo].[CAR_Image]
(
	PhotoPath,
	UserID,
	CarID
)
VALUES
(
    @PhotoPath,
	@UserID,
	@CarID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[PR_CAR_Image_SelectAll]

@UserID int

AS

SELECT
		[dbo].[CAR_Image].[ImageID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Image].[PhotoPath],
		[dbo].[CAR_Image].[CreationDate],
		[dbo].[CAR_Image].[ModificationDate]
FROM	[dbo].[CAR_Image]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Image].CarID = [dbo].[MST_Car].CarID

	WHERE [dbo].[CAR_Image].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_SelectByCarID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_CAR_Image_SelectByCarID]
	@CarID int,
	@UserID int

AS
	SELECT 
		[dbo].[CAR_Image].[ImageID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Image].[CarID],
		[dbo].[CAR_Image].[PhotoPath],
		[dbo].[CAR_Image].[CreationDate],
		[dbo].[CAR_Image].[ModificationDate]
	FROM 
		[dbo].[CAR_Image]

		INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Image].CarID = [dbo].[MST_Car].CarID
	WHERE 
		[dbo].[CAR_Image].[CarID] = @CarID
		and [dbo].[CAR_Image].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Image_SelectByPK]
	@ImageID int,
	@UserID int

AS
	SELECT 
		[dbo].[CAR_Image].[ImageID],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Image].[CarID],
		[dbo].[CAR_Image].[PhotoPath],
		[dbo].[CAR_Image].[CreationDate],
		[dbo].[CAR_Image].[ModificationDate]
	FROM 
		[dbo].[CAR_Image]

		INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Image].CarID = [dbo].[MST_Car].CarID
	WHERE 
		[dbo].[CAR_Image].[ImageID] = @ImageID
		and [dbo].[CAR_Image].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Image_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Image_UpdateByPK]
    @ImageID     int,
    @PhotoPath   nvarchar(50),
	@UserID int,
	@CarID int

AS
UPDATE [dbo].[CAR_Image]
SET    [dbo].[CAR_Image].[PhotoPath] = @PhotoPath,
	    [dbo].[CAR_Image].[CarID]=@CarID,
       [dbo].[CAR_Image].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_Image].[ImageID] = @ImageID
    and [dbo].[CAR_Image].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_CAR_Make_DeleteByPK]
	  @MakeID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Make]
WHERE [DBO].[CAR_Make].[MakeID] = @MakeID
AND [dbo].[CAR_Make].[UserID]=@UserID

GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Make_Insert]
	@MakeName          nvarchar(100),
	@UserID			  int,
    @PhotoPath nvarchar(100)
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[CAR_Make]
(
	MakeName,
	UserID,
		PhotoPath
	--CreationDate,
	--ModificationDate
)
VAlUES
(
    @MakeName,
	@UserID,
	@PhotoPath
	--@CreationDate,
	--@ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_CAR_Make_SelectAll]

@UserID int

AS

SELECT
		[dbo].[CAR_Make].[MakeID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Make].[PhotoPath],
		[dbo].[CAR_Make].[CreationDate],
		[dbo].[CAR_Make].[ModificationDate]
FROM	[dbo].[CAR_Make]

	WHERE [dbo].[CAR_Make].[UserID]=@UserID

ORDER BY   [dbo].[CAR_Make].[MakeName]
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_SelectAllPhotos]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[PR_CAR_Make_SelectAllPhotos]

--@UserID int

AS

SELECT
		[dbo].[CAR_Make].[MakeID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Make].[PhotoPath],
		[dbo].[CAR_Make].[CreationDate],
		[dbo].[CAR_Make].[ModificationDate]
FROM	[dbo].[CAR_Make]

	--WHERE [dbo].[CAR_Make].[UserID]=@UserID

ORDER BY   [dbo].[CAR_Make].[MakeName] DESC
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_SelectByMakeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Make_SelectByMakeName]
@MakeName    nvarchar(50),
@UserID			Int

AS

SELECT
	[dbo].[CAR_Make].[MakeID],
	[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Make].[PhotoPath],
    [dbo].[CAR_Make].[CreationDate],
    [dbo].[CAR_Make].[ModificationDate]

FROM [dbo].[CAR_Make]


INNER JOIN [dbo].[MST_User]
ON		   [dbo].[MST_User].[UserId] = [CAR_Make].[UserId]


WHERE (@MakeName IS NULL OR [dbo].[CAR_Make].[MakeName] like '%'+@MakeName+'%')
And   [dbo].[CAR_Make].[UserId]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_LOC_State_SelectByPK] @StateID=2

CREATE procedure [dbo].[PR_CAR_Make_SelectByPK]
	@MakeID			  int,
	 @UserID				  int

AS

SELECT
		[dbo].[CAR_Make].[MakeID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Make].[PhotoPath],
		[dbo].[CAR_Make].[CreationDate],
		[dbo].[CAR_Make].[ModificationDate]
FROM	[dbo].[CAR_Make]
WHERE [dbo].[CAR_Make].[MakeID] = @MakeID
 AND [DBO].[CAR_Make].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_Make_SelectForDropDown]

CREATE procedure [dbo].[PR_CAR_Make_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_Make].[MakeID],
		[dbo].[CAR_Make].[MakeName]
FROM	[dbo].[CAR_Make]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_Make].[UserId]

--WHERE [dbo].[CAR_Make].[UserId]=@UserID

ORDER BY [dbo].[CAR_Make].[MakeName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Make_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[dbo].[PR_LOC_Country_UpdateByPK] 1,"a","91",'13-12-2022"

CREATE PROCEDURE [dbo].[PR_CAR_Make_UpdateByPK]
	@MakeID			  int,
	@MakeName		  nvarchar(50),
	@UserID				  int,
    @PhotoPath nvarchar(100)

AS

UPDATE [dbo].[CAR_Make]
SET	   
       [dbo].[CAR_Make].[MakeName] = @MakeName,
		[dbo].[CAR_Make].[PhotoPath]=@PhotoPath,
	   [dbo].[CAR_Make].[ModificationDate] = GETDATE()
	   --[dbo].[CAR_Make].[UserID] = @UserID
WHERE  [dbo].[CAR_Make].[MakeID] = @MakeID 
AND [DBO].[CAR_Make].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Review_DeleteByPK]
	  @ReviewID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Review]
WHERE [DBO].[CAR_Review].[ReviewID] = @ReviewID
AND [dbo].[CAR_Review].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Review_Insert]
    @ClientID int,
	@CarID int,
    @ReviewText nvarchar(1000),
    @Rating int
AS
BEGIN
    INSERT INTO [dbo].[Car_Review] (
        ClientID,
		CarID,
        ReviewText,
        Rating
    )
    VALUES (
        @ClientID,
		@CarID,
        @ReviewText,
        @Rating
    )
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Review_SelectAll]

@ClientID int

AS
BEGIN
	SELECT 
		[dbo].[CAR_Review].[ReviewID],
		[dbo].[CAR_Review].[ReviewText],
		[dbo].[MST_Car].[Name],
		[dbo].[MST_Client].[Email],
		[dbo].[CAR_Review].[Rating],
		[dbo].[CAR_Review].[CreationDate],
		[dbo].[CAR_Review].[ModificationDate]
	FROM [dbo].[CAR_Review]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Review].CarID = [dbo].[MST_Car].CarID
INNER JOIN [dbo].[MST_Client] ON [dbo].[CAR_Review].ClientID = [dbo].[MST_Client].ClientID

	WHERE [dbo].[CAR_Review].[ClientID]=@ClientID
    
	ORDER BY [dbo].[CAR_Review].[ReviewID]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_SelectByCarIDReviewTextRating]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_Review_SelectByCarIDReviewTextRating]
@CarID    nvarchar(50),
@ReviewText		nvarchar(50),
@Rating	int,
@ClientID		int

AS

SELECT
[dbo].[CAR_Review].[ReviewID],
		[dbo].[CAR_Review].[ReviewText],
		[dbo].[MST_Car].[Name],
		[dbo].[CAR_Review].[Rating],
		[dbo].[CAR_Review].[CreationDate],
		[dbo].[CAR_Review].[ModificationDate]

FROM [dbo].[CAR_Review]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Review].CarID = [dbo].[MST_Car].CarID


WHERE (@CarID IS NULL OR [dbo].[MST_Car].[CarID] like '%'+@CarID+'%')
AND (@ReviewText IS NULL OR [dbo].[CAR_Review].[ReviewText] like '%'+@ReviewText+'%')
AND (@Rating IS NULL OR [dbo].[CAR_Review].[Rating] = @Rating)


and [dbo].[CAR_Review].[ClientID]=@ClientID
--AND   (@CountryCode IS NULL OR [dbo].[CAR_Review].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Review_SelectByPK]
	@ReviewID int,
	@UserID int
AS
	SELECT 
		[dbo].[CAR_Review].[ReviewID],
		[dbo].[CAR_Review].[UserID],
		[dbo].[CAR_Review].[CarID],
		[dbo].[CAR_Review].[ReviewText],
		[dbo].[CAR_Review].[Rating],
		[dbo].[CAR_Review].[CreationDate],
		[dbo].[CAR_Review].[ModificationDate]
	FROM 
		[dbo].[CAR_Review]
	WHERE [dbo].[CAR_Review].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_SelectReviewByCarID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_Review_SelectReviewByCarID]
@CarID    nvarchar(50)

AS

SELECT
[dbo].[CAR_Review].[ReviewID],
		[dbo].[CAR_Review].[ReviewText],
		[dbo].[MST_Car].[Name],
		[dbo].[MST_Client].[Email],
		[dbo].[CAR_Review].[Rating],
		[dbo].[CAR_Review].[CreationDate],
		[dbo].[CAR_Review].[ModificationDate]

FROM [dbo].[CAR_Review]

INNER JOIN [dbo].[MST_Car] ON [dbo].[CAR_Review].CarID = [dbo].[MST_Car].CarID
INNER JOIN [dbo].[MST_Client] ON [dbo].[CAR_Review].ClientID = [dbo].[MST_Client].ClientID


--AND   (@CountryCode IS NULL OR [dbo].[CAR_Review].[CountryCode]=@CountryCode)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Review_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Review_UpdateByPK]
	@ReviewID         int,
	@ClientID          int,
	@CarID           int,
	@ReviewText       nvarchar(50),
	@Rating           int

AS

UPDATE [dbo].[CAR_Review]
SET	   
       [dbo].[CAR_Review].[ClientID] = @ClientID,
	   [dbo].[CAR_Review].[CarID] = @CarID,
	   [dbo].[CAR_Review].[ReviewText] = @ReviewText,
	   [dbo].[CAR_Review].[Rating] = @Rating,
	   [dbo].[CAR_Review].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_Review].[ReviewID] = @ReviewID
And [dbo].[CAR_Review].[ClientID] = @ClientID

GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_TransmissionType_DeleteByPK]
    @TransmissionTypeID int,
	@UserID				  int
AS
BEGIN
    DELETE FROM [dbo].[CAR_TransmissionType]
    WHERE [TransmissionTypeID] = @TransmissionTypeID
	AND [dbo].[CAR_TransmissionType].[UserID]=@UserID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_TransmissionType_Insert]
	@TransmissionTypeName   nvarchar(100),
	@UserID				  int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[CAR_TransmissionType]
(
	TransmissionTypeName,
	UserID
	--CreationDate,
	--ModificationDate
)
VALUES
(
    @TransmissionTypeName,
	@UserID
	--@CreationDate,
	--@ModificationDate
)

GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_TransmissionType_SelectAll]

@UserID				  int

AS
BEGIN
	SELECT 
		[dbo].[CAR_TransmissionType].[TransmissionTypeID],
		[dbo].[CAR_TransmissionType].[TransmissionTypeName],
		[dbo].[CAR_TransmissionType].[CreationDate],
		[dbo].[CAR_TransmissionType].[ModificationDate]
	FROM [dbo].[CAR_TransmissionType]

	WHERE [dbo].[CAR_TransmissionType].[UserID]=@UserID

	ORDER BY [dbo].[CAR_TransmissionType].[TransmissionTypeName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Car_TransmissionType_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Car_TransmissionType_SelectByPK]
	@TransmissionTypeID int,
	@UserID				  int

AS

SELECT
	[dbo].[Car_TransmissionType].[TransmissionTypeID],
	[dbo].[Car_TransmissionType].[TransmissionTypeName],
	[dbo].[Car_TransmissionType].[CreationDate],
	[dbo].[Car_TransmissionType].[ModificationDate]
FROM
	[dbo].[Car_TransmissionType]
WHERE
	[dbo].[Car_TransmissionType].[TransmissionTypeID]=@TransmissionTypeID
	AND [dbo].[CAR_TransmissionType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_SelectByTransmissionTypeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_CAR_TransmissionType_SelectByTransmissionTypeName]
@TransmissionTypeName    nvarchar(50),
@UserID			Int

AS

SELECT
	[dbo].[CAR_TransmissionType].[TransmissionTypeID],
	[dbo].[CAR_TransmissionType].[TransmissionTypeName],
    [dbo].[CAR_TransmissionType].[CreationDate],
    [dbo].[CAR_TransmissionType].[ModificationDate]

FROM [dbo].[CAR_TransmissionType]


INNER JOIN [dbo].[MST_User]
ON		   [dbo].[MST_User].[UserId] = [CAR_TransmissionType].[UserId]


WHERE (@TransmissionTypeName IS NULL OR [dbo].[CAR_TransmissionType].[TransmissionTypeName] like '%'+@TransmissionTypeName+'%')
And   [dbo].[CAR_TransmissionType].[UserId]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_TransmissionType_SelectForDropDown]

create procedure [dbo].[PR_CAR_TransmissionType_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_TransmissionType].[TransmissionTypeID],
		[dbo].[CAR_TransmissionType].[TransmissionTypeName]
FROM	[dbo].[CAR_TransmissionType]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_TransmissionType].[UserId]

--WHERE [dbo].[CAR_TransmissionType].[UserId]=@UserID

ORDER BY [dbo].[CAR_TransmissionType].[TransmissionTypeName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_TransmissionType_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--[dbo].[PR_LOC_Country_UpdateByPK] 1,"a","91",'13-12-2022"

CREATE PROCEDURE [dbo].[PR_CAR_TransmissionType_UpdateByPK]
	@TransmissionTypeID int,
	@UserID				  int,
	@TransmissionTypeName	nvarchar(50)

AS

UPDATE [dbo].[CAR_TransmissionType]
SET	   
       [dbo].[CAR_TransmissionType].[TransmissionTypeName] = @TransmissionTypeName,
	   [dbo].[CAR_TransmissionType].[ModificationDate] = GETDATE()

WHERE  [dbo].[CAR_TransmissionType].[TransmissionTypeID] = @TransmissionTypeID 
AND [dbo].[CAR_TransmissionType].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Type_DeleteByPK]
	  @TypeID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Type]
WHERE [DBO].[CAR_Type].[TypeID] = @TypeID
AND [dbo].[CAR_Type].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Type_Insert]
	@UserID int,
	@TypeName          nvarchar(100)

AS

INSERT INTO [dbo].[CAR_Type]
(
	UserID,
	TypeName
)
VAlUES
(
    @UserID,
	@TypeName
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Type_SelectAll] -- add closing square bracket
@UserID int
AS
BEGIN


	SELECT 
		[dbo].[CAR_Type].[TypeID],
		[dbo].[CAR_Type].[TypeName],
		[dbo].[CAR_Type].[CreationDate],
		[dbo].[CAR_Type].[ModificationDate]
	FROM [dbo].[CAR_Type]

		WHERE [dbo].[CAR_Type].[UserID]=@UserID
	ORDER BY [dbo].[CAR_Type].[TypeName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Type_SelectByPK]
@UserID int,
	@TypeID int

AS

SELECT
	[dbo].[CAR_Type].[TypeID],
	[dbo].[CAR_Type].[TypeName],
	[dbo].[CAR_Type].[CreationDate],
	[dbo].[CAR_Type].[ModificationDate]
FROM
	[dbo].[CAR_Type]
WHERE
	[dbo].[CAR_Type].[TypeID] = @TypeID
	and [dbo].[CAR_Type].[UseriD] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_SelectByTypeName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_Type_SelectByTypeName]
@TypeName		nvarchar(50),
@UserID		int

AS

SELECT
[dbo].[CAR_Type].[TypeID],
		[dbo].[CAR_Type].[TypeName],
		[dbo].[CAR_Type].[CreationDate],
		[dbo].[CAR_Type].[ModificationDate]

FROM [dbo].[CAR_Type]

WHERE (@TypeName IS NULL OR [dbo].[CAR_Type].[TypeName] like '%'+@TypeName+'%')
and [dbo].[CAR_Type].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_Type_SelectForDropDown]

CREATE procedure [dbo].[PR_CAR_Type_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_Type].[TypeID],
		[dbo].[CAR_Type].[TypeName]
FROM	[dbo].[CAR_Type]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_Type].[UserId]

--WHERE [dbo].[CAR_Type].[UserId]=@UserID

ORDER BY [dbo].[CAR_Type].[TypeName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Type_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Type_UpdateByPK]
	@TypeID			  int,
	@TypeName		  nvarchar(50),
	@UserID				  int

AS

UPDATE [dbo].[CAR_Type]
SET	   
       [dbo].[CAR_Type].[TypeName] = @TypeName,
	   [dbo].[CAR_Type].[ModificationDate] = GETDATE()
	   --[dbo].[CAR_Type].[UserID] = @UserID
WHERE  [dbo].[CAR_Type].[TypeID] = @TypeID
AND [DBO].[CAR_Type].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Variant_DeleteByPK]
	  @VariantID			  int,
	@UserID				  int

AS

DELETE 
FROM [DBO].[CAR_Variant]
WHERE [DBO].[CAR_Variant].[VariantID] = @VariantID
AND [dbo].[CAR_Variant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Variant_Insert]
	@VariantName       nvarchar(100),
	@MakeID			int,
	@UserID				int

AS

INSERT INTO [dbo].[CAR_Variant]
(
	VariantName,
	MakeID,
	UserID
)
VALUES
(
    @VariantName,
	@MakeID,
	@UserID
)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Variant_SelectAll]

@UserID int

AS

BEGIN
	SELECT 
		[dbo].[CAR_Variant].[VariantID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_Variant].[CreationDate],
		[dbo].[CAR_Variant].[ModificationDate]
	FROM [dbo].[CAR_Variant]

INNER JOIN [dbo].[CAR_Make] ON [dbo].[CAR_Variant].MakeID = [dbo].[CAR_Make].MakeID


 WHERE [dbo].[CAR_Variant].[UserID]=@UserID

	ORDER BY [dbo].[CAR_Variant].[VariantName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_SelectByMakeIDVariantName]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE  PROCEDURE [dbo].[PR_CAR_Variant_SelectByMakeIDVariantName]

@VariantName		nvarchar(50),
@UserID		int,
@MakeID		int

AS

SELECT
[dbo].[CAR_Variant].[VariantID],
[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_Variant].[CreationDate],
		[dbo].[CAR_Variant].[ModificationDate]

FROM [dbo].[CAR_Variant]

INNER JOIN [dbo].[CAR_Make] ON [dbo].[CAR_Variant].MakeID = [dbo].[CAR_Make].MakeID

WHERE 
 (@VariantName IS NULL OR [dbo].[CAR_Variant].[VariantName] like '%'+@VariantName+'%')
and [dbo].[CAR_Variant].[UserID]=@UserID
AND   (@MakeID IS NULL OR [dbo].[CAR_Variant].[MakeID]=@MakeID)
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Variant_SelectByPK]
	@VariantID int,
	@UserID int
AS
	SELECT 
		[dbo].[CAR_Variant].[VariantID],
		[dbo].[CAR_Variant].[VariantName],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Variant].[CreationDate],
		[dbo].[CAR_Variant].[ModificationDate]
	FROM 
		[dbo].[CAR_Variant]

		INNER JOIN [dbo].[CAR_Make] ON [dbo].[CAR_Variant].MakeID = [dbo].[CAR_Make].MakeID
	WHERE 
		[dbo].[CAR_Variant].[VariantID] = @VariantID
		 AND [dbo].[CAR_Variant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_Variant_SelectForDropDown]

Create procedure [dbo].[PR_CAR_Variant_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[CAR_Variant].[VariantID],
		[dbo].[CAR_Variant].[VariantName]
FROM	[dbo].[CAR_Variant]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_Variant].[UserId]

--WHERE [dbo].[CAR_Variant].[UserId]=@UserID

ORDER BY [dbo].[CAR_Variant].[VariantName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_SelectForDropDownByMakeID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_CAR_Variant_SelectForDropDown]

create procedure [dbo].[PR_CAR_Variant_SelectForDropDownByMakeID]
@MakeID int

AS

SELECT
		[dbo].[CAR_Variant].[VariantID],
		[dbo].[CAR_Variant].[VariantName]
FROM	[dbo].[CAR_Variant]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [CAR_Variant].[UserId]

WHERE [dbo].[CAR_Variant].[MakeID]=@MakeID

ORDER BY [dbo].[CAR_Variant].[VariantName] 
GO
/****** Object:  StoredProcedure [dbo].[PR_CAR_Variant_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CAR_Variant_UpdateByPK]
    @VariantID     int,
    @VariantName   nvarchar(50),
	@UserID int,
	@MakeID int
AS
UPDATE [dbo].[CAR_Variant]
SET    [dbo].[CAR_Variant].[VariantName] = @VariantName,
    [dbo].[CAR_Variant].[MakeID] = @MakeID,
       [dbo].[CAR_Variant].[ModificationDate] = GETDATE()
WHERE  [dbo].[CAR_Variant].[VariantID] = @VariantID
 AND [dbo].[CAR_Variant].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_AllCars]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_AllCars]
AS
BEGIN
    SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,
           CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
           c.CreationDate
    FROM MST_Car c
    JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
    JOIN CAR_Make m ON c.MakeID = m.MakeID
    GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Car_Categories]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_Car_Categories]
AS
BEGIN
    -- Retrieve all fields from Car_FuelType table
	
    SELECT FuelTypeID, FuelTypeName, NULL AS TypeID, NULL AS TypeName, NULL AS TransmissionTypeID, NULL AS TransmissionTypeName
    FROM Car_FuelType
    UNION ALL
    -- Retrieve all fields from Car_Type table
    SELECT NULL AS FuelTypeID, NULL AS FuelTypeName, TypeID, TypeName, NULL AS TransmissionTypeID, NULL AS TransmissionTypeName
    FROM Car_Type
    UNION ALL
    -- Retrieve all fields from Car_TransmissionType table
    SELECT NULL AS FuelTypeID, NULL AS FuelTypeName, NULL AS TypeID, NULL AS TypeName, TransmissionTypeID, TransmissionTypeName
    FROM Car_TransmissionType;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_CLIENT_Car_Detail]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_CLIENT_Car_Detail]
    @CarID INT
AS
BEGIN
    SELECT c.CarID, c.Name, c.PhotoPath AS CarPhotoPath, -- Alias for MST_Car PhotoPath
           STUFF((SELECT ', ' + ci.PhotoPath
                  FROM CAR_Image ci
                  WHERE ci.CarID = c.CarID
                  FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS ImagePhotoPath, -- Alias for CAR_Image PhotoPath
           m.MakeName, 
           CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
           STUFF((SELECT ', ' + cf.FeatureName
                  FROM CAR_CarWiseFeature cf
                  WHERE cf.CarID = c.CarID
                  FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS FeatureNames
    FROM MST_Car c
    JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
    JOIN CAR_Make m ON c.MakeID = m.MakeID
    WHERE c.CarID = @CarID
    GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName; -- Use alias for MST_Car PhotoPath
END;
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_CarByFuelType]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_CarByFuelType]
    @FuelTypeName nvarchar(50)
AS
BEGIN
  SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,cf.FuelTypeName,
       CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
       c.CreationDate
FROM MST_Car c
JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
JOIN CAR_CarWiseFuelType cf ON c.CarID = cf.CarID
JOIN CAR_Make m ON c.MakeID = m.MakeID
WHERE cf.FuelTypeName = @FuelTypeName
GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate,cf.FuelTypeName;

END
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_CarByTransmissionType]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_CarByTransmissionType] 
    @TransmissionTypeName nvarchar(50)
AS
BEGIN
  SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,cf.TransmissionTypeName,
       CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
       c.CreationDate
FROM MST_Car c
JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
JOIN CAR_CarWiseTransmissionType cf ON c.CarID = cf.CarID
JOIN CAR_Make m ON c.MakeID = m.MakeID
WHERE cf.TransmissionTypeName = @TransmissionTypeName
GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate,cf.TransmissionTypeName;

END
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_CarByType]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_CarByType]
    @TypeID INT
AS
BEGIN
  SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,
       CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
       c.CreationDate
FROM MST_Car c
JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
JOIN CAR_Make m ON c.MakeID = m.MakeID
WHERE c.TypeID = @TypeID
GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate;

END
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Favourite_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_Favourite_DeleteByPK]
	  @ClientID			  int,
	  @CarID			  int

AS

DELETE 
FROM [DBO].[Client_Favourite]
WHERE [DBO].[Client_Favourite].[ClientID] = @ClientID
AND [dbo].[Client_Favourite].[FavouriteCarID]=@CarID
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Favourite_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_Client_Favourite_Insert]
	@CarID int,
	@ClientID int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS

INSERT INTO [dbo].[Client_Favourite]
(
	FavouriteCarID,
	ClientID
	--CreationDate,
	--ModificationDate
)
VALUES
(
    @CarID,
	@ClientID
	--@CreationDate,
	--@ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Favourite_SelectByClientID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_Favourite_SelectByClientID] 
    @ClientID int

AS
    SELECT 
        [dbo].[Client_Favourite].[ClientID],
        [dbo].[Client_Favourite].[FavouriteCarID],
        [dbo].[MST_Car].[Name],
        [dbo].[MST_Car].[PhotoPath],
        m.MakeName,
        CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price
    FROM 
        [dbo].[Client_Favourite]
    INNER JOIN [dbo].[MST_Car] ON [dbo].[Client_Favourite].FavouriteCarID = [dbo].[MST_Car].CarID
    JOIN CAR_CarWiseVariant cv ON Client_Favourite.FavouriteCarID = cv.CarID
    JOIN CAR_Make m ON MST_Car.MakeID = m.MakeID
    WHERE [dbo].[Client_Favourite].[ClientID] = @ClientID
    GROUP BY Client_Favourite.FavouriteCarID, [dbo].[Client_Favourite].[ClientID], MST_Car.Name, MST_Car.PhotoPath, m.MakeName;
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Favourite_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_Client_Favourite_UpdateByPK]
	@FavouriteID int,
	@CarID int,
	@ClientID int
	--@CreationDate         datetime,
	--@ModificationDate     datetime	

AS
UPDATE [dbo].[Client_Favourite]
SET    [dbo].[Client_Favourite].[FavouriteCarID] = @CarID
WHERE  [dbo].[Client_Favourite].[FavouriteID] = @FavouriteID
    and [dbo].[Client_Favourite].[ClientID]=@ClientID
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_Filter]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_Filter]
    @FuelTypeName nvarchar(50) = NULL,
    @TransmissionTypeName nvarchar(50) = NULL,
    @MakeID int = NULL,
    @CarID int = NULL,
    @TypeID int = NULL
AS
BEGIN
    SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,
           CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
           c.CreationDate
    FROM MST_Car c
    JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
    JOIN CAR_CarWiseFuelType cf ON c.CarID = cf.CarID
    JOIN CAR_CarWiseTransmissionType ct ON c.CarID = ct.CarID
    JOIN CAR_Make m ON c.MakeID = m.MakeID
    WHERE 
        (@FuelTypeName IS NULL OR cf.FuelTypeName LIKE '%' + @FuelTypeName + '%')
        AND (@TransmissionTypeName IS NULL OR ct.TransmissionTypeName LIKE '%' + @TransmissionTypeName + '%')
        AND (@MakeID IS NULL OR c.MakeID = @MakeID)
        AND (@TypeID IS NULL OR c.TypeID = @TypeID)
        AND (@CarID IS NULL OR c.CarID = @CarID)
    GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_Client_SelectRecentCars]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Client_SelectRecentCars]
AS
BEGIN

--SELECT TOP 4 c.CarID, c.Name, c.PhotoPath, m.MakeName,
--       CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price
--FROM MST_Car c
--JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
--JOIN CAR_Make m ON c.MakeID = m.MakeID
--GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName

    SELECT TOP 4 CarID, Name, PhotoPath, MakeName, Price
    FROM (
        SELECT c.CarID, c.Name, c.PhotoPath, m.MakeName,
               CONCAT(FORMAT(MIN(cv.Price) / 100000, 'N2'), '-', FORMAT(MAX(cv.Price) / 100000, 'N2'), ' Lakh*') AS Price,
               c.CreationDate
        FROM MST_Car c
        JOIN CAR_CarWiseVariant cv ON c.CarID = cv.CarID
        JOIN CAR_Make m ON c.MakeID = m.MakeID
        GROUP BY c.CarID, c.Name, c.PhotoPath, m.MakeName, c.CreationDate
    ) AS Subquery
    ORDER BY CreationDate DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_DeleteByPK]
	  @CarID			  int,
	@UserID			  int

AS

DELETE 

FROM [DBO].[MST_Car]

WHERE [DBO].[MST_Car].[CarID] = @CarID
AND [dbo].[MST_Car].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_Insert]
    @MakeID int,
    @TypeID int,
    --@VariantID int,
    --@FeatureID int,
    --@FuelTypeID int,
    --@TransmTypeID int,
    @UserID int,
    @Year int,
    @Name nvarchar(100),
    @PhotoPath nvarchar(100)
AS
BEGIN
    INSERT INTO [dbo].[MST_Car] (
        MakeID,
        TypeID,
        --VariantID,
        --FeatureID,
        --FuelTypeID,
        --TransmTypeID,
        UserID,
        Year,
        Name,
		PhotoPath
    )
    VALUES (
        @MakeID,
        @TypeID,
        --@VariantID,
        --@FeatureID,
        --@FuelTypeID,
        --@TransmTypeID,
        @UserID,
        @Year,
        @Name,
		@PhotoPath
    )
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_InsertCheck]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_InsertCheck]
    @MakeID int,
    @TypeID int,
	--@FuelTypeID int,
    @UserID int,
    @Year int,
    @Name nvarchar(100),
    @CarID int OUTPUT,
	@PhotoPath nvarchar(100)
AS
BEGIN
    INSERT INTO [dbo].[MST_Car] (
        MakeID,
        TypeID,
		--FuelTypeID,
        UserID,
        Year,
        Name,
		PhotoPath
    )
    VALUES (
        @MakeID,
        @TypeID,
		--@FuelTypeID,
        @UserID,
        @Year,
        @Name,
		@PhotoPath
    )

    SET @CarID = SCOPE_IDENTITY() -- Set the output parameter to the inserted CarID

END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_SelectAll]

	@UserID			  int
AS
BEGIN
	SELECT 
		[dbo].[MST_Car].[CarID],
		[dbo].[CAR_Make].[MakeName],
		[dbo].[CAR_Type].[TypeName],
		--[dbo].[CAR_Variant].[VariantName],
		--[dbo].[CAR_Feature].[FeatureName],
		--[dbo].[CAR_FuelType].[FuelTypeName],
		--[dbo].[CAR_TransmissionType].[TransmissionTypeName],
		[dbo].[MST_Car].[Year],
		[dbo].[MST_Car].[Name],
		[dbo].[MST_Car].[PhotoPath],
		[dbo].[MST_Car].[CreationDate],
		[dbo].[MST_Car].[ModificationDate]
	FROM [dbo].[MST_Car]
	INNER JOIN [dbo].[CAR_Make] ON [dbo].[MST_Car].[MakeID] = [dbo].[CAR_Make].[MakeID]
	INNER JOIN [dbo].[CAR_Type] ON [dbo].[MST_Car].[TypeID] = [dbo].[CAR_Type].[TypeID]
	--INNER JOIN [dbo].[CAR_Variant] ON [dbo].[MST_Car].[CarID] = [dbo].[CAR_Variant].[CarID]
	--INNER JOIN [dbo].[CAR_Feature] ON [dbo].[MST_Car].[FeatureID] = [dbo].[CAR_Feature].[FeatureID]
	--INNER JOIN [dbo].[CAR_FuelType] ON [dbo].[MST_Car].[FuelTypeID] = [dbo].[CAR_FuelType].[FuelTypeID]
	--INNER JOIN [dbo].[CAR_TransmissionType] ON [dbo].[MST_Car].[TransmTypeID] = [dbo].[CAR_TransmissionType].[TransmissionTypeID]

	WHERE [dbo].[MST_CAR].[UserID]=@UserID
	ORDER BY [dbo].[MST_Car].[Name]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_SelectByPK]
	@CarID int,
		@UserID			  int
AS
	SELECT 
		[dbo].[MST_Car].[CarID],
		[dbo].[MST_Car].[MakeID],
		[dbo].[MST_Car].[TypeID],
		--[dbo].[MST_Car].[VariantID],
		--[dbo].[MST_Car].[FeatureID],
		[dbo].[MST_Car].[FuelTypeID],
		--[dbo].[MST_Car].[TransmTypeID],
		[dbo].[MST_Car].[UserID],
		[dbo].[MST_Car].[Year],
		[dbo].[MST_Car].[Name],
		[dbo].[MST_Car].[PhotoPath],
		[dbo].[MST_Car].[CreationDate],
		[dbo].[MST_Car].[ModificationDate]
	FROM 
		[dbo].[MST_Car]
	WHERE 
		[dbo].[MST_Car].[CarID] = @CarID
		AND [dbo].[MST_CAR].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_SelectForDropDown]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_MST_Car_SelectForDropDown]

Create procedure [dbo].[PR_MST_Car_SelectForDropDown]
--@UserID int

AS

SELECT
		[dbo].[MST_Car].[CarID],
		[dbo].[MST_Car].[Name]
FROM	[dbo].[MST_Car]

--INNER JOIN [dbo].[USER_Master]
--ON		   [dbo].[USER_Master].[UserId] = [MST_Car].[UserId]

--WHERE [dbo].[MST_Car].[UserId]=@UserID

ORDER BY [dbo].[MST_Car].[Name] 
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_SelectForDropDownMakeID]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--[dbo].[PR_MST_Car_SelectForDropDown]

CREATE procedure [dbo].[PR_MST_Car_SelectForDropDownMakeID]
@MakeID int

AS

SELECT
		[dbo].[MST_Car].[CarID],
		[dbo].[MST_Car].[Name]
FROM	[dbo].[MST_Car]

--INNER JOIN [dbo].[Car_Master]
--ON		   [dbo].[Car_Master].[MakeID] = [MST_Car].[MakeID]

WHERE [dbo].[MST_Car].[MakeID]=@MakeID

ORDER BY [dbo].[MST_Car].[Name] 
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_TotalRecords]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_TotalRecords]
AS
BEGIN
    SELECT COUNT(*) AS TotalRecords FROM MST_Car;
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Car_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Car_UpdateByPK]
	@CarID          int,
	@MakeID         int,
	@TypeID         int,
	--@VariantID      int,
	--@FuelTypeID     int,
	--@TransmTypeID   int,
	@UserID         int,
	@Year           int,
	@Name           nvarchar(50),
	@PhotoPath         nvarchar(100)

AS

UPDATE [dbo].[MST_Car]
SET	   
       [dbo].[MST_Car].[MakeID] = @MakeID,
	   [dbo].[MST_Car].[TypeID] = @TypeID,
	   --[dbo].[MST_Car].[VariantID] = @VariantID,
	   --[dbo].[MST_Car].[FeatureID] = @FeatureID,
	   --[dbo].[MST_Car].[FuelTypeID] = @FuelTypeID,
	   --[dbo].[MST_Car].[TransmTypeID] = @TransmTypeID,
	   [dbo].[MST_Car].[UserID] = @UserID,
	   [dbo].[MST_Car].[Year] = @Year,
	   [dbo].[MST_Car].[Name] = @Name,
	   [dbo].[MST_Car].[PhotoPath] = @PhotoPath,
	   [dbo].[MST_Car].[ModificationDate] = GETDATE()
WHERE  [dbo].[MST_Car].[CarID] = @CarID
AND [dbo].[MST_Car].[UserID]=@UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Client_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_MST_Client_Insert]
	
	@Email             nvarchar(100),
	@Password          nvarchar(100)

AS

INSERT INTO [dbo].[MST_Client]
(
	Email,
	Password
)
VAlUES
(
    @Email,
    @Password
)
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_Client_SelectByUserNamePassword]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_Client_SelectByUserNamePassword]

@Email nvarchar(100),
@Password nvarchar(50)

AS

SELECT

[dbo].[MST_Client].[Email],
[dbo].[MST_Client].[ClientID],
[dbo].[MST_Client].[Password]
--[dbo].[MST_Client].[CreationDate],
--[dbo].[MST_Client].[ModificationDate]

FROM

[dbo].[MST_Client]

WHERE [dbo].[MST_Client].[Email]=@Email AND [dbo].[MST_Client].[Password]=@Password
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_DeleteByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_DeleteByPK]
	  @UserID			  int

AS

DELETE 
FROM [DBO].[MST_User]
WHERE [DBO].[MST_User].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_Insert]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_Insert]
	@UserName          nvarchar(100),
	@Password          nvarchar(100),
	@Email             nvarchar(100),
	@MobileNumber      nvarchar(20)

AS

INSERT INTO [dbo].[MST_User]
(
	UserName,
	Password,
	Email,
	MobileNumber
)
VAlUES
(
    @UserName,
    @Password,
    @Email,
    @MobileNumber
)
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_SelectAll]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_SelectAll]
AS
BEGIN
	SELECT
		[dbo].[MST_User].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_User].[FirstName],
		[dbo].[MST_User].[LastName],
		[dbo].[MST_User].[Password],
		[dbo].[MST_User].[Email],
		[dbo].[MST_User].[MobileNumber],
		[dbo].[MST_User].[CreationDate],
		[dbo].[MST_User].[ModificationDate]
	FROM
		[dbo].[MST_User]
	ORDER BY
		[dbo].[MST_User].[UserName]
END
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_SelectByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_SelectByPK]
	@UserID int

AS

SELECT
		[dbo].[MST_User].[UserID],
		[dbo].[MST_User].[UserName],
		[dbo].[MST_User].[FirstName],
		[dbo].[MST_User].[LastName],
		[dbo].[MST_User].[Password],
		[dbo].[MST_User].[Email],
		[dbo].[MST_User].[MobileNumber],
		[dbo].[MST_User].[CreationDate],
		[dbo].[MST_User].[ModificationDate]
FROM
	[dbo].[MST_User]
WHERE
	[dbo].[MST_User].[UserID] = @UserID
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_SelectByUserNamePassword]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[PR_MST_User_SelectByUserNamePassword]

@UserName nvarchar(50),
@Password nvarchar(50)

AS

SELECT

[dbo].[MST_User].[UserId],
[dbo].[MST_User].[UserName],
[dbo].[MST_User].[FirstName],
[dbo].[MST_User].[LastName],
[dbo].[MST_User].[Password],
[dbo].[MST_User].[PhotoPath],
[dbo].[MST_User].[Email],
[dbo].[MST_User].[MobileNumber],
[dbo].[MST_User].[CreationDate],
[dbo].[MST_User].[ModificationDate]

FROM

[dbo].[MST_User]

WHERE [dbo].[MST_User].[UserName]=@UserName AND [dbo].[MST_User].[Password]=@Password
GO
/****** Object:  StoredProcedure [dbo].[PR_MST_User_UpdateByPK]    Script Date: 08-11-2023 17:40:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_MST_User_UpdateByPK]
	@UserID			  int,
	@UserName         nvarchar(50),
	@FirstName        nvarchar(50),
	@LastName        nvarchar(50),
	@Password         nvarchar(50),
	@Email            nvarchar(50),
	@MobileNumber     nvarchar(50)
AS

UPDATE [dbo].[MST_User]
SET	   
       [dbo].[MST_User].[UserName] = @UserName,
	   [dbo].[MST_User].[Password] = @Password,
	   [dbo].[MST_User].[FirstName] = @FirstName,
		[dbo].[MST_User].[LastName] = @LastName,
	   [dbo].[MST_User].[Email] = @Email,
	   [dbo].[MST_User].[MobileNumber] = @MobileNumber,
	   [dbo].[MST_User].[ModificationDate] = GETDATE()
WHERE  [dbo].[MST_User].[UserID] = @UserID
GO
USE [master]
GO
ALTER DATABASE [CarInfo] SET  READ_WRITE 
GO
