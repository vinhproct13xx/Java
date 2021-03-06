USE [QuanLyBanVeMayBay]
GO
/****** Object:  StoredProcedure [dbo].[addChuyenBay]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[addChuyenBay](@maHMB varchar(10),@diemKH nvarchar(50),@diemDen nvarchar(50),@sbDi varchar(10),@sbDen varchar(10),@ngayKH date,@tgBay int,@gioKH time,@giaVe money)
as
begin
	declare @macb varchar(10)
	declare @id int
	declare @tempt varchar(5)
	if ((select count(MaCB) from ChuyenBay where LEFT(MaCB,2)=@maHMB)=0)
		set @tempt='001'
	else begin
			select @id=(select max(right(MaCB,3)) from ChuyenBay where left(MaCB,2)=@maHMB)
			if(@id>0 or @id<9)
			set @tempt=CONCAT('00',(@id+1))
			else if(@id>=9)
			set @tempt=CONCAT('0',(@id+1))
	end
	set @macb=CONCAT(@maHMB,@tempt)
	insert into ChuyenBay values(@macb,@maHMB,@diemKH,@diemDen,@sbDi,@sbDen,10,40,@ngayKH,@tgBay,@gioKH,@giaVe)
	insert into Ve values (CONCAT(@macb,'01'),@macb,1,0,'1A')
	insert into Ve values (CONCAT(@macb,'02'),@macb,1,0,'1B')
	insert into Ve values (CONCAT(@macb,'03'),@macb,1,0,'1C')
	insert into Ve values (CONCAT(@macb,'04'),@macb,1,0,'1D')
	insert into Ve values (CONCAT(@macb,'05'),@macb,1,0,'1E')
	insert into Ve values (CONCAT(@macb,'06'),@macb,1,0,'2A')
	insert into Ve values (CONCAT(@macb,'07'),@macb,1,0,'2B')
	insert into Ve values (CONCAT(@macb,'08'),@macb,1,0,'2C')
	insert into Ve values (CONCAT(@macb,'09'),@macb,1,0,'2D')
	insert into Ve values (CONCAT(@macb,'10'),@macb,1,0,'2E')
	insert into Ve values (CONCAT(@macb,'11'),@macb,0,0,'3A')
	insert into Ve values (CONCAT(@macb,'12'),@macb,0,0,'3B')
	insert into Ve values (CONCAT(@macb,'13'),@macb,0,0,'3C')
	insert into Ve values (CONCAT(@macb,'14'),@macb,0,0,'3D')
	insert into Ve values (CONCAT(@macb,'15'),@macb,0,0,'3E')
	insert into Ve values (CONCAT(@macb,'16'),@macb,0,0,'4A')
	insert into Ve values (CONCAT(@macb,'17'),@macb,0,0,'4B')
	insert into Ve values (CONCAT(@macb,'18'),@macb,0,0,'4C')
	insert into Ve values (CONCAT(@macb,'19'),@macb,0,0,'4D')
	insert into Ve values (CONCAT(@macb,'20'),@macb,0,0,'4E')
	insert into Ve values (CONCAT(@macb,'21'),@macb,0,0,'5A')
	insert into Ve values (CONCAT(@macb,'22'),@macb,0,0,'5B')
	insert into Ve values (CONCAT(@macb,'23'),@macb,0,0,'5C')
	insert into Ve values (CONCAT(@macb,'24'),@macb,0,0,'5D')
	insert into Ve values (CONCAT(@macb,'25'),@macb,0,0,'5E')
	insert into Ve values (CONCAT(@macb,'26'),@macb,0,0,'6A')
	insert into Ve values (CONCAT(@macb,'27'),@macb,0,0,'6B')
	insert into Ve values (CONCAT(@macb,'28'),@macb,0,0,'6C')
	insert into Ve values (CONCAT(@macb,'29'),@macb,0,0,'6D')
	insert into Ve values (CONCAT(@macb,'30'),@macb,0,0,'6E')
	insert into Ve values (CONCAT(@macb,'31'),@macb,0,0,'7A')
	insert into Ve values (CONCAT(@macb,'32'),@macb,0,0,'7B')
	insert into Ve values (CONCAT(@macb,'33'),@macb,0,0,'7C')
	insert into Ve values (CONCAT(@macb,'34'),@macb,0,0,'7D')
	insert into Ve values (CONCAT(@macb,'35'),@macb,0,0,'7E')
	insert into Ve values (CONCAT(@macb,'36'),@macb,0,0,'8A')
	insert into Ve values (CONCAT(@macb,'37'),@macb,0,0,'8B')
	insert into Ve values (CONCAT(@macb,'38'),@macb,0,0,'8C')
	insert into Ve values (CONCAT(@macb,'39'),@macb,0,0,'8D')
	insert into Ve values (CONCAT(@macb,'40'),@macb,0,0,'8E')
	insert into Ve values (CONCAT(@macb,'41'),@macb,0,0,'9A')
	insert into Ve values (CONCAT(@macb,'42'),@macb,0,0,'9B')
	insert into Ve values (CONCAT(@macb,'43'),@macb,0,0,'9C')
	insert into Ve values (CONCAT(@macb,'44'),@macb,0,0,'9D')
	insert into Ve values (CONCAT(@macb,'45'),@macb,0,0,'9E')
	insert into Ve values (CONCAT(@macb,'46'),@macb,0,0,'10A')
	insert into Ve values (CONCAT(@macb,'47'),@macb,0,0,'10B')
	insert into Ve values (CONCAT(@macb,'48'),@macb,0,0,'10C')
	insert into Ve values (CONCAT(@macb,'49'),@macb,0,0,'10D')
	insert into Ve values (CONCAT(@macb,'50'),@macb,0,0,'10E')
end
GO
/****** Object:  StoredProcedure [dbo].[chartDoanhThu]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[chartDoanhThu](@nam int, @thang int)
as
begin
	select sum(Gia) as DoanhThu
	from ChiTietChuyenBay,ChuyenBay
	where ChiTietChuyenBay.MaCB=ChuyenBay.MaCB and year(ChuyenBay.NgayKhoiHanh)=@nam and month(ChuyenBay.NgayKhoiHanh)=@thang
end
GO
/****** Object:  StoredProcedure [dbo].[chartTongCB]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[chartTongCB](@nam int, @thang int)
as
begin
	select count(MaCB) as TongCB
	from ChuyenBay
	where year(NgayKhoiHanh)=@nam and month(NgayKhoiHanh)=@thang
end
GO
/****** Object:  StoredProcedure [dbo].[chartTongHK]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[chartTongHK](@nam int,@thang int)
as
begin
	select count(MaVe) as TongHK
	from ChiTietChuyenBay,ChuyenBay
	where ChuyenBay.MaCB=ChiTietChuyenBay.MaCB and year(NgayKhoiHanh)=@nam and month(NgayKhoiHanh)=@thang
end
GO
/****** Object:  StoredProcedure [dbo].[chartTongHKTB]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[chartTongHKTB](@nam int,@thang int)
as
begin
	declare @tb float
	declare @tong float
	declare @count float
	set @count=(select count(distinct(ChiTietChuyenBay.MaCB)) as TongCB
	from ChuyenBay,ChiTietChuyenBay
	where year(NgayKhoiHanh)=@nam and month(NgayKhoiHanh)=@thang and ChiTietChuyenBay.MaCB=ChuyenBay.MaCB)
	if(@count =0) set @count=1
	set @tong=(select count(MaVe) as TongHKTB
	from ChiTietChuyenBay,ChuyenBay
	where year(NgayKhoiHanh)=@nam and month(NgayKhoiHanh)=@thang and ChiTietChuyenBay.MaCB=ChuyenBay.MaCB)
	set @tb=@tong/@count
	select round(@tb,0) as TongHKTB
end
GO
/****** Object:  StoredProcedure [dbo].[danhsachchuyenbay]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[danhsachchuyenbay]
    @diemkh nVARCHAR(50) OUT,
    @diemden nVARCHAR(50) OUT,
    @sove int,
    @loaive int,--1 vip,0 thuong
    @ngaykh DATE
AS
BEGIN
  
    if(@loaive = 1 )
        BEGIN
            SELECT  cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
            from ChuyenBay cb,Ve v, HangMayBay hmb
            where cb.MaHMB = hmb.MaHMB AND  cb.MaCB = v.MaCB and cb.DiemKhoiHanh = @diemkh and cb.DiemDen = @diemden  and NgayKhoiHanh = @ngaykh 
            and v.TinhTrang = 0 and cb.SoGheVipTrong >= @sove and @loaive = v.LoaiVe
            GROUP by cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
        END
    else 
        BEGIN
            SELECT  cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
            from ChuyenBay cb,Ve v, HangMayBay hmb
            where cb.MaHMB = hmb.MaHMB AND  cb.MaCB = v.MaCB and DiemKhoiHanh = @diemkh and cb.DiemDen = @diemden  and NgayKhoiHanh = @ngaykh 
            and v.TinhTrang = 0 and cb.SoGheThuongTrong >= @sove and @loaive = v.LoaiVe
            GROUP by cb.MaCB, cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
        END
END;
             
exec danhsachchuyenbay 'Ha Noi','Ha Noi',1,1,'2019-06-1'

GO
/****** Object:  StoredProcedure [dbo].[danhsachchuyenbaykh]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[danhsachchuyenbaykh]
    @diemkh nVARCHAR(50) OUT,
    @diemden nVARCHAR(50) OUT,
     @hangmb nVARCHAR(50) out,
    @sove int,
    @loaive int,--1 vip,0 thuong
    @ngaykh DATE
AS
BEGIN
    if(@loaive = 1 )
        BEGIN
            SELECT  cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
            from ChuyenBay cb,Ve v, HangMayBay hmb
            where   cb.MaHMB = hmb.MaHMB AND  cb.MaCB = v.MaCB 
                and DiemKhoiHanh = @diemkh and NgayKhoiHanh = @ngaykh 
                and cb.DiemDen = @diemden 
                and cb.SoGheVipTrong >= @sove and @loaive = v.LoaiVe and hmb.TenHMB = @hangmb
                and v.TinhTrang = 0
            GROUP by cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
        END
    else 
        BEGIN
            SELECT  cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
            from ChuyenBay cb,Ve v, HangMayBay hmb
            where   cb.MaHMB = hmb.MaHMB AND  cb.MaCB = v.MaCB 
                and DiemKhoiHanh = @diemkh and NgayKhoiHanh = @ngaykh 
                and cb.DiemDen = @diemden 
                and cb.SoGheThuongTrong >= @sove and @loaive = v.LoaiVe and hmb.TenHMB = @hangmb
                and v.TinhTrang = 0
            GROUP by cb.MaCB,cb.GioKhoiHanh,cb.ThoiGianBay,cb.GiaVe,hmb.TenHMB
        END
END;

-- exec danhsachchuyenbaykh 'ha noi','ha noi','VietnamAirLine',1,1,'2019-05-27';
        
GO
/****** Object:  StoredProcedure [dbo].[insertVe]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertVe]
    @macb VARCHAR(50),
    @soveNL INT,
	@soveTE INT,
    @loaive INT,
    @tenhk nVARCHAR(50),
	@cmnd varchar(12),
	@sdt varchar(11),
	@email varchar(30),
	@hanhly	int,
	@giaNL money,
	@giaTE money
AS
BEGIN
    CREATE TABLE #table_temp (
    mave nVARCHAR(50),
    macb nVARCHAR(50),
    id int IDENTITY(1, 1)
    );
    DECLARE @dem int = 1;
	declare @demte int=1;
    DECLARE @mave VARCHAR(50);

    insert into #table_temp
    select MaVe,MaCB
    from Ve
    WHERE @macb = MaCB and TinhTrang = 0 and LoaiVe = @loaive

    WHILE @dem <= @soveNL
        BEGIN
            set @mave = (select mave from #table_temp where @dem = id)
            INSERT into ChiTietChuyenBay(MaVe,MaCB,TenHK,LoaiHK,Gia,CMND,SDT,Email,HanhLy) VALUES(@mave, @macb,@tenhk,1,@giaNL,@cmnd,@sdt,@email,@hanhly)
            SET @dem = @dem + 1
            print 'day la ma ve'+ @mave
        END
	set	@dem=@dem-1
	WHILE @demte <= @soveTE
        BEGIN
            set @mave = (select mave from #table_temp where (@demte+@dem) = id)
            INSERT into ChiTietChuyenBay(MaVe,MaCB,TenHK,LoaiHK,Gia,CMND,SDT,Email,HanhLy) VALUES(@mave, @macb,@tenhk,0,@giaTE,@cmnd,@sdt,@email,@hanhly)
            SET @demte = @demte + 1
            print 'day la ma ve'+ @mave
        END
    -- DROP TABLE ##table_temp;
end;
GO
/****** Object:  StoredProcedure [dbo].[xoaCB]    Script Date: 26/06/2019 11:22:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[xoaCB] (@maCB varchar(10))
as
begin
	delete from ChiTietChuyenBay where MaCB=@maCB
	delete from Ve where MaCB=@maCB
	delete from ChuyenBay where MaCB=@maCB
end
GO
