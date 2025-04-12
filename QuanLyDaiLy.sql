CREATE DATABASE QUANLYDAILY

USE QUANLYDAILY

/*	QUY ƯỚC

Cách đặt tên Khoá ngoại: FK_TenKhoaNgoai_TênBảngĐangChứaKhoáNgoại

*/


CREATE TABLE LOAIDAILY  
(
MaLoaiDaiLy INT IDENTITY(1,1) PRIMARY KEY,
TenLoaiDaiLy NVARCHAR(50),
TienNoToiDa MONEY
)

-----------------------------------------------------------------------------

CREATE TABLE QUAN  
(
MaQuan INT IDENTITY(1,1) PRIMARY KEY,
TenQuan NVARCHAR(30)
)

-----------------------------------------------------------------------------

CREATE TABLE DAILY
(
MaDaiLy INT IDENTITY(1,1) PRIMARY KEY,
TenDaiLy NVARCHAR(30),
MaLoaiDaiLy INT,
SDT VARCHAR(12),
Email VARCHAR(50),
DiaChi NVARCHAR(60),
MaQuan INT,
NgayTiepNhan DATE,
TongNo MONEY
)

ALTER TABLE DAILY
ADD CONSTRAINT FK_MaLoaiDaiLy_DAILY FOREIGN KEY (MaLoaiDaiLy) REFERENCES LOAIDAILY (MaLoaiDaiLy)

ALTER TABLE DAILY
ADD CONSTRAINT FK_MaQuan_DAILY FOREIGN KEY (MaQuan) REFERENCES QUAN (MaQuan)

-----------------------------------------------------------------------------

CREATE TABLE DONVITINH 
(
MaDonViTinh INT IDENTITY(1,1) PRIMARY KEY,
TenDonViTinh VARCHAR(6)
)

-----------------------------------------------------------------------------

CREATE TABLE MATHANG 
(
MaMatHang INT IDENTITY(1,1) PRIMARY KEY,
TenMatHang NVARCHAR(30),
MaDonViTinh INT,
DonGiaHienTai MONEY,
TonKho INT
)

ALTER TABLE MATHANG
ADD CONSTRAINT FK_MaDonViTinh_MATHANG FOREIGN KEY (MaDonViTinh) REFERENCES DONVITINH (MaDonViTinh)

-----------------------------------------------------------------------------

CREATE TABLE PHIEUNHAP  
(
MaPhieuNhap INT IDENTITY(1,1) PRIMARY KEY,
NgayLapPhieu DATE,
TongTien MONEY
)

CREATE TABLE CHITIET_PHIEUNHAP  
(
MaPhieuNhap INT,
MaMatHang INT,
SoLuongNhap INT,
DonGiaNhap MONEY,
ThanhTien MONEY

CONSTRAINT PK1 PRIMARY KEY (MaPhieuNhap, MaMatHang)
)

ALTER TABLE CHITIET_PHIEUNHAP 
ADD CONSTRAINT FK_MaPhieuNhap_CHITIET_PHIEUNHAP FOREIGN KEY (MaPhieuNhap) REFERENCES PHIEUNHAP (MaPhieuNhap)

ALTER TABLE CHITIET_PHIEUNHAP 
ADD CONSTRAINT FK_MaMatHang_CHITIET_PHIEUNHAP FOREIGN KEY (MaMatHang) REFERENCES MATHANG (MaMatHang)

-----------------------------------------------------------------------------

CREATE TABLE PHIEUXUAT 
(
MaPhieuXuat INT  IDENTITY(1,1) PRIMARY KEY,
MaDaiLy INT,
NgayLapPhieu DATE,
TongTien MONEY,
TienTra MONEY,
ConLai MONEY
)

ALTER TABLE PHIEUXUAT 
ADD CONSTRAINT FK_MaDaiLy_PHIEUXUAT FOREIGN KEY (MaDaiLy) REFERENCES DAILY (MaDaiLy)

CREATE TABLE CHITIET_PHIEUXUAT 
(
MaPhieuXuat INT,
MaMatHang INT,
SoLuongXuat INT,
DonGiaXuat MONEY,
ThanhTien MONEY

CONSTRAINT FK2 PRIMARY KEY (MaPhieuXuat, MaMatHang)
)

ALTER TABLE CHITIET_PHIEUXUAT
ADD CONSTRAINT FK_MaPhieuXuat_CHITIET_PHIEUXUAT FOREIGN KEY (MaPhieuXuat) REFERENCES PHIEUXUAT (MaPhieuXuat)

ALTER TABLE CHITIET_PHIEUXUAT
ADD CONSTRAINT FK_MaMatHang_CHITIET_PHIEUXUAT FOREIGN KEY (MaMatHang) REFERENCES MATHANG (MaMatHang)

-----------------------------------------------------------------------------

CREATE TABLE PHIEUTHU 
(
MaPhieuThu INT IDENTITY(1,1) PRIMARY KEY,
MaDaiLy INT,
NgayThuTien DATE,
SoTienThu MONEY
)

ALTER TABLE PHIEUTHU
ADD CONSTRAINT FK_MaDaiLy_PHIEUTHU FOREIGN KEY (MaDaiLy) REFERENCES DAILY (MaDaiLy)

-----------------------------------------------------------------------------

CREATE TABLE THAMSO 
(
TenThamSo NVARCHAR(30),
GiaTri INT
)

-----------------------BÁO CÁO-----------------------------------------------

CREATE TABLE BAOCAO_DOANHSO 
(
MaBaoCaoDoanhSo INT IDENTITY(1,1) PRIMARY KEY,
Thang TINYINT,
Nam INT,
TongDoanhSo MONEY
)

CREATE TABLE CHITIET_BAOCAODOANHSO 
(
MaBaoCaoDoanhSo INT,
MaDaiLy INT,
SoLuongPhieuXuat INT,
TongTriGia MONEY,
TiLe FLOAT

CONSTRAINT PK3 PRIMARY KEY (MaBaoCaoDoanhSo, MaDaiLy)
)

ALTER TABLE CHITIET_BAOCAODOANHSO
ADD CONSTRAINT FK_MaBaoCaoDoanhSo_CHITIET_BAOCAODOANHSO FOREIGN KEY (MaBaoCaoDoanhSo) REFERENCES BAOCAO_DOANHSO (MaBaoCaoDoanhSo)

ALTER TABLE CHITIET_BAOCAODOANHSO
ADD CONSTRAINT FK_MaDaiLy_CHITIET_BAOCAODOANHSO FOREIGN KEY (MaDaiLy) REFERENCES DAILY (MaDaiLy)

-----------------------------------------------------------------------------

CREATE TABLE BAOCAO_CONGNO
( 
Thang TINYINT,
Nam INT,
MaDaiLy INT,
NoDau MONEY,
PhatSinh MONEY,
NoCuoi MONEY

CONSTRAINT PK4 PRIMARY KEY (Thang, Nam, MaDaiLy)
)

ALTER TABLE BAOCAO_CONGNO  
ADD CONSTRAINT FK_MaDaiLy_BAOCAO_CONGNO FOREIGN KEY (MaDaiLy) REFERENCES DAILY (MaDaiLy)


GO
INSERT INTO DAILY 
-- Insert into LOAIDAILY
INSERT INTO LOAIDAILY (TenLoaiDaiLy, TienNoToiDa)
VALUES 
(N'Đại lý cấp 1', 5000000),
(N'Đại lý cấp 2', 3000000);

-- Insert into QUAN
INSERT INTO QUAN (TenQuan)
VALUES 
(N'Quận 1'),
(N'Quận 3');

-- Insert into DONVITINH
INSERT INTO DONVITINH (TenDonViTinh)
VALUES 
('Chai'),
('Thùng');

-- Insert into MATHANG
INSERT INTO MATHANG (TenMatHang, MaDonViTinh, DonGiaHienTai, TonKho)
VALUES 
(N'Nước ngọt', 1, 10000, 200),
(N'Bia', 2, 15000, 300);

-- Insert into DAILY
INSERT INTO DAILY (TenDaiLy, MaLoaiDaiLy, SDT, Email, DiaChi, MaQuan, NgayTiepNhan, TongNo)
VALUES 
(N'Đại lý Minh', 1, '0123456789', 'minh@example.com', N'123 Lê Lợi', 1, '2024-01-01', 0),
(N'Đại lý Hoa', 2, '0987654321', 'hoa@example.com', N'456 Trần Hưng Đạo', 2, '2024-01-10', 500000);

-- Insert into PHIEUNHAP
INSERT INTO PHIEUNHAP (NgayLapPhieu, TongTien)
VALUES 
('2024-02-01', 500000);

-- Insert into CHITIET_PHIEUNHAP
INSERT INTO CHITIET_PHIEUNHAP (MaPhieuNhap, MaMatHang, SoLuongNhap, DonGiaNhap, ThanhTien)
VALUES 
(1, 1, 100, 10000, 100000),
(1, 2, 200, 20000, 400000);

-- Insert into PHIEUXUAT
INSERT INTO PHIEUXUAT (MaDaiLy, NgayLapPhieu, TongTien, TienTra, ConLai)
VALUES 
(1, '2024-02-02', 150000, 100000, 50000);

-- Insert into CHITIET_PHIEUXUAT
INSERT INTO CHITIET_PHIEUXUAT (MaPhieuXuat, MaMatHang, SoLuongXuat, DonGiaXuat, ThanhTien)
VALUES 
(1, 1, 5, 10000, 50000),
(1, 2, 5, 20000, 100000);

-- Insert into PHIEUTHU
INSERT INTO PHIEUTHU (MaDaiLy, NgayThuTien, SoTienThu)
VALUES 
(1, '2024-02-03', 100000);

-- Insert into THAMSO
INSERT INTO THAMSO (TenThamSo, GiaTri)
VALUES 
(N'SoĐaiLyToiDa', 100),
(N'TiLeTienNoToiDa', 20);

-- Insert into BAOCAO_DOANHSO
INSERT INTO BAOCAO_DOANHSO (Thang, Nam, TongDoanhSo)
VALUES 
(2, 2024, 150000);

-- Insert into CHITIET_BAOCAODOANHSO
INSERT INTO CHITIET_BAOCAODOANHSO (MaBaoCaoDoanhSo, MaDaiLy, SoLuongPhieuXuat, TongTriGia, TiLe)
VALUES 
(1, 1, 1, 150000, 100.0);

-- Insert into BAOCAO_CONGNO
INSERT INTO BAOCAO_CONGNO (Thang, Nam, MaDaiLy, NoDau, PhatSinh, NoCuoi)
VALUES 
(2, 2024, 1, 0, 150000, 50000);