USE [master]
GO
/****** Object:  Database [DesafioOrigin]    Script Date: 17/8/2023 18:40:54 ******/
CREATE DATABASE [DesafioOrigin]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DesafioOrigin', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DesafioOrigin.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DesafioOrigin_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DesafioOrigin_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DesafioOrigin] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DesafioOrigin].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DesafioOrigin] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DesafioOrigin] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DesafioOrigin] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DesafioOrigin] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DesafioOrigin] SET ARITHABORT OFF 
GO
ALTER DATABASE [DesafioOrigin] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DesafioOrigin] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DesafioOrigin] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DesafioOrigin] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DesafioOrigin] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DesafioOrigin] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DesafioOrigin] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DesafioOrigin] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DesafioOrigin] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DesafioOrigin] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DesafioOrigin] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DesafioOrigin] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DesafioOrigin] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DesafioOrigin] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DesafioOrigin] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DesafioOrigin] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [DesafioOrigin] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DesafioOrigin] SET RECOVERY FULL 
GO
ALTER DATABASE [DesafioOrigin] SET  MULTI_USER 
GO
ALTER DATABASE [DesafioOrigin] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DesafioOrigin] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DesafioOrigin] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DesafioOrigin] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DesafioOrigin] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DesafioOrigin] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DesafioOrigin', N'ON'
GO
ALTER DATABASE [DesafioOrigin] SET QUERY_STORE = ON
GO
ALTER DATABASE [DesafioOrigin] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DesafioOrigin]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/8/2023 18:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 17/8/2023 18:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Number] [nvarchar](16) NOT NULL,
	[Pin] [nvarchar](max) NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[Attempts] [int] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Salt] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Operations]    Script Date: 17/8/2023 18:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Operations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CardId] [int] NOT NULL,
	[OperationTypeId] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OperationTypes]    Script Date: 17/8/2023 18:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OperationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_OperationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17/8/2023 18:40:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230815225705_Inicial', N'7.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230817200855_hash', N'7.0.10')
GO
SET IDENTITY_INSERT [dbo].[Cards] ON 

INSERT [dbo].[Cards] ([Id], [UserId], [Number], [Pin], [IsLocked], [Attempts], [Balance], [Date], [Salt]) VALUES (1, 1, N'1111222233334444', N'BfVy57VshzgII2DJEDbH1WlGDru0IDwhKpLplO0j7hg=', 0, 0, CAST(480000.00 AS Decimal(18, 2)), CAST(N'2025-08-15T00:00:00.0000000' AS DateTime2), N'M7CYwyio+1EXQXcKri+zOQ==')
INSERT [dbo].[Cards] ([Id], [UserId], [Number], [Pin], [IsLocked], [Attempts], [Balance], [Date], [Salt]) VALUES (3, 1, N'2222333344445555', N'BfVy57VshzgII2DJEDbH1WlGDru0IDwhKpLplO0j7hg=', 0, 0, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-08-17T20:13:18.2610000' AS DateTime2), N'M7CYwyio+1EXQXcKri+zOQ==')
SET IDENTITY_INSERT [dbo].[Cards] OFF
GO
SET IDENTITY_INSERT [dbo].[Operations] ON 

INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (1, 1, 1, CAST(N'2023-08-15T00:00:00.0000000' AS DateTime2), CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (14, 1, 1, CAST(N'2023-08-17T17:43:44.5014799' AS DateTime2), CAST(500000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (15, 1, 2, CAST(N'2023-08-17T17:46:41.6247898' AS DateTime2), CAST(490000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (16, 1, 1, CAST(N'2023-08-17T17:59:41.6565575' AS DateTime2), CAST(490000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (17, 1, 1, CAST(N'2023-08-17T18:15:07.1455819' AS DateTime2), CAST(490000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (18, 1, 1, CAST(N'2023-08-17T18:21:38.5644865' AS DateTime2), CAST(490000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (19, 1, 1, CAST(N'2023-08-17T18:26:31.7176710' AS DateTime2), CAST(490000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (20, 1, 2, CAST(N'2023-08-17T18:28:15.4860434' AS DateTime2), CAST(480000.00 AS Decimal(18, 2)))
INSERT [dbo].[Operations] ([Id], [CardId], [OperationTypeId], [CreatedAt], [Amount]) VALUES (21, 1, 1, CAST(N'2023-08-17T18:28:29.3052909' AS DateTime2), CAST(480000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Operations] OFF
GO
SET IDENTITY_INSERT [dbo].[OperationTypes] ON 

INSERT [dbo].[OperationTypes] ([Id], [Description]) VALUES (1, N'Balance')
INSERT [dbo].[OperationTypes] ([Id], [Description]) VALUES (2, N'Retiro')
SET IDENTITY_INSERT [dbo].[OperationTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [DNI]) VALUES (1, N'Juan', N'Perez', 11111111)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
/****** Object:  Index [IX_Cards_UserId]    Script Date: 17/8/2023 18:40:54 ******/
CREATE NONCLUSTERED INDEX [IX_Cards_UserId] ON [dbo].[Cards]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operations_CardId]    Script Date: 17/8/2023 18:40:54 ******/
CREATE NONCLUSTERED INDEX [IX_Operations_CardId] ON [dbo].[Operations]
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Operations_OperationTypeId]    Script Date: 17/8/2023 18:40:54 ******/
CREATE NONCLUSTERED INDEX [IX_Operations_OperationTypeId] ON [dbo].[Operations]
(
	[OperationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cards] ADD  DEFAULT (N'') FOR [Salt]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_Users_UserId]
GO
ALTER TABLE [dbo].[Operations]  WITH CHECK ADD  CONSTRAINT [FK_Operations_Cards_CardId] FOREIGN KEY([CardId])
REFERENCES [dbo].[Cards] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_Cards_CardId]
GO
ALTER TABLE [dbo].[Operations]  WITH CHECK ADD  CONSTRAINT [FK_Operations_OperationTypes_OperationTypeId] FOREIGN KEY([OperationTypeId])
REFERENCES [dbo].[OperationTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Operations] CHECK CONSTRAINT [FK_Operations_OperationTypes_OperationTypeId]
GO
USE [master]
GO
ALTER DATABASE [DesafioOrigin] SET  READ_WRITE 
GO
