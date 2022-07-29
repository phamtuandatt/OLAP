create database QL_BanXe
go
use QL_BanXe
go
drop database QL_BanXe
create table LoaiHang
(
	MALOAI char(5) not null,
	TENLOAI nvarchar(100),
	constraint PK_LoaiHang primary key (MALOAI),
)
go
create table MatHang
(
	MAMH char(5) not null,
	TENMH nvarchar(100),
	MALOAI char(5),
	GIABAN int,
	MOTA nvarchar(100),
	constraint PK_MatHang primary key (MAMH),
	constraint FK_MatHang_LoaiHang foreign key (MALOAI) references LoaiHang(MALOAI),
)
go
create table Kho
(
	MAMH char(5) not null,
	SLT int,
	constraint PK_Kho primary key (MAMH),
	constraint FK_Kho_MatHang foreign key (MAMH) references MatHang(MAMH),
)
create table KhuVuc
(
		MAKV char(10),
		TENKV nvarchar(100),
		constraint PK_KhuVuc primary key (MAKV),
)
create table ChiNhanh
(
	MACN char(5) not null,
	TENCN nvarchar(50),
	SDTCN nvarchar(10),
	DIACHI NVARCHAR(100),
	MAKV char(10),
	constraint PK_ChiNhanh primary key (MACN),
	constraint FK_CN_KV foreign key (MAKV) references KhuVuc(MAKV),
)
go 
create table NhanVien
(
	MANV char(5) not null,
	TENNV nvarchar(50),
	NGSINH date,
	SDTNV char(10),
	EMAILNV nvarchar(100),
	DCNV nvarchar(100),
	MACN char(5),
	constraint PK_NhanVien primary key (MANV),
	constraint FK_NhanVien_ChiNhanh foreign key (MACN) references ChiNhanh(MACN),
)

go 
create table NhaCungCap
(
	MANCC char(5) not null,
	TENNCC nvarchar(50),
	SDTNCC nvarchar(10),
	EMAILNCC nvarchar(100),
	DCNCC nvarchar(100),
	constraint PK_NhaCungCap primary key (MANCC), 
)

go
create table KhachHang
(
	MAKH char(5) not null,
	TENKH nvarchar(50),
	SDTKH char(10),
	EMAILKH nvarchar(100),
	DCKH nvarchar(100),
	NGAYSINH date,
	THUNHAP float,
	constraint PK_KhachHang primary key (MAKH),
)
------------------------------------------------------------------------------------
go
create table HD_Ban
(
	MADB char(5) not null,
	MANV char(5),
	MAKH char(5),
	MACN char(5),
	NGAYBAN date,
	NGAY int,
	THANG int,
	NAM int,
	TONGSLBAN int,
	TONGTIEN int,
	constraint PK_HDBan primary key (MADB),
	constraint FK_HDBan_NhanVien foreign key (MANV) references NhanVien(MANV),
	constraint FK_HDBan_KhachHang foreign key (MAKH) references KhachHang(MAKH),
	constraint FK_HDBan_ChiNhanh foreign key (MACN) references ChiNhanh(MACN),
)
------------------------------------------------------------------------------------
go 
create table CT_HD_Ban
(
	MADB char(5) not null,
	MAMH char(5) not null,
	SLBAN int,
	GIABAN int,
	THANHTIEN int,
	constraint PK_CT_HD_Ban primary key (MADB, MAMH),
	constraint FK_CT_HD_Ban_HD_Ban foreign key (MADB) references HD_Ban(MADB),
	constraint FK_CT_HD_Ban_MatHang foreign key (MAMH) references MatHang(MAMH),
)

go
create table HD_Nhap
(
	MADN char(5) not null,
	MANV char(5),
	MANCC char(5),
	NGAYNHAP date,
	TONGSLNHAP int,
	TONGTIEN int,

	constraint PK_HDNhap primary key (MADN),
	constraint FK_HDNhap_NhanVien foreign key (MANV) references NhanVien(MANV),
	constraint FK_HDNhap_NhaCungCap foreign key (MANCC) references NhaCungCap(MANCC),
)

go 
create table CT_HD_Nhap
(
	MADN char(5) not null,
	MAMH char(5) not null,
	SLBAN int,
	GIABAN int,
	THANHTIEN int,
	constraint PK_CT_HD_Nhap primary key (MADN, MAMH),
	constraint FK_CT_HD_Nhap_HD_Nhap foreign key (MADN) references HD_Nhap(MADN),
	constraint FK_CT_HD_Nhap_MatHang foreign key (MAMH) references MatHang(MAMH),
)

-------------------------------------------------------------------------------------------
------------------------------------NHẬP DỮ LIỆU TRONG CÁC BẢNG-----------------------------

INSERT INTO LoaiHang
VALUES(N'HD',N'HonDa'),
(N'PA',N'Piago'),
(N'SK',N'Suzuki'),
(N'SYM',N'SYM'),
(N'YM',N'Yamaha'),
(N'KWSK',N'Kawasaki')

INSERT INTO MatHang
VALUES
(N'MH001',N'Honda Blade',N'HD',16500,N'Xe chạy êm, tiết kiệm nhiên liệu'),
(N'MH002',N'Honda AirBlack',N'HD',45700	,N'Dáng xe gọn, đuôi được thiết kế thể thao'),
(N'MH003',N'Honda Vison',N'HD',38500,N'Dáng xe uyển chuyển, thích hợp phái nữ'),
(N'MH004',N'Honda Wave Alpha 110',N'HD',23500,N'Khung xe chắc chắn, tăng tốc nhanh'),
(N'MH005',N'Honda SH Mode',N'HD', 51200	,N'Động cơ chạy êm, dáng xe cân đối'),
(N'MH006',N'Honda Future',N'HD',27500,N'Động cơ chạy khỏe, êm, khung xe chắc chắn'),
(N'MH007',N'Exciter',N'YM',51700,N'	Dòng xe côn tay, dáng xe thể thao, tốc độ nhanh, tăng tốc khỏe'),
(N'MH008',N'Sirius F1',N'YM', 27500,N'Chạy ổn định, khỏe'),
(N'MH009',N'Grande',N'YM',45000,N'Dòng xe tay ga, dáng xe thích hợp cho phái nữ'),
(N'MH010',N'Latte',N'YM',41700,N'Xe chạy êm, khung xe chắc chắn'),
(N'MH011',N'YZF-M3',N'YM',91700,N'Thiết kế hình dáng thể thao, tốc độ nhanh, tiết kiệm xăng'),
(N'MH012',N'MT-03',N'YM',77900,N'Tăng tốc khỏe, tốc độ nhanh, xe ổn định'),
(N'MH013',N'Bandit -150',N'SK',68900,N'Thiết kế thể thao, khung xe chắc chắn'),
(N'MH014',N'GSX-R150',N'SK',71900,N'Uy lực tiên phong, thiết kế cá tính'),
(N'MH015',N'Satria F150',N'SK',51900,N'Dáng xe nhỏ gọn, tăng tốc nhanh'),
(N'MH016',N'GZ150-A	',N'SK', 69500,N'Dòng xe côn tay cổ điện, khẳng định bản lĩnh'),
(N'MH017',N'Medley S 2020',N'PA',77600,N'Dòng xe ga, dáng xe uyển chuyển'),
(N'MH018',N'Honda Winner X',N'HD',45000000,N'Dòng xe thể thao đậm chất khí động lực'),
(N'MH019',N'Honda Super Cup C125 X',N'HD',85000000,N'Dòng xe có thiết kế cổ điển, thanh lịch đậm chất Super CUB'),
(N'MH020',N'NVX 155',N'YM',85000000,N'Dòng xe có thiết kế thể thao, dáng xe thích hợp cho phái nam to cao'),
(N'MH021',N'Janus',N'YM',54000000,N'Dáng xe được thiết kế từ hình ảnh của con nàng Gen Z trong chiếc áo choàng thời thượng'),
(N'MH022',N'2020 Z400 ABS',N'KWSK',149000000,N'Dòng xe đường phố được thiết kế với kiểu dáng mạnh mẽ, phong cách chiến binh'),
(N'MH023',N'NINJA H2 CARBON',N'KWSK',1299000000,N'Dòng xe đường phố/đường đua được thiết kế với kiểu dáng mạnh mẽ, công nghệ tiên tiến'),
(N'MH024',N'Z1000 ABS',N'KWSK',425000000,N'Dòng xe đường phố với kiểu thiết kế sugomi, âm thanh cuốn hút'),
(N'MH025',N'Liberty 125',N'PA',56500000,N'Dòng xe được thiết kế với kiểu dáng phong cách, gọn nhẹ và đậm chất Italy'),
(N'MH026',N'Raider R150',N'SK',51900000,N'Dáng xe được thiết kế với kiểu dáng thể thao độc nhất, đặc trưng của dòng xe Suzuki Underbone'),
(N'MH027',N'Honda Lead 125cc X',N'HD',41000000,N'Dòng xe được thiết kế với kiểu dáng thanh lịch và màu sắc thời thượng')

INSERT INTO KhuVuc
VALUES
(N'KV01', N'Thành Thị'),
(N'KV02',N'Nông Thôn')

INSERT INTO CHINHANH
VALUES
(N'CN001',N'Chi nhanh miền Nam',N'035246841',N'Phường 21 Văn Chung, Quận Tân Bình, TP.HCM',N'KV01' ),
(N'CN002',N'Chi nhanh Bình Dương',N'022654987',N'Huyện An Lão, Huyện Phước Long,TP Thủ Dầu 1',N'KV01' ),
(N'CN003',N'Chi nhánh Vũng Tàu',N'022356937',N'Phường Phạm Ngũ Lão,Huyện An Thành,TP Vũng Tàu',N'KV02' ),
(N'CN004',N'Chi nhánh TP.HCM',N'036487455',N'606D đường Trần Hưng Đạo, Quận 5, TP.HCM',N'KV02' )

SET DATEFORMAT DMY
INSERT INTO NHANVIEN
VALUES
(N'NV001',N'Phạm Tuấn Đạt','16/07/2001',0324567899,N'tuandat@gmail.com',N'Phường 13, Tân Bình, TPHCM','CN001'),
(N'NV002',N'Bùi Thị Ái Ly','12/12/2001'	,0984563217,N'	aily@gmail.com',N'Hóc Môn, TPHCM',N'CN002'),
(N'NV003',N'Nguyễn Ngọc Nhung','21/03/2001',0985321456,N'ngocnhung@gmail.com',N'TPHCM',N'CN003'),
(N'NV004',N'Võ Văn Tin','25/09/2001',0985123654,N'vantin@gmail.com',N'TPHCM',N'CN001')

INSERT INTO Kho
VALUES
(N'MH001',20),
(N'MH002',18),
(N'MH003',16),
(N'MH004',2),
(N'MH005',32),
(N'MH006',47),
(N'MH007',50),
(N'MH008',12),
(N'MH009',10),
(N'MH010',23),
(N'MH011',20),
(N'MH012',15),
(N'MH013',50),
(N'MH014',6),
(N'MH016',13),
(N'MH017',6),
(N'MH018',500),
(N'MH019',1200),
(N'MH020',1000),
(N'MH021',2300),
(N'MH022',6000),
(N'MH023',1800),
(N'MH024',300),
(N'MH025',623),
(N'MH026',1222),
(N'MH027',9200)

INSERT INTO NhaCungCap
VALUES
(N'NCC01',N'Nhà cung cấp Bình Dương',	022654987 ,N'binhduong@gmail.com',N'Bình Dương'),
(N'NCC02',N'Nhà cung cấp TPHCM',	022654789 ,N'tphcm@gmail.com',N'TPHCM'),
(N'NCC03',N'Nhà cung cấp Yamaha',	022354698,N' yamaha@gmail.com	',N'Vũng Tàu'),
(N'NCC04',N'Nhà cung cấp HonDa',	022314569 ,N'honda@gmail.com	',N'Biên Hòa'),
(N'NCC05',N'Nhà cung cấp Miền Nam',	022145798 ,N'miennam@gmail.com	',N'Tây Ninh')

SET DATEFORMAT DMY
INSERT INTO KhachHang
VALUES
(N'KH001',N'Nguyễn Văn Măng',	0321654789,N'mang@gmail.com',N'TPHCM','12/04/1993',32000000),
(N'KH002',N'Lê Thị Tre',	0213465978,N'thitre@gmail.com',N'TPHCM','24/12/1987',12000000),
(N'KH003',N'Đỗ Thị Trúc',0546932178	,N'thitruc@gmail.com',N'TPHCM','30/01/1999',46000000),
(N'KH004',N'Trần Văn Mầm',	0325647891,N'mam@gmail.com',N'TPHCM','1/09/1985',90000000),
(N'KH005',N'Hán Thị Vy	',0985620475,N'thivy@gmail.com',N'	TPHCM','10/04/1975',21000000),
(N'KH006',N'Phan Thị Hoa',	0698547121	,N'thihoa@gmail.com	',N'Tây Ninh','25/07/1989',19000000),
(N'KH007',N'Phạm Văn Dũng',0987456231,N'vandung@gmail.com',N'Tây Ninh','21/02/1976',43000000),
(N'KH008',N'Lê Văn Lẹo',	0546879213,N'leo@gmail.com',N'Đồng Nai','17/05/1991',26000000),
(N'KH009',N'Đỗ Hùng Anh',	0159764398,N'hunganh@gmail.com',N'BRVT','19/08/1989',33000000),
(N'KH010',N'Lê Thị Kiều',0215635897,N'lethikieu@gmail.com',N'TP.HCM','15/03/1996',35000000),
(N'KH011',N'Lê Thị Sen',0213569872,N'lethisen@gmail.com',N'TP.HCM','24/11/1989',10000000),
(N'KH012',N'Nguyễn Phương Thảo',0356489715,N'phuongthao@gmail.com',N'TP.HCM','30/12/1999',32000000),
(N'KH013',N'Vương Đức Đạt',0974586245,N'vuongdat@gmail.com',N'TP.HCM','01/07/2000',80000000),
(N'KH014',N'Phan Phú Phúc',0356214895,N'phuphuc@gmail.com',N'Gia Lai','10/11/1985',15000000),
(N'KH015',N'Lê Hữu Chung',0759846251,N'lhc@gmail.com',N'Gia Lai','17/09/1989',36000000),
(N'KH016',N'Trần Thị Minh Anh',03521684975,N'minhanh@gmail.com',N'Tây Ninh','26/03/1976',20000000),
(N'KH017',N'Nguyễn Văn Đức Anh',02563148975,N'ducanh@gmail.com',N'Đồng Tháp','19/01/1992',16000000),
(N'KH018',N'Đỗ Hùng Dũng',02553698745,N'dungcute@gmail.com',N'Bình Định','12/07/1999',15000000)


SET DATEFORMAT DMY
INSERT INTO HD_Nhap
VALUES
('HD001','NV001','NCC03','30/03/2020',10,270000),
('HD002','NV001','NCC02','12/08/2020',20,900000),
('HD003','NV002','NCC01','24/04/2020',15,775500),
('HD004','NV003','NCC04','05/02/2020',5,458500),
('HD005','NV003','NCC04','05/10/2020',5,458500),
('HD006','NV001','NCC02','05/02/2020',20,540500),
('HD007','NV003','NCC04','05/08/2020',15,775500),
('HD008','NV003','NCC04','12/02/2020',10,450000),
('HD009','NV002','NCC04','05/02/2020',5,259500),
('HD010','NV004','NCC04','23/07/2020',20,550000),
('HD011','NV004','NCC03','30/03/2020',10,5400000),
('HD012','NV001','NCC02','12/08/2020',20,29800000),
('HD013','NV002','NCC01','24/04/2020',15,199087500),
('HD014','NV003','NCC04','05/02/2020',5,1297500),
('HD015','NV003','NCC05','05/10/2020',10,2050000),
('HD016','NV001','NCC02','05/02/2020',10,5405000),
('HD017','NV003','NCC04','05/08/2020',10,7755000),
('HD018','NV003','NCC04','12/02/2020',10,4500000),
('HD019','NV001','NCC05','05/02/2020',10,2595000),
('HD020','NV003','NCC04','23/07/2020',10,4585000),
('HD021','NV002','NCC03','30/03/2020',10,2595000),
('HD022','NV002','NCC05','12/08/2020',10,14710000),
('HD023','NV001','NCC01','24/04/2020',10,4250000),
('HD024','NV001','NCC04','05/02/2020',10,4250000),
('HD025','NV004','NCC04','05/10/2020',10,2700000),
('HD026','NV004','NCC02','05/02/2020',10,10800000),
('HD027','NV003','NCC05','05/08/2020',10,6150000),
('HD028','NV002','NCC04','12/02/2020',10,4100000),
('HD029','NV001','NCC05','05/02/2020',10,2050000),
('HD030','NV001','NCC05','23/07/2020',10,8200000)

SET DATEFORMAT DMY
INSERT INTO CT_HD_Nhap
VALUES
('HD001',N'MH006',10,	27500	,275000),
(N'HD002',N'MH002',10	,45700	,457000),
(N'HD002',N'MH009',10	,45000,	450000),
(N'HD003',N'MH010',10	,41700	,417000),
(N'HD003',N'MH017',5	,77600	,388000),
(N'HD004',N'MH011',5,	91700	,458500),
(N'HD005',N'MH011',5,	91700	,458500),
(N'HD006',N'MH005',20,	23500	,540500),
(N'HD007',N'MH007',15,	51700	,775500),
(N'HD008',N'MH009',10,	45000	,450000),
(N'HD009',N'MH015',5,	51900	,259500),
(N'HD010',N'MH008',20,	27500	,550000),
(N'HD011',N'MH021',10,	54000	,540000),
(N'HD012',N'MH022',10	,149000	,1490000),
(N'HD012',N'MH023',10	,45000,	450000),
(N'HD013',N'MH024',10	,1299000	,12990000),
(N'HD013',N'MH025',5	,56500	,282500),
(N'HD014',N'MH026',5,	51900	,259500),
(N'HD015',N'MH027',5,	41000	,205000),
(N'HD016',N'MH011',20,	23500	,540500),
(N'HD017',N'MH012',15,	51700	,775500),
(N'HD018',N'MH013',10,	45000	,450000),
(N'HD019',N'MH014',5,	51900	,259500),
(N'HD020',N'MH011',5,	91700	,458500),
(N'HD021',N'MH015',5,	51900	,259500),
(N'HD022',N'MH016',10	,69500	,695000),
(N'HD022',N'MH017',10	,77600,	776000),
(N'HD023',N'MH018',10	,45000	,450000),
(N'HD023',N'MH019',5	,85000	,425000),
(N'HD024',N'MH020',5,	85000	,425000),
(N'HD025',N'MH021',5,	54000	,270000),
(N'HD026',N'MH021',20,	54000	,1080000),
(N'HD027',N'MH027',15,	41000	,615000),
(N'HD028',N'MH027',10,	41000	,410000),
(N'HD029',N'MH027',5,	41000	,205000),
(N'HD030',N'MH027',20,	41000	,820000)

SET DATEFORMAT DMY
INSERT INTO HD_Ban
VALUES
('HD001','NV001','KH004','CN001','30/03/2022', 30, 03, 2022,	1,	16500),
('HD002','NV001','KH005','CN002','12/06/2022', 12, 06, 2022,	2	,75000),
('HD003','NV002','KH002','CN001','30/01/2022', 30, 01, 2022,	1	,27500),
('HD004','NV001','KH001','CN003','19/02/2022', 19, 02, 2022, 2,	79000),
('HD005','NV003','KH006','CN002','04/04/2021', 04, 04, 2021,	2	,138000),
('HD006','NV004','KH003','CN003','20/06/2019', 20, 06, 2019, 1,	79000),
('HD007','NV004','KH008','CN002','29/08/2019', 29, 08, 2019,	2,138000),
('HD008','NV004','KH003','CN002','12/06/2019', 12, 03, 2019,	2,138000),
('HD009','NV001','KH003','CN003','15/05/2019', 15, 05, 2019,	1,52700),
('HD010','NV001','KH007','CN002','29/08/2019', 29, 08, 2019,	1,95000),
('HD011','NV003','KH004','CN001','29/08/2019', 29, 08, 2019,	2,57000),
('HD012','NV001','KH018','CN001','30/03/2022', 30, 03, 2022,	1,	54000),
('HD013','NV002','KH014','CN002','12/06/2022', 12, 06, 2022,	2	,298000),
('HD014','NV003','KH015','CN004','19/02/2022', 19, 02, 2022, 2,	2598000),
('HD015','NV004','KH017','CN003','04/04/2021', 04, 04, 2021,	2	,850000),
('HD016','NV004','KH018','CN004','20/06/2019', 20, 06, 2019, 1,	56500),
('HD017','NV001','KH012','CN002','29/08/2019', 29, 08, 2019,	2,103800),
('HD018','NV001','KH011','CN002','12/06/2019', 12, 06, 2019,	2,83400),
('HD019','NV002','KH013','CN004','15/05/2019', 15, 05, 2019,	1,91700),
('HD020','NV001','KH015','CN002','29/08/2019', 29, 08, 2019,	1,51200),
('HD021','NV003','KH017','CN001','29/08/2019', 29, 08, 2019,	2,183400),
('HD022','NV001','KH018','CN001','30/03/2022', 30, 03, 2022,	1,	91700),
('HD023','NV001','KH005','CN002','12/06/2022', 12, 06, 2022,	2	,113000),
('HD024','NV002','KH002','CN004','30/01/2022', 30, 01, 2022,	1	,91700),
('HD025','NV003','KH009','CN001','19/02/2022', 19, 02, 2022,2,	2598000),
('HD026','NV003','KH006','CN002','04/04/2021', 04, 04, 2021,	2	,108000),
('HD027','NV004','KH007','CN003','20/06/2019', 20, 06, 2019,1,	85000),
('HD028','NV001','KH008','CN004','29/08/2019', 29, 08, 2019,	2,298000),
('HD029','NV002','KH003','CN002','12/06/2019', 12, 06, 2019,	2,108000),
('HD030','NV003','KH003','CN003','15/05/2019', 15, 05, 2019,	1,27500)

INSERT INTO CT_HD_Ban
VALUES
(N'HD001',N'MH001',	1,	16500,	16500),
(N'HD002',N'MH006',	1,	27500,	27500),
(N'HD002',N'MH007',	1,	51700,	51700),
(N'HD003',N'MH006',	1,	27500	,27500),
(N'HD004',N'MH005',	1,	51200,	51200),
(N'HD004',N'MH006',	1,	27500,	27500),
(N'HD005',N'MH010',	1,	41700,	41700),
(N'HD005',N'MH011',	1,	91700,	91700),
(N'HD006',N'MH005',	1,	51200,	41700),
(N'HD007',N'MH010',	2,	41700 ,91700),
(N'HD008',N'MH010',	2,	41700 ,91700),
(N'HD009',N'MH007',	1,	51700,51700),
(N'HD010',N'MH011',	1,	91700,91700),
(N'HD011',N'MH006',	2,	27500,55000),
(N'HD012',N'MH021',	1,	54000,	54000),
(N'HD013',N'MH022',	1,	149000,	149000),
(N'HD014',N'MH023',	1,	1299000,	1299000),
(N'HD015',N'MH024',	1,	425000	,425000),
(N'HD016',N'MH025',	1,	56500,	56500),
(N'HD017',N'MH026',	1,	51900,	51900),
(N'HD018',N'MH010',	1,	41700,	41700),
(N'HD019',N'MH011',	1,	91700,	91700),
(N'HD020',N'MH027',	1,	51200,	51200),
(N'HD021',N'MH010',	2,	41700 ,91700),
(N'HD022',N'MH010',	2,	41700 ,91700),
(N'HD023',N'MH025',	1,	56500,56500),
(N'HD024',N'MH011',	1,	91700,91700),
(N'HD025',N'MH023',	1,	1299000,	1299000),
(N'HD026',N'MH021',	1,	54000,	54000),
(N'HD027',N'MH020',	1,	85000,	85000),
(N'HD028',N'MH022',	1,	149000	,149000),
(N'HD029',N'MH021',	1,	54000,	54000),
(N'HD030',N'MH027',	1,	27500,	27500)
