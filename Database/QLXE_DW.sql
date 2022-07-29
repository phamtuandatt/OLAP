create database QLXE_WAREHOUSE
go
use QLXE_WAREHOUSE

go
create table Dim_NhanVien
(
	MANV char(5) not null,
	TENNV nvarchar(50),
	NGAYSINH date,
	DIACHI nvarchar(100),
	constraint PK_Dim_NhanVien primary key (MANV),
)

create table Dim_Loai
(
	MALOAI char(5) not null,
	TENLOAI nvarchar(50),
	constraint PK_Dim_Loai primary key (MALOAI),
)
go
create table Dim_Xe
(
	MAXE char(5) not null,
	TENXE nvarchar(50),
	MALOAI char(5),
	MOTA nvarchar(500),
	constraint PK_Dim_Xe primary key (MAXE),
	constraint FK_Dim_Xe_Loai foreign key (MALOAI) references Dim_Loai(MaLoai),
)

go
create table Dim_KhuVuc
(
	MAKV char(10) not null,
	TENKV nvarchar(100),	
	constraint PK_Dim_KhuVuc primary key (MAKV),
)
create table Dim_ChiNhanh
(
	MACN char(5) not null,
	TENCN nvarchar(50),
	DIACHI nvarchar(100),
	SDT nvarchar(10),
	MAKV char(10),
	constraint PK_Dim_ChiNhanh primary key (MACN),
	constraint FK_Dim_CN_KV foreign key (MAKV) references Dim_KhuVuc(MAKV),
)

go
create table Dim_KhachHang
(
	MAKH char(5) not null,
	TENKH nvarchar(50),
	SDTKH char(10),
	EMAILKH nvarchar(100),
	DCKH nvarchar(100),
	NGAYSINH date,
	THUNHAP float,
	constraint PK_Dim_KhachHang primary key (MAKH),
)

go
create table Dim_ThoiGian
( 
	NGAYTHANGNAM DATE not null,
	NGAY int,
	THANG int,
	NAM int,
	constraint PK_Dim_ThoiGian primary key (NGAYTHANGNAM),
)

go
create table Fact_DoanhThu
(
	
	MAXE char(5) not null,
	MACN char(5) not null,
	NGAYTHANGNAM DATE not null,
	MANV char(5) not null,
	MAKH char(5) not null,
	SOLUONG int,
	GIABAN int,
	THANHTIEN int,
	constraint PK_Fact_DoanhThu primary key (MAXE, MACN, NGAYTHANGNAM, MANV, MAKH),
	constraint FK_Fact_DoanhThu_Dim_Xe foreign key (MAXE) references Dim_Xe(MAXE),
	constraint FK_Fact_DoanhThu_Dim_ChiNhanh foreign key (MACN) references Dim_ChiNhanh(MACN),
	constraint FK_Fact_DoanhThu_Dim_ThoiGian foreign key (NGAYTHANGNAM) references Dim_ThoiGian(NGAYTHANGNAM),
	constraint FK_Fact_DoanhThu_Dim_NhanVien foreign key (MANV) references Dim_NhanVien(MANV),
	constraint FK_Fact_DoanhThu_Dim_KhachHang foreign key (MAKH) references Dim_KhachHang(MAKH),
)
drop table Dim_ThoiGian
drop table Fact_DoanhThu

delete from Fact_DoanhThu
delete from Dim_ChiNhanh
delete from Dim_KhachHang
delete from Dim_KhuVuc
delete from Dim_Xe
delete from Dim_Loai
delete from Dim_ThoiGian
delete from Dim_NhanVien

-----------xem bang
select * from Fact_DoanhThu
select * from Dim_ChiNhanh
select * from Dim_KhachHang
select * from Dim_KhuVuc
select * from Dim_Xe
select * from Dim_Loai
select * from Dim_ThoiGian
select * from Dim_NhanVien

--=====================================================================================================
go
create proc get_doanh_thu
as
	select TENNV, TENKH, TENXE, TENCN, Fact_DoanhThu.NGAYTHANGNAM, SOLUONG, GIABAN, THANHTIEN
	from ((((Fact_DoanhThu inner join Dim_NhanVien on Fact_DoanhThu.MANV = Dim_NhanVien.MANV) 
		inner join Dim_KhachHang on Fact_DoanhThu.MAKH = Dim_KhachHang.MAKH)
		inner join Dim_Xe on Fact_DoanhThu.MAXE = Dim_Xe.MAXE) 
		inner join Dim_ChiNhanh on Fact_DoanhThu.MACN = Dim_ChiNhanh.MACN)
		inner join Dim_ThoiGian on Fact_DoanhThu.NGAYTHANGNAM = Dim_ThoiGian.NGAYTHANGNAM

exec get_doanh_thu

------------------------------------------------------
go
create proc get_doanh_thu_loai_xe @maloai char(10)
as
	select TENNV, TENKH, TENXE, TENCN, Fact_DoanhThu.NGAYTHANGNAM, SOLUONG, GIABAN, THANHTIEN
	from ((((Fact_DoanhThu inner join Dim_NhanVien on Fact_DoanhThu.MANV = Dim_NhanVien.MANV) 
		inner join Dim_KhachHang on Fact_DoanhThu.MAKH = Dim_KhachHang.MAKH)
		inner join Dim_Xe on Fact_DoanhThu.MAXE = Dim_Xe.MAXE) 
		inner join Dim_ChiNhanh on Fact_DoanhThu.MACN = Dim_ChiNhanh.MACN)
		inner join Dim_ThoiGian on Fact_DoanhThu.NGAYTHANGNAM = Dim_ThoiGian.NGAYTHANGNAM
	where Dim_Xe.MALOAI = @maloai

exec get_doanh_thu_loai_xe 'HD'

------------------------------------------------------
go
create proc get_doanh_thu_loai_xe_khu_vuc @maloai char(10), @ma_khu_vuc char(10)
as
	select TENNV, TENKH, TENXE, TENCN, Fact_DoanhThu.NGAYTHANGNAM, SOLUONG, GIABAN, THANHTIEN
	from ((((Fact_DoanhThu inner join Dim_NhanVien on Fact_DoanhThu.MANV = Dim_NhanVien.MANV) 
		inner join Dim_KhachHang on Fact_DoanhThu.MAKH = Dim_KhachHang.MAKH)
		inner join Dim_Xe on Fact_DoanhThu.MAXE = Dim_Xe.MAXE) 
		inner join Dim_ChiNhanh on Fact_DoanhThu.MACN = Dim_ChiNhanh.MACN)
		inner join Dim_ThoiGian on Fact_DoanhThu.NGAYTHANGNAM = Dim_ThoiGian.NGAYTHANGNAM
	where Dim_Xe.MALOAI = @maloai and MAKV = @ma_khu_vuc

exec get_doanh_thu_loai_xe_khu_vuc 'HD', 'KV02'

------------------------------------------------------
go
create proc get_doanh_thu_khu_vuc @ma_khu_vuc char(10)
as
	select TENNV, TENKH, TENXE, TENCN, Fact_DoanhThu.NGAYTHANGNAM, SOLUONG, GIABAN, THANHTIEN
	from ((((Fact_DoanhThu inner join Dim_NhanVien on Fact_DoanhThu.MANV = Dim_NhanVien.MANV) 
		inner join Dim_KhachHang on Fact_DoanhThu.MAKH = Dim_KhachHang.MAKH)
		inner join Dim_Xe on Fact_DoanhThu.MAXE = Dim_Xe.MAXE) 
		inner join Dim_ChiNhanh on Fact_DoanhThu.MACN = Dim_ChiNhanh.MACN)
		inner join Dim_ThoiGian on Fact_DoanhThu.NGAYTHANGNAM = Dim_ThoiGian.NGAYTHANGNAM
	where MAKV = @ma_khu_vuc

exec get_doanh_thu_khu_vuc 'KV01'

------------------------------------------------------
go
create proc get_loai_xe
as
	select TENLOAI, MALOAI
	from Dim_Loai

exec get_loai_xe

------------------------------------------------------
go
create proc get_khu_vuc
as
	select TENKV, MAKV
	from Dim_KhuVuc

exec get_loai_xe