USE [master]
GO
/****** Object:  Database [Deals]    Script Date: 6/12/2017 3:50:34 p.m. ******/
CREATE DATABASE [Deals]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Deals', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Deals.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Deals_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\Deals_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Deals] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Deals].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Deals] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Deals] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Deals] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Deals] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Deals] SET ARITHABORT OFF 
GO
ALTER DATABASE [Deals] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Deals] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Deals] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Deals] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Deals] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Deals] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Deals] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Deals] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Deals] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Deals] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Deals] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Deals] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Deals] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Deals] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Deals] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Deals] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Deals] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Deals] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Deals] SET  MULTI_USER 
GO
ALTER DATABASE [Deals] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Deals] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Deals] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Deals] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Deals] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Deals] SET QUERY_STORE = OFF
GO
USE [Deals]
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
USE [Deals]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[City] [varchar](20) NULL,
	[Country] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[StoreId] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Card]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Card](
	[CardId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CardNumber] [varchar](20) NULL,
	[CardExpiryMonth] [int] NULL,
	[CardExpiryYear] [int] NULL,
	[CardHolderName] [varchar](20) NULL,
	[CardType] [varchar](20) NULL,
 CONSTRAINT [PK_Card] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupon]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupon](
	[CouponId] [int] IDENTITY(1,1) NOT NULL,
	[CouponUniqueText] [varchar](50) NULL,
	[CouponValidTill] [date] NULL,
	[UserId] [int] NULL,
	[DealId] [int] NULL,
	[AddedOn] [date] NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[CouponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerSupport]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerSupport](
	[CustomerSupportID] [int] NOT NULL,
	[CustomerEmail] [varchar](100) NOT NULL,
	[CustomerIssueSubject] [varchar](100) NOT NULL,
	[CustomerIssue] [varchar](max) NOT NULL,
	[IssueStage] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
	[AdminResponse] [varchar](max) NULL,
 CONSTRAINT [PK_CustomerSupport] PRIMARY KEY CLUSTERED 
(
	[CustomerSupportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Deal]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Deal](
	[DealId] [int] IDENTITY(1,1) NOT NULL,
	[StoreId] [int] NULL,
	[ValidTill] [datetime] NULL,
	[Discount] [int] NULL,
	[StrikePrice] [decimal](18, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[Title] [varchar](200) NULL,
	[Description] [varchar](2000) NULL,
	[AddedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Deals] PRIMARY KEY CLUSTERED 
(
	[DealId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealImage]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealImage](
	[DealImageId] [int] IDENTITY(1,1) NOT NULL,
	[DealImage] [varchar](500) NULL,
	[DealImageDesc] [varchar](500) NULL,
	[ImageTags] [varchar](500) NULL,
	[DealId] [int] NULL,
 CONSTRAINT [PK_DealImages] PRIMARY KEY CLUSTERED 
(
	[DealImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogTracker]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogTracker](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Message] [varchar](max) NULL,
	[AddedOn] [datetime] NULL,
 CONSTRAINT [PK_LogTracker] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationId] [int] NOT NULL,
	[NotificationMessage] [varchar](max) NULL,
	[AddedOn] [datetime] NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Store]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Store](
	[StoreId] [int] IDENTITY(1,1) NOT NULL,
	[StoreName] [varchar](50) NULL,
	[UserId] [int] NULL,
	[Contact] [varchar](20) NULL,
	[IdentificationImage] [varchar](500) NULL,
	[CompanyId] [int] NULL,
	[IsValid] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Store] PRIMARY KEY CLUSTERED 
(
	[StoreId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[SubscriptionId] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionTitle] [varchar](20) NULL,
	[SubscriptionDiscription] [varchar](max) NULL,
	[SubscriptionPrice] [int] NULL,
	[AddedOn] [date] NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserType] [int] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Contact] [varchar](20) NULL,
	[Street] [varchar](30) NULL,
	[Suburb] [varchar](30) NULL,
	[City] [varchar](30) NULL,
	[Region] [varchar](30) NULL,
	[Country] [varchar](30) NULL,
	[PinCode] [int] NULL,
	[isContactVerified] [bit] NULL,
	[isLocked] [bit] NULL,
	[AddedOn] [date] NULL,
	[UserSubscritionId] [int] NULL,
	[UserPromoCode] [varchar](20) NULL,
	[RefferedByUser] [int] NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserProfileEmail] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscrition]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscrition](
	[UserSubscriptionId] [int] NOT NULL,
	[UserSubscritionDate] [date] NULL,
	[UserSubscritionRenewalDate] [date] NULL,
	[UserId] [int] NULL,
	[SubscriptionId] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[UserSubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserType](
	[UserTypeId] [int] IDENTITY(1,1) NOT NULL,
	[UserTypeName] [varchar](15) NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UserType] UNIQUE NONCLUSTERED 
(
	[UserTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserVerification]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserVerification](
	[UserVerificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserVerificationCode] [uniqueidentifier] NOT NULL,
	[Userid] [int] NOT NULL,
	[Purpose] [varchar](20) NULL,
	[AddedOn] [datetime] NULL,
 CONSTRAINT [PK_UserVerification_1] PRIMARY KEY CLUSTERED 
(
	[UserVerificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallet]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallet](
	[WalletId] [int] IDENTITY(1,1) NOT NULL,
	[WalletCredit] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Wallet] PRIMARY KEY CLUSTERED 
(
	[WalletId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WishList]    Script Date: 6/12/2017 3:50:35 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WishList](
	[WishlistID] [int] IDENTITY(1,1) NOT NULL,
	[DealId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[AddedOn] [datetime] NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[WishlistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Subscription] ADD  CONSTRAINT [DF_Subscription_AddedOn]  DEFAULT (getdate()) FOR [AddedOn]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_Store]
GO
ALTER TABLE [dbo].[Card]  WITH CHECK ADD  CONSTRAINT [FK_Card_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Card] CHECK CONSTRAINT [FK_Card_UserProfile]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_Deals] FOREIGN KEY([DealId])
REFERENCES [dbo].[Deal] ([DealId])
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_Deals]
GO
ALTER TABLE [dbo].[Coupon]  WITH CHECK ADD  CONSTRAINT [FK_Coupon_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Coupon] CHECK CONSTRAINT [FK_Coupon_UserProfile]
GO
ALTER TABLE [dbo].[Deal]  WITH CHECK ADD  CONSTRAINT [FK_Deals_Store] FOREIGN KEY([StoreId])
REFERENCES [dbo].[Store] ([StoreId])
GO
ALTER TABLE [dbo].[Deal] CHECK CONSTRAINT [FK_Deals_Store]
GO
ALTER TABLE [dbo].[DealImage]  WITH CHECK ADD  CONSTRAINT [FK_DealImages_Deals] FOREIGN KEY([DealId])
REFERENCES [dbo].[Deal] ([DealId])
GO
ALTER TABLE [dbo].[DealImage] CHECK CONSTRAINT [FK_DealImages_Deals]
GO
ALTER TABLE [dbo].[LogTracker]  WITH CHECK ADD  CONSTRAINT [FK_LogTracker_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LogTracker] CHECK CONSTRAINT [FK_LogTracker_UserProfile]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_UserProfile]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([CompanyId])
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_Company]
GO
ALTER TABLE [dbo].[Store]  WITH CHECK ADD  CONSTRAINT [FK_Store_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Store] CHECK CONSTRAINT [FK_Store_UserProfile]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_Subscription] FOREIGN KEY([UserSubscritionId])
REFERENCES [dbo].[Subscription] ([SubscriptionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_Subscription]
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD  CONSTRAINT [FK_UserProfile_UserType] FOREIGN KEY([UserType])
REFERENCES [dbo].[UserType] ([UserTypeId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserProfile] CHECK CONSTRAINT [FK_UserProfile_UserType]
GO
ALTER TABLE [dbo].[UserSubscrition]  WITH CHECK ADD  CONSTRAINT [FK_UserSubscrition_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserSubscrition] CHECK CONSTRAINT [FK_UserSubscrition_UserProfile]
GO
ALTER TABLE [dbo].[UserVerification]  WITH CHECK ADD  CONSTRAINT [FK_UserVeryfication_UserProfile] FOREIGN KEY([Userid])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserVerification] CHECK CONSTRAINT [FK_UserVeryfication_UserProfile]
GO
ALTER TABLE [dbo].[Wallet]  WITH CHECK ADD  CONSTRAINT [FK_Wallet_UserProfile] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Wallet] CHECK CONSTRAINT [FK_Wallet_UserProfile]
GO
ALTER TABLE [dbo].[WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Deal] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WishList] CHECK CONSTRAINT [FK_WishList_Deal]
GO
USE [master]
GO
ALTER DATABASE [Deals] SET  READ_WRITE 
GO
