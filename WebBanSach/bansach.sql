USE [master]
GO
/****** Object:  Database [BanSach]    Script Date: 28/07/2019 9:04:16 ******/
CREATE DATABASE [BanSach]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BanSach', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BanSach.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BanSach_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\BanSach_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [BanSach] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BanSach].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BanSach] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BanSach] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BanSach] SET ARITHABORT OFF 
GO
ALTER DATABASE [BanSach] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BanSach] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [BanSach] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BanSach] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BanSach] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BanSach] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BanSach] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BanSach] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BanSach] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BanSach] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BanSach] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BanSach] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BanSach] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BanSach] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BanSach] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BanSach] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BanSach] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BanSach] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BanSach] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BanSach] SET  MULTI_USER 
GO
ALTER DATABASE [BanSach] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BanSach] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BanSach] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BanSach] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [BanSach]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 28/07/2019 9:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[maChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[maSach] [int] NOT NULL,
	[soLuong] [int] NOT NULL,
	[phuongThucThanhToan] [nvarchar](50) NULL,
	[maDonHang] [int] NOT NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[maChiTiet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 28/07/2019 9:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[maDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[tenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__DanhMuc__6B0F914C276DAE74] PRIMARY KEY CLUSTERED 
(
	[maDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 28/07/2019 9:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDonHang] [int] IDENTITY(1,1) NOT NULL,
	[ngayBan] [datetime] NOT NULL,
	[maNguoiDung] [int] NULL,
	[tenNguoiNhan] [nvarchar](50) NOT NULL,
	[diaChiGiaoHang] [nvarchar](50) NOT NULL,
	[soDT] [nvarchar](50) NOT NULL,
	[thanhTien] [money] NOT NULL,
 CONSTRAINT [PK__DonHang__871D38190B3FF453] PRIMARY KEY CLUSTERED 
(
	[maDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 28/07/2019 9:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[maNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[hoTen] [nvarchar](50) NOT NULL,
	[gioiTinh] [bit] NULL,
	[email] [nvarchar](50) NULL,
	[soDT] [nvarchar](50) NULL,
	[diaChi] [nvarchar](50) NULL,
	[matKhau] [nvarchar](50) NOT NULL,
	[quyenHan] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__NguoiDun__446439EA757906E0] PRIMARY KEY CLUSTERED 
(
	[maNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sach]    Script Date: 28/07/2019 9:04:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[maSach] [int] IDENTITY(1,1) NOT NULL,
	[tenSach] [nvarchar](50) NOT NULL,
	[soLuong] [int] NOT NULL,
	[tacGia] [nvarchar](50) NULL,
	[nhaXuatBan] [nvarchar](50) NULL,
	[giaBia] [money] NULL,
	[giaBan] [money] NOT NULL,
	[anhBia] [nvarchar](200) NULL,
	[nhaPhatHanh] [nvarchar](50) NULL,
	[kichThuoc] [nvarchar](50) NULL,
	[soTrang] [int] NULL,
	[ngayPhatHanh] [datetime] NULL,
	[trongLuongVanChuyen] [int] NULL,
	[moTa] [nvarchar](max) NULL,
	[maDanhMuc] [int] NOT NULL,
 CONSTRAINT [PK__Sach__D2507EF96BAE6E85] PRIMARY KEY CLUSTERED 
(
	[maSach] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__maDon__1920BF5C] FOREIGN KEY([maDonHang])
REFERENCES [dbo].[DonHang] ([maDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__maDon__1920BF5C]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK__ChiTietDo__maSac__182C9B23] FOREIGN KEY([maSach])
REFERENCES [dbo].[Sach] ([maSach])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK__ChiTietDo__maSac__182C9B23]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK__DonHang__maNguoi__1A14E395] FOREIGN KEY([maNguoiDung])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK__DonHang__maNguoi__1A14E395]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK__Sach__maDanhMuc__173876EA] FOREIGN KEY([maDanhMuc])
REFERENCES [dbo].[DanhMuc] ([maDanhMuc])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK__Sach__maDanhMuc__173876EA]
GO
USE [master]
GO
ALTER DATABASE [BanSach] SET  READ_WRITE 
GO
