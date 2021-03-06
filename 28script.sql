USE [master]
GO
/****** Object:  Database [28Ruou]    Script Date: 17/06/2017 00:06:08 ******/
CREATE DATABASE [28Ruou]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'28Ruou', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\28Ruou.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'28Ruou_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\28Ruou_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [28Ruou] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [28Ruou].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [28Ruou] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [28Ruou] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [28Ruou] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [28Ruou] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [28Ruou] SET ARITHABORT OFF 
GO
ALTER DATABASE [28Ruou] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [28Ruou] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [28Ruou] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [28Ruou] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [28Ruou] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [28Ruou] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [28Ruou] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [28Ruou] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [28Ruou] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [28Ruou] SET  DISABLE_BROKER 
GO
ALTER DATABASE [28Ruou] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [28Ruou] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [28Ruou] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [28Ruou] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [28Ruou] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [28Ruou] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [28Ruou] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [28Ruou] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [28Ruou] SET  MULTI_USER 
GO
ALTER DATABASE [28Ruou] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [28Ruou] SET DB_CHAINING OFF 
GO
ALTER DATABASE [28Ruou] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [28Ruou] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [28Ruou] SET DELAYED_DURABILITY = DISABLED 
GO
USE [28Ruou]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 17/06/2017 00:06:08 ******/
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
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 17/06/2017 00:06:08 ******/
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
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 17/06/2017 00:06:08 ******/
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
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 17/06/2017 00:06:08 ******/
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
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 17/06/2017 00:06:08 ******/
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
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonDatHang]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonDatHang](
	[MaChiTietDonDatHang] [nvarchar](11) NOT NULL,
	[SoLuong] [int] NULL,
	[GiaBan] [int] NULL,
	[MaDonDatHang] [nvarchar](10) NULL,
	[MaSanPham] [int] NULL,
 CONSTRAINT [PK_ChiTietDonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTietDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonDatHang] [nvarchar](10) NOT NULL,
	[NgayLap] [datetime] NULL,
	[TongThanhTien] [int] NULL,
	[MaTinhTrang] [int] NULL,
	[UserID] [nvarchar](128) NULL,
	[GhiChu] [nvarchar](max) NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonDatHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HangSanXuat]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HangSanXuat](
	[MaHangSanXuat] [int] IDENTITY(1,1) NOT NULL,
	[TenHangSanXuat] [nvarchar](65) NULL,
	[LogoURL] [nvarchar](50) NULL,
	[BiXoa] [int] NULL,
 CONSTRAINT [PK_HangSanXuat] PRIMARY KEY CLUSTERED 
(
	[MaHangSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[Ma] [int] IDENTITY(1,1) NOT NULL,
	[TenHinh] [varchar](255) NULL,
	[MaSanPham] [int] NULL,
	[BiXoa] [bit] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[Ma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiSanPham] [nvarchar](65) NULL,
	[BiXoa] [int] NULL,
 CONSTRAINT [PK_LoaiSanPham] PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[TenSanPham] [nvarchar](max) NULL,
	[GiaSanPham] [int] NULL,
	[NgayNhap] [datetime] NULL,
	[SoLuongTon] [int] NULL,
	[SoLuongBan] [int] NULL,
	[SoLuocXem] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[BiXoa] [int] NULL,
	[MaLoaiSanPham] [int] NULL,
	[MaHangSanXuat] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 17/06/2017 00:06:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[MaTinhTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrang] PRIMARY KEY CLUSTERED 
(
	[MaTinhTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1', N'Khách hàng')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'2', N'Quản trị viên')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'268374e7-a16e-4ee0-ad21-d69e2a9bfa5a', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2aecc01f-fb0b-4fc5-b78f-20be5ddaf966', N'2')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'4acf1451-08a1-498f-85a3-57668a467405', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6f880d40-80a8-4861-ab4e-7500697488a0', N'1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'minda-admin-min-ad', N'2')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'268374e7-a16e-4ee0-ad21-d69e2a9bfa5a', N'dcf@gmail.com', 0, N'AAe6rhsEVi11QXbRLCoSXbrHTVb3ee2gnNkOFq4G3LXVBteuomxpKqUTE27j1EvrXA==', N'8d0ead0f-eee1-4c38-8e76-3abfe4ee81d7', NULL, 0, 0, NULL, 1, 0, N'dcf@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2aecc01f-fb0b-4fc5-b78f-20be5ddaf966', N'minhvu96@gmail.com', 0, N'AMtwRfULOPsBf7go1e7SkPtmPuXAn8yhp/l3IaEV4CpYreHw33CJW/5aAEldNCZdgg==', N'f04efdc3-09fb-4225-8aed-f4f946c575ea', NULL, 0, 0, NULL, 1, 0, N'minhvu96@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4acf1451-08a1-498f-85a3-57668a467405', N'abcd@gmail.com', 0, N'AHAmH+EHAU4yFAELsBhS86NXfVYDVX8so8Qr0NR8cQwbUZjynifW3fVTt7khuZRQXQ==', N'9e0763e5-5cf7-4649-afdf-f73a4f9686ac', NULL, 0, 0, NULL, 1, 0, N'abcd@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'6f880d40-80a8-4861-ab4e-7500697488a0', N'khachhang1@gmail.com', 0, N'ANB+4uuGG1f53eDbYTjDCemeBjhKyJVjcsz17VrObtfEq9FCh9gnCtCHWFx+Cr48SQ==', N'd23f9892-b5d4-47b8-8b75-a18fec67b179', NULL, 0, 0, NULL, 1, 0, N'khachhang1@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'minda-admin-min-ad', N'nimda', 0, N'AH4puMz1ylnEOISH2PQCoOb17YT77zqoDVEtTwKPfLQqPeJl7YRoVfb3urQuVt5xww==', N'60478da7-5c25-45bc-ad36-d9a77e0fe4a4', NULL, 0, 0, NULL, 1, 0, N'Quan tri')
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDonDatHang], [SoLuong], [GiaBan], [MaDonDatHang], [MaSanPham]) VALUES (N'CTDH1', 1, 899000, N'DDH00', 20)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDonDatHang], [SoLuong], [GiaBan], [MaDonDatHang], [MaSanPham]) VALUES (N'CTDH2', 200, 379800000, N'DDH01', 25)
INSERT [dbo].[ChiTietDonDatHang] ([MaChiTietDonDatHang], [SoLuong], [GiaBan], [MaDonDatHang], [MaSanPham]) VALUES (N'CTDH3', 1, 899000, N'DDH01', 20)
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayLap], [TongThanhTien], [MaTinhTrang], [UserID], [GhiChu]) VALUES (N'DDH00', CAST(N'2017-06-13 01:21:57.517' AS DateTime), 899000, 4, N'2aecc01f-fb0b-4fc5-b78f-20be5ddaf966', N'')
INSERT [dbo].[DonDatHang] ([MaDonDatHang], [NgayLap], [TongThanhTien], [MaTinhTrang], [UserID], [GhiChu]) VALUES (N'DDH01', CAST(N'2017-06-14 16:22:21.083' AS DateTime), 380699000, 2, N'4acf1451-08a1-498f-85a3-57668a467405', N'Téting')
SET IDENTITY_INSERT [dbo].[HangSanXuat] ON 

INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (1, N'Bulish', NULL, 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (2, N'Nauy', NULL, 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (3, N'Scotland', N'', 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (4, N'Loire', N'', 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (5, N'Burgundy', N'', 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (6, N'Pháp', N'', 0)
INSERT [dbo].[HangSanXuat] ([MaHangSanXuat], [TenHangSanXuat], [LogoURL], [BiXoa]) VALUES (7, N'Bitisss', N'', 1)
SET IDENTITY_INSERT [dbo].[HangSanXuat] OFF
SET IDENTITY_INSERT [dbo].[HinhAnh] ON 

INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1, N'Syma_Apache_Helicopter.jpg', 1, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (2, N'Syma_x1_01.jpg', 1, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1078, N'131413619144659224.jpg', 9, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1079, N'131413619144799349.jpg', 9, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1080, N'131413619397179051.jpg', 11, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1081, N'131413619397303935.jpg', 11, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1085, N'131413619883340354.jpg', NULL, 1)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1086, N'131413620076396101.jpg', 19, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1087, N'131413620076461168.jpg', 19, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1088, N'131413620248734431.jpg', 16, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1089, N'131413620248809472.jpg', 16, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1090, N'131413620450720135.jpg', 18, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1091, N'131413620450775174.jpg', 18, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1092, N'131413620662206196.jpg', 17, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1093, N'131413620662276242.jpg', 17, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1094, N'131413620844601426.jpg', 22, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1095, N'131413620844726541.jpg', 22, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1096, N'131413621016736813.jpg', 20, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1097, N'131413621016886920.jpg', 20, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1098, N'131413621292362761.jpg', 21, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1099, N'131413621292487858.jpg', 21, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1100, N'131413621900524115.jpg', 24, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1101, N'131413621900634172.jpg', 24, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1102, N'131413622062698025.jpg', 25, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1103, N'131413622062793105.jpg', 25, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1104, N'131413622422695596.jpg', 23, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1105, N'131413622422770653.jpg', 23, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1106, N'131413622653788254.jpg', 14, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1107, N'131413622811834423.jpg', 15, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1108, N'131413622811954496.jpg', 15, 0)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1109, N'131413624063977046.jpg', NULL, 1)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1111, N'131419009926953610.png', NULL, 1)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1112, N'131419009926953610.jpg', NULL, 1)
INSERT [dbo].[HinhAnh] ([Ma], [TenHinh], [MaSanPham], [BiXoa]) VALUES (1120, N'131419044664986460.png', 27, 0)
SET IDENTITY_INSERT [dbo].[HinhAnh] OFF
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (1, N'Rum', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (2, N'Vang', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (3, N'Vodka', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (4, N'Rượu', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (5, N'Whisy', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (6, N'Champanges', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (7, N'Chivas', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (8, N'Rượu Hennessy', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (10, N'Rượu Remy Martin', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (11, N'Rượu Singleton', 0)
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [BiXoa]) VALUES (12, N'Loai Bitiss', 1)
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (1, N'Rượu Bầu Đá', 2000000, NULL, 100, 0, 3, N'Nhập từ Đức', 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (3, N'Rượu Bầu Đá', 5000000, NULL, 100, 0, 4, N'Đặc sản của Việt Nam', 1, 1, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (6, N'Champagne đỏ', 2500000, NULL, 100, 0, 6, N'Hương vị đậm đà', 1, 6, 2)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (7, N'Rượu Trắng', 1000000, NULL, 100, 0, 1, N'Rượu trắng nhạp ngoạis', 1, 4, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (8, N'Chivas 18', 1098999, NULL, 100, 0, 1, N'Đặc điểm
Màu: vàng đậm hổ phách
Mùi: hương thơm nhiều lớp với hương trái cây khô và kẹo bơ.
Vị: nồng nàn, ngọt ngào và êm diệu một cách khác biệt với vị sôcôla đắng thoảng hương hoa thanh lịch và một ít hương khói, dư vị kéo dài, ấm áp và đáng nhớ.', 0, 7, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (9, N'Chivas 38', 13000000, NULL, 100, 0, 1, N'Hàng nhập ngoại', 0, 7, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (11, N'Chivas 62', 60000000, NULL, 100, 0, 0, NULL, 0, 7, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (14, N'SMIRNOFF BLACK', 319000, NULL, 100, 0, 0, NULL, 0, 3, 4)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (15, N'SMIRNOFF GOLD APPLE', 999000, NULL, 200, 0, 1, NULL, 0, 3, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (16, N'HENNESSY VSOP', 1099000, NULL, 200, 0, 0, NULL, 0, 8, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (17, N'HENNESSY XO', 3190000, NULL, 200, 0, 0, NULL, 0, 8, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (18, N'HENNESSY VSOP LIMITED EDITION 2016', 1299000, NULL, 245, 0, 0, NULL, 0, 8, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (19, N'HENNESSY EXCLUSIVE GOLD', 4999000, NULL, 250, 0, 0, NULL, 0, 8, 5)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (20, N'REMY MARTIN VSOP', 899000, NULL, 200, 0, 9, NULL, 0, 10, 1)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (21, N'REMY MARTIN XO', 2499000, NULL, 200, 0, 2, N'Dung Tích: 700 ml
Xuất Sứ: Pháp
Remy Martin XO là sản phẩm tốt nhất của Cognac XO, với sự nổi bật, kết cấu của nó phức tạp và phong phú, êm ái hơn và cân bằng hoàn hảo. Cognac tuyệt vời này là dành cho những người yêu cầu và thưởng thức tốt nhất trong cuộc sống', 0, 10, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (22, N'REMY MARTIN CLUB', 1599000, NULL, 200, 0, 1, NULL, 0, 10, 6)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (23, N'SINGLETON SIGNATURE', 999000, NULL, 130, 0, 0, N'Dung Tích: 700ml 
Nồng Độ: 40 %
Xuất xứ : Scotland
Dòng : Whisky', 0, 11, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (24, N'SINGLETON 12', 890000, NULL, 200, 0, 0, N'Dung Tích: 700ml 
Nồng Độ: 40 %
Xuất xứ : Scotland', 0, 11, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (25, N'SINGLETON 18', 1899000, NULL, 200, 0, 7, N'Dung Tích: 700ml 
Nồng Độ: 40 %
Xuất xứ : Scotland', 0, 11, 3)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaSanPham], [NgayNhap], [SoLuongTon], [SoLuongBan], [SoLuocXem], [MoTa], [BiXoa], [MaLoaiSanPham], [MaHangSanXuat]) VALUES (27, N'San Pham A', 10, CAST(N'2017-06-14 00:00:00.000' AS DateTime), 100, 0, 0, N'dds', 1, 12, 7)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[TinhTrang] ON 

INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (1, N'Đặt hàng')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (2, N'Đang giao hàng')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (3, N'Thanh toán')
INSERT [dbo].[TinhTrang] ([MaTinhTrang], [TenTinhTrang]) VALUES (4, N'Hủy')
SET IDENTITY_INSERT [dbo].[TinhTrang] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [RoleNameIndex]    Script Date: 17/06/2017 00:06:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 17/06/2017 00:06:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 17/06/2017 00:06:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_RoleId]    Script Date: 17/06/2017 00:06:08 ******/
CREATE NONCLUSTERED INDEX [IX_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_UserId]    Script Date: 17/06/2017 00:06:08 ******/
CREATE NONCLUSTERED INDEX [IX_UserId] ON [dbo].[AspNetUserRoles]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UserNameIndex]    Script Date: 17/06/2017 00:06:08 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang] FOREIGN KEY([MaDonDatHang])
REFERENCES [dbo].[DonDatHang] ([MaDonDatHang])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonDatHang_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[ChiTietDonDatHang] CHECK CONSTRAINT [FK_ChiTietDonDatHang_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_AspNetUsers]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_TinhTrang] FOREIGN KEY([MaTinhTrang])
REFERENCES [dbo].[TinhTrang] ([MaTinhTrang])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_TinhTrang]
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD  CONSTRAINT [FK_HinhAnh_SanPham] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[HinhAnh] CHECK CONSTRAINT [FK_HinhAnh_SanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_HangSanXuat] FOREIGN KEY([MaHangSanXuat])
REFERENCES [dbo].[HangSanXuat] ([MaHangSanXuat])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_HangSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
USE [master]
GO
ALTER DATABASE [28Ruou] SET  READ_WRITE 
GO
