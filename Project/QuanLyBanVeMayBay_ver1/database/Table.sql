﻿create database QuanLyBanVeMayBay
use QuanlyBanVeMayBay
set dateformat dmy

create table SanBay
(
	MaSB varchar(10) primary key not null,
	TenSB nvarchar(20),
)


create table HangMayBay
(
	MaHMB varchar(10) primary key not null,
	TenHMB nvarchar(20)
)


create table ChuyenBay
(
	MaCB varchar(10) primary key not null,
	MaHMB varchar(10) foreign key references HangMayBay(MaHMB),
	DiemKhoiHanh nvarchar(50),		-- Địa điểm khởi hành
	DiemDen nvarchar(50),			-- Địa điểm đến
	SanBayDi	varchar(10),		-- Lấy mã sân bay
	SanBayDen	varchar(10),		-- Lấy mã sân bay
	SoGheVipTrong int,				-- Số ghế Vip còn trống
	SoGheThuongTrong int,			-- Số ghế thường còn trống
	NgayKhoiHanh smalldatetime,		-- Ngày khởi hành
	ThoiGianBay int,				-- Thời gian bay khoảng bao lâu
	GioKhoiHanh time,				-- Thời gian khởi hành
	GiaVe money,					-- Giá vé gốc loại thường
	constraint FK_Di foreign key(SanBayDi)  references SanBay(MaSB),
	constraint FK_Den foreign key(SanBayDen)  references SanBay(MaSB),
)


create table Ve
(
	MaVe varchar(10) primary key not null,
	MaCB varchar(10) foreign key references ChuyenBay(MaCB),
	LoaiVe bit, -- 1 là VIP, 0 là thường
	TinhTrang bit, -- 1 là còn, 0 là đã được mua
)

create table ChiTietChuyenBay
(
	MaVe varchar(10) foreign key references Ve(MaVe),
	MaCB varchar(10) foreign key references ChuyenBay(MaCB),
	TenHK nvarchar(50),
	CMND varchar(12),
	SDT varchar(11),
	Email varchar(30),
	LoaiKH bit,			-- 0 là trẻ em, 1 là người lớn
	Gia money,			-- Giá vé vip hay thường, có thêm hành lý hay không, lấy giá gốc từ table ChuyenBay
	constraint PK_MaVe primary key(MaVe)
)


create table DangNhap
(
	email varchar(50) primary key not null, -- id
	pass varchar(20),						-- pass
	level int								-- cấp độ quyền sử dụng
)