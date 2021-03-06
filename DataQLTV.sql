/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [QLThuVien]    Script Date: 4/4/2018 4:18:44 PM ******/
CREATE DATABASE [QLThuVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLThuVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\QLThuVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLThuVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\QLThuVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [QLThuVien] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLThuVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLThuVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLThuVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLThuVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLThuVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLThuVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLThuVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLThuVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLThuVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLThuVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLThuVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLThuVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLThuVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLThuVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLThuVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLThuVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLThuVien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLThuVien] SET  MULTI_USER 
GO
ALTER DATABASE [QLThuVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLThuVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLThuVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLThuVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLThuVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLThuVien] SET QUERY_STORE = OFF
GO
USE [QLThuVien]
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
USE [QLThuVien]
GO
/****** Object:  Table [dbo].[CTMuonTra]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CTMuonTra](
	[MaPM] [char](10) NOT NULL,
	[MaSach] [char](10) NOT NULL,
	[TrangThai] [bit] NOT NULL,
	[NgayTra] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPM] ASC,
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocGia]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocGia](
	[MaDG] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[GioiTinh] [nchar](3) NULL,
	[SDT] [char](12) NULL,
	[DiaChi] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KeSach]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KeSach](
	[MaKS] [char](10) NOT NULL,
	[TenKe] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MuonTra]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MuonTra](
	[MaPM] [char](10) NOT NULL,
	[MaDG] [char](10) NULL,
	[NgayMuon] [date] NOT NULL,
	[HenTra] [date] NOT NULL,
	[MaNV_GD] [char](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NULL,
	[SDT] [char](12) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[MaNXB] [char](10) NOT NULL,
	[TenNXB] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[Email] [varchar](30) NULL,
	[TT_DaiDien] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNXB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Phat]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Phat](
	[MaPP] [char](10) NOT NULL,
	[MaSach] [char](10) NULL,
	[MaPM] [char](10) NULL,
	[CapDo] [int] NOT NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[MaSach] [char](10) NOT NULL,
	[MaTP] [char](10) NULL,
	[TrangThai] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[MaTG] [char](10) NOT NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[NamSinh] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacPham]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacPham](
	[MaTP] [char](10) NOT NULL,
	[TenSach] [nvarchar](50) NOT NULL,
	[MaTG] [char](10) NULL,
	[MaTL] [char](10) NULL,
	[NgayDangKy] [date] NULL,
	[MaNXB] [char](10) NULL,
	[NamXB] [date] NULL,
	[GiaSach] [money] NULL,
	[MaKS] [char](10) NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TheLoai]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheLoai](
	[MaTL] [char](10) NOT NULL,
	[TenTL] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/4/2018 4:18:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [nvarchar](50) NULL,
	[pass] [nvarchar](50) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM01      ', N'S01       ', 1, CAST(N'2018-02-10' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM02      ', N'S02       ', 0, CAST(N'2018-03-12' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM03      ', N'S03       ', 1, CAST(N'2018-04-11' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM04      ', N'S04       ', 1, CAST(N'2018-05-03' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM05      ', N'S05       ', 0, CAST(N'2018-06-01' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM06      ', N'S06       ', 1, CAST(N'2018-04-02' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM07      ', N'S07       ', 0, CAST(N'2018-03-09' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM08      ', N'S08       ', 1, CAST(N'2018-04-11' AS Date))
INSERT [dbo].[CTMuonTra] ([MaPM], [MaSach], [TrangThai], [NgayTra]) VALUES (N'PM09      ', N'S09       ', 1, CAST(N'2018-02-12' AS Date))
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG01      ', N'Nguyễn Tiến Minh', CAST(N'1997-12-22' AS Date), N'Nam', N'0123456789  ', N'Trần Cung,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG02      ', N'Phạm Ngọc Đạt', CAST(N'1999-07-12' AS Date), N'Nam', N'02345678901 ', N'Phạm Văn Đồng ,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG03      ', N'Nguyễn Ngọc Ánh', CAST(N'1996-02-01' AS Date), N'Nữ ', N'0123456789  ', N'Trần Cung,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG04      ', N'Nguyễn Đức Thành', CAST(N'1995-11-21' AS Date), N'Nam', N'01675478216 ', N'Mai Dịch,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG05      ', N'Nguyễn Tuấn Hoàng Anh', CAST(N'1999-12-22' AS Date), N'Nam', N'0123456789  ', N'Cầu Giấy,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG06      ', N'Hoàng Thị Quỳnh Mai', CAST(N'1997-03-11' AS Date), N'Nữ ', N'0123456789  ', N'Thanh Xuân,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG07      ', N'Trần Văn Hiếu', CAST(N'1998-10-20' AS Date), N'Nam', N'01646060889 ', N'Mê Linh,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG08      ', N'Hà Hải Dương', CAST(N'1999-01-01' AS Date), N'Nam', N'0123456789  ', N'Kim Sơn , Ninh Bình')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG09      ', N'Tạ Văn Chiến', CAST(N'2000-09-12' AS Date), N'Nam', N'0212345678  ', N'Mê Linh,Hà Nội')
INSERT [dbo].[DocGia] ([MaDG], [HoTen], [NgaySinh], [GioiTinh], [SDT], [DiaChi]) VALUES (N'DG10      ', N'Phạm Trung Đông', CAST(N'1994-11-14' AS Date), N'Nam', N'06789213768 ', N'Mê Linh,Hà Nội')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS01      ', N'Kệ A')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS02      ', N'Kệ B')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS03      ', N'Kệ C')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS04      ', N'Kệ D')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS05      ', N'Kệ E')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS06      ', N'Kệ F')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS07      ', N'Kệ G')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS08      ', N'Kệ H')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS09      ', N'Kệ I')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS10      ', N'Kệ K')
INSERT [dbo].[KeSach] ([MaKS], [TenKe]) VALUES (N'KS11      ', N'Kệ L')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM01      ', N'DG01      ', CAST(N'2018-01-12' AS Date), CAST(N'2018-03-12' AS Date), N'NV01      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM02      ', N'DG02      ', CAST(N'2018-01-01' AS Date), CAST(N'2018-03-01' AS Date), N'NV02      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM03      ', N'DG03      ', CAST(N'2017-11-11' AS Date), CAST(N'2018-03-11' AS Date), N'NV03      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM04      ', N'DG04      ', CAST(N'2017-12-10' AS Date), CAST(N'2018-02-12' AS Date), N'NV04      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM05      ', N'DG05      ', CAST(N'2017-10-02' AS Date), CAST(N'2017-12-12' AS Date), N'NV05      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM06      ', N'DG06      ', CAST(N'2018-01-22' AS Date), CAST(N'2018-03-09' AS Date), N'NV06      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM07      ', N'DG07      ', CAST(N'2018-02-21' AS Date), CAST(N'2018-03-01' AS Date), N'NV07      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM08      ', N'DG08      ', CAST(N'2018-01-20' AS Date), CAST(N'2018-03-02' AS Date), N'NV08      ')
INSERT [dbo].[MuonTra] ([MaPM], [MaDG], [NgayMuon], [HenTra], [MaNV_GD]) VALUES (N'PM09      ', N'DG09      ', CAST(N'2017-12-03' AS Date), CAST(N'2018-02-12' AS Date), N'NV09      ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV01      ', N'Phạm Tiến Dương', CAST(N'1993-12-22' AS Date), N'0912345678  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV02      ', N'Trần Văn Cường', CAST(N'1992-10-12' AS Date), N'0134123456  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV03      ', N'Phan Thị Hạnh', CAST(N'1990-09-12' AS Date), N'0983280146  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV04      ', N'Vũ Thị Hồng Ngọc', CAST(N'1997-10-03' AS Date), N'0961159347  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV05      ', N'Nguyễn Thị Thu Hà', CAST(N'1998-10-22' AS Date), N'0123456789  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV06      ', N'Đào Thị Dung', CAST(N'1992-12-09' AS Date), N'0987654321  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV07      ', N'Hà Minh Đức', CAST(N'1996-12-04' AS Date), N'0321456789  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV08      ', N'Phạm Hồng Kỳ', CAST(N'1995-02-12' AS Date), N'0768943569  ')
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [NgaySinh], [SDT]) VALUES (N'NV09      ', N'Lê Hoàng Long', CAST(N'1993-01-12' AS Date), N'0934567778  ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [Email], [TT_DaiDien]) VALUES (N'NXB01     ', N'Kim Đồng', N'Hà Nội', N'nxbkimdong@gmail.com', N'Nguyễn Công Sơn')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [Email], [TT_DaiDien]) VALUES (N'NXB02     ', N'Thanh Niên', N'Thanh Xuân', N'thanhnien@gmail.com', N'Trần Bắc Hà')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [Email], [TT_DaiDien]) VALUES (N'NXB03     ', N'Quốc Gia', N'Kim Mã', N'nxbdhquocgia@gmail.com', N'Hà Kim Nữ')
INSERT [dbo].[NXB] ([MaNXB], [TenNXB], [DiaChi], [Email], [TT_DaiDien]) VALUES (N'NXB04     ', N'Thiếu Nhi', N'Vĩnh Phúc', N'nxbthieunhi@gmail.com', N'Trịnh Công Sơn')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP01      ', N'S01       ', N'PM01      ', 1, N'quá hạn')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP02      ', N'S02       ', N'PM02      ', 1, N'sách bị nhàu')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP03      ', N'S03       ', N'PM03      ', 2, N'rách 1 trang')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP04      ', N'S04       ', N'PM04      ', 3, N'quá hạn quá lâu')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP05      ', N'S05       ', N'PM05      ', 1, N'quá hạn')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP06      ', N'S06       ', N'PM06      ', 2, N'rách sách')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP07      ', N'S07       ', N'PM07      ', 3, N'hỏng sách')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP08      ', N'S08       ', N'PM08      ', 2, N'rách một số trang')
INSERT [dbo].[Phat] ([MaPP], [MaSach], [MaPM], [CapDo], [GhiChu]) VALUES (N'PP09      ', N'S09       ', N'PM09      ', 1, N'quá hạn')
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S01       ', N'TP01      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S02       ', N'TP02      ', 0)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S03       ', N'TP03      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S04       ', N'TP04      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S05       ', N'TP05      ', 0)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S06       ', N'TP06      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S07       ', N'TP07      ', 0)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S08       ', N'TP08      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S09       ', N'TP09      ', 1)
INSERT [dbo].[Sach] ([MaSach], [MaTP], [TrangThai]) VALUES (N'S10       ', N'TP10      ', 1)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG01      ', N'Tố Hữu', CAST(N'1950-01-01' AS Date), N'Hà Nam', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG02      ', N'Nam Cao', CAST(N'1958-01-01' AS Date), N'Hà Nam', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG03      ', N'Xuân Diệu', CAST(N'1943-01-01' AS Date), N'Lào Cai', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG04      ', N'Hồ Xuân Hương', CAST(N'1830-01-01' AS Date), N'Thanh Hóa', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG05      ', N'Hồ Chí Minh', CAST(N'1949-01-01' AS Date), N'Nghệ An', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG06      ', N'Tế Hanh', CAST(N'1941-01-01' AS Date), N'Cà Mau', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG07      ', N'Vũ Trọng Phụng', CAST(N'1960-01-01' AS Date), N'Huế', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG08      ', N'Nguyễn Trãi', CAST(N'1765-01-01' AS Date), N'Quảng Bình', NULL)
INSERT [dbo].[TacGia] ([MaTG], [HoTen], [NamSinh], [QueQuan], [GhiChu]) VALUES (N'TG09      ', N'Nguyễn Du', CAST(N'1732-01-01' AS Date), N'Quảng Nam', NULL)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP01      ', N'Chuyện con mèo dạy hải âu bay', N'TG01      ', N'TL03      ', CAST(N'2006-03-20' AS Date), N'NXB03     ', CAST(N'2003-01-01' AS Date), 59000.0000, N'KS03      ', 50)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP02      ', N'Sherlock Holmes', N'TG05      ', N'TL01      ', CAST(N'2009-04-13' AS Date), N'NXB01     ', CAST(N'1998-01-01' AS Date), 143000.0000, N'KS02      ', 90)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP03      ', N'Vật lý đại cương', N'TG02      ', N'TL06      ', CAST(N'1982-05-25' AS Date), N'NXB04     ', CAST(N'1990-01-01' AS Date), 30000.0000, N'KS01      ', 142)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP04      ', N'Cha giàu,cha nghèo', N'TG08      ', N'TL09      ', CAST(N'1997-08-08' AS Date), N'NXB04     ', CAST(N'2001-01-01' AS Date), 63000.0000, N'KS04      ', 87)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP05      ', N'Nguyễn Trãi bút ký', N'TG07      ', N'TL03      ', CAST(N'2006-03-20' AS Date), N'NXB01     ', CAST(N'2000-01-01' AS Date), 70000.0000, N'KS05      ', 20)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP06      ', N'Búp sen vàng', N'TG03      ', N'TL04      ', CAST(N'2002-07-29' AS Date), N'NXB02     ', CAST(N'1992-01-01' AS Date), 132000.0000, N'KS06      ', 95)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP07      ', N'Đội quân nhí nhố', N'TG09      ', N'TL03      ', CAST(N'1980-12-23' AS Date), N'NXB04     ', CAST(N'1996-01-01' AS Date), 5000.0000, N'KS08      ', 150)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP08      ', N'Vùng đất hứa', N'TG06      ', N'TL08      ', CAST(N'2010-11-12' AS Date), N'NXB02     ', CAST(N'2003-01-01' AS Date), 16000.0000, N'KS08      ', 160)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP09      ', N'Chân trời góc bể', N'TG04      ', N'TL07      ', CAST(N'2000-10-24' AS Date), N'NXB03     ', CAST(N'1999-01-01' AS Date), 23000.0000, N'KS07      ', 112)
INSERT [dbo].[TacPham] ([MaTP], [TenSach], [MaTG], [MaTL], [NgayDangKy], [MaNXB], [NamXB], [GiaSach], [MaKS], [SoLuong]) VALUES (N'TP10      ', N'Thanh mai trúc mã', N'TG05      ', N'TL08      ', CAST(N'2000-05-20' AS Date), N'NXB04     ', CAST(N'1988-01-01' AS Date), 89000.0000, N'KS10      ', 147)
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL01      ', N'Trinh Thám')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL02      ', N'Tình Cảm,Lãng Mạn')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL03      ', N'Thiếu Nhi')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL04      ', N'Chính Trị')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL05      ', N'Khoa Học Viễn Tưởng')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL06      ', N'Giáo Khoa')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL07      ', N'Địa Lý')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL08      ', N'Lịch Sử')
INSERT [dbo].[TheLoai] ([MaTL], [TenTL]) VALUES (N'TL09      ', N'Kinh Doanh')
ALTER TABLE [dbo].[CTMuonTra]  WITH CHECK ADD FOREIGN KEY([MaPM])
REFERENCES [dbo].[MuonTra] ([MaPM])
GO
ALTER TABLE [dbo].[CTMuonTra]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD FOREIGN KEY([MaDG])
REFERENCES [dbo].[DocGia] ([MaDG])
GO
ALTER TABLE [dbo].[MuonTra]  WITH CHECK ADD FOREIGN KEY([MaNV_GD])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[Phat]  WITH CHECK ADD FOREIGN KEY([MaPM])
REFERENCES [dbo].[MuonTra] ([MaPM])
GO
ALTER TABLE [dbo].[Phat]  WITH CHECK ADD FOREIGN KEY([MaSach])
REFERENCES [dbo].[Sach] ([MaSach])
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD FOREIGN KEY([MaTP])
REFERENCES [dbo].[TacPham] ([MaTP])
GO
ALTER TABLE [dbo].[TacPham]  WITH CHECK ADD FOREIGN KEY([MaKS])
REFERENCES [dbo].[KeSach] ([MaKS])
GO
ALTER TABLE [dbo].[TacPham]  WITH CHECK ADD FOREIGN KEY([MaNXB])
REFERENCES [dbo].[NXB] ([MaNXB])
GO
ALTER TABLE [dbo].[TacPham]  WITH CHECK ADD FOREIGN KEY([MaTG])
REFERENCES [dbo].[TacGia] ([MaTG])
GO
ALTER TABLE [dbo].[TacPham]  WITH CHECK ADD FOREIGN KEY([MaTL])
REFERENCES [dbo].[TheLoai] ([MaTL])
GO
ALTER TABLE [dbo].[DocGia]  WITH CHECK ADD CHECK  (([GioiTinh]='Nam' OR [GioiTinh]=N'Nữ'))
GO
USE [master]
GO
ALTER DATABASE [QLThuVien] SET  READ_WRITE 
GO
