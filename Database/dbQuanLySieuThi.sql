﻿CREATE DATABASE SieuThi
GO
USE SieuThi
GO
CREATE TABLE [dbo].SanPham
(
	[maSanPham] INT IDENTITY(1,1) PRIMARY KEY, 
	[maNhaCungCap] INT NOT NULL,
	[maDanhMucSanPham] INT NOT NULL,
	[tenSanPham] NVARCHAR(50) NOT NULL DEFAULT N'CHƯA ĐẶT TÊN',
	[moTa] NVARCHAR(50) NULL,
	[donGia] DECIMAL(18,2) NOT NULL, 
	[tonKho] FLOAT NOT NULL DEFAULT 0,
	[trangThai] NVARCHAR(50) NULL, 
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(), 
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].NhaCungCap
(
	[maNhaCungCap] INT IDENTITY(1,1) PRIMARY KEY,
	[tenNhaCungCap] NVARCHAR(50), 
	[moTa] NVARCHAR(200), 
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(), 
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(), 
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(), 
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].DanhMucSanPham
(
	[maDanhMucSanPham] INT IDENTITY(1,1) PRIMARY KEY,
	[tenDanhMucSanPham] NVARCHAR(50) NOT NULL DEFAULT N'CHƯA ĐẶT TÊN',
	[phanLoai] NVARCHAR(50) NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].LoaiKhachHang
(
	[maLoaiKhachHang] INT IDENTITY(1,1) PRIMARY KEY, 
	[tenLoaiKhachHang] NVARCHAR(50) NOT NULL DEFAULT N'CHƯA ĐẶT TÊN',
	[moTa] NVARCHAR(200) NULL DEFAULT N'CHƯA CÓ MÔ TẢ',
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].QuanAo
(
	[maQuanAo] INT IDENTITY(1,1) PRIMARY KEY,
	[maSanPham] INT NOT NULL,
	[nhanHieu] NVARCHAR(50) NOT NULL DEFAULT N'NHÃN HIỆU CHƯA ĐẶT TÊN', 
	[kichThuoc] NVARCHAR(30) NOT NULL DEFAULT N'CHƯA CÓ THÔNG TIN KÍCH THƯỚC',
	[mauSac] NVARCHAR(20) NOT NULL DEFAULT N'CHƯA CÓ MÀU SẮC',
	[gioiTinh] NVARCHAR(5) NOT NULL DEFAULT 'NAM', 
	[chatLieu] NVARCHAR(20) NOT NULL DEFAULT N'CHƯA CÓ THÔNG TIN CHẤT LIỆU'
)
GO
CREATE TABLE [dbo].GiayDep
(
	[maGiayDep] INT IDENTITY(1,1) PRIMARY KEY,
	[maSanpham] INT NOT NULL,
	[gioiTinh] NVARCHAR(5) NOT NULL DEFAULT 'NAM', 
	[kichThuoc] FLOAT NOT NULL,
	[chatLieu] NVARCHAR(20) NOT NULL DEFAULT N'CHƯA CÓ THÔNG TIN CHẤT LIỆU',
	[nhanHieu] NVARCHAR(50) NOT NULL DEFAULT N'NHÃN HIỆU CHƯA ĐẶT TÊN'
)
GO
CREATE TABLE [dbo].DoGiaDung
(
	[maDoGiaDung] INT IDENTITY(1,1) PRIMARY KEY,
	[maSanPham] INT NOT NULL,
	[chatLieu] NVARCHAR(20) NOT NULL DEFAULT N'CHƯA CÓ THÔNG TIN CHẤT LIỆU',
	[nhanHieu] NVARCHAR(50) NOT NULL DEFAULT N'NHÃN HIỆU CHƯA ĐẶT TÊN'
)
GO
CREATE TABLE [dbo].Thit
(
	[maThit] INT IDENTITY(1,1) PRIMARY KEY,
	[maSanPham] INT NOT NULL,
	[ngaySanXuat] DATE NOT NULL,
	[hanSuDung] DATE NOT NULL
)
GO
CREATE TABLE [dbo].RauCu
(
	[maRauCu] INT IDENTITY(1,1) PRIMARY KEY,
	[maSanPham] INT NOT NULL,
	[ngaySanXuat] DATE NOT NULL,
	[hanSuDung] DATE NOT NULL
)
GO
CREATE TABLE [dbo].PhieuNhap
(
	[maPhieuNhap] INT IDENTITY(1,1) PRIMARY KEY,
	[maNhaCungCap] INT NOT NULL,
	[ngayNhap] DATE NOT NULL,
	[tongTien] DECIMAL(18,2) NOT NULL,
	[ghiChu] NVARCHAR(50) NULL
)
GO
CREATE TABLE [dbo].ChiTietPhieuNhap
(
	[maChiTietPhieuNhap] INT IDENTITY(1,1) PRIMARY KEY,
	[maPhieuNhap] INT NOT NULL,
	[maSanPham] INT NOT NULL,
	[soLuong] FLOAT NOT NULL,
	[donGia] DECIMAL(18,2) NOT NULL,
	[thanhTien] DECIMAL(18,2) NOT NULL
)
GO
CREATE TABLE [dbo].HoaDon
(
	[maHoaDon] INT IDENTITY(1,1) PRIMARY KEY,
	[maKhachHang] INT NOT NULL,
	[maNhanVien] INT NOT NULL, 
	[ngayTao] DATE NOT NULL,
	[tongTien] DECIMAL 
)
GO
CREATE TABLE [dbo].ChiTietHoaDon
(
	[maChiTietHoaDon] INT IDENTITY(1,1) PRIMARY KEY,
	[maHoaDon] INT NOT NULL,
	[maSanPham] INT NOT NULL,
	[soLuong] FLOAT NOT NULL,
	[donGia] DECIMAL(18,2) NOT NULL,
	[thanhTien] DECIMAL(18,2) NOT NULL
)
GO
CREATE TABLE [dbo].ConNguoi
(
	[maNguoi] INT IDENTITY(1,1) PRIMARY KEY,
	[maTaiKhoan] INT NOT NULL,
	[ho] NVARCHAR(50) NOT NULL DEFAULT N'CHƯA CÓ HỌ',
	[ten] NVARCHAR(50) NOT NULL DEFAULT N'CHƯA CÓ TÊN',
	[soDienThoai] VARCHAR(20) NOT NULL,
	[email] VARCHAR(50) NOT NULL,
	[gioiTinh] NVARCHAR(5) NOT NULL DEFAULT N'NAM',
	[diaChi] NVARCHAR(200) NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].NhanVien
(
	[maNhanVien] INT IDENTITY(1,1) PRIMARY KEY,
	[maNguoi] INT NOT NULL,
	[maQuyen]INT NOT NULL,
	[maThuong] INT NOT NULL,
	[maPhat] INT NOT NULL,
	[maLuong] INT NOT NULL,
	[chucVu] NVARCHAR(20) NOT NULL DEFAULT N'NHÂN VIÊN MỚI',
	[ngayVaoLam] DATE NOT NULL,
	[ghiChu] NVARCHAR(200) NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].KhachHang
(
	[maKhachHang] INT IDENTITY(1,1) PRIMARY KEY,
	[maNguoi] INT NOT NULL,
	[maLoaiKhachHang] INT NOT NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].Account
(
	[maTaiKhoan] INT IDENTITY(1,1) PRIMARY KEY,
	[tenTaiKhoan] VARCHAR(50) NOT NULL,
	[matKhau] VARCHAR(50) NOT NULL,
	[trangThai] NVARCHAR(50) NOT NULL DEFAULT N'TÀI KHOẢN HOẠT ĐỘNG',
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].PhanQuyen
(
	[maQuyen] INT IDENTITY(1,1) PRIMARY KEY,
	[tenQuyen] NVARCHAR(50) NOT NULL,
	[moTa] NVARCHAR(200) NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].Thuong
(
	[maThuong] INT IDENTITY(1,1) PRIMARY KEY,
	[tenThuong] NVARCHAR(50) NOT NULL,
	[giaTriThuong] DECIMAL(18,2) NOT NULL,
	[moTa] NVARCHAR(100) NULL DEFAULT N'CHƯA CÓ THÔNG TIN MÔ TẢ',
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].Phat
(
	[maPhat] INT IDENTITY(1,1) PRIMARY KEY,
	[tenPhat] NVARCHAR(50) NOT NULL,
	[giaTriPhat] DECIMAL(18,2) NOT NULL,
	[moTa] NVARCHAR(100) NULL DEFAULT N'CHƯA CÓ THÔNG TIN MÔ TẢ',
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].ChamCong
(
	[maChamCong] INT IDENTITY(1,1),
	[maNhanVien] INT NOT NULL,
	[ngayChamCong] DATE NOT NULL,
	[caLam] NVARCHAR(10) NOT NULL,
	[gioVao] TIME NOT NULL,
	[gioRa] TIME NOT NULL,
	[tongSoGio] DECIMAL(18,2) NOT NULL
)
GO
CREATE TABLE [dbo].PhuCap 
(
	[maPhuCap] INT IDENTITY(1,1) PRIMARY KEY,
	[maNguoi] INT NOT NULL,
	[loaiPhuCap] NVARCHAR(50) NOT NULL,
	[tongTien] DECIMAL(18,2) NOT NULL,
	[isDelete] BIT DEFAULT 0,
	[deleteAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[deleteBy] INT NULL,
	[createAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[createBy] INT NULL,
	[updateAt] DATETIME2 DEFAULT SYSDATETIME(),  
	[updateBy] INT NULL
)
GO
CREATE TABLE [dbo].Luong
(
	[maLuong] INT IDENTITY(1,1) PRIMARY KEY,
	[moTa] NVARCHAR(100) NULL DEFAULT N'CHƯA CÓ THÔNG TIN MÔ TẢ',
	[maChamCong] INT NOT NULL,
	[maPhuCap] INT NOT NULL,
	[maThuong] INT NOT NULL,
	[maPhat] INT NOT NULL
)
GO
ALTER TABLE [dbo].NhaCungCap
ADD CONSTRAINT FK_NHACUNGCAP_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhaCungCap
ADD CONSTRAINT FK_NHACUNGCAP_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhaCungCap
ADD CONSTRAINT FK_NHACUNGCAP_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].DanhMucSanPham
ADD CONSTRAINT FK_DANHMUCSANPHAM_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].DanhMucSanPham
ADD CONSTRAINT FK_DANHMUCSANPHAM_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].DanhMucSanPham
ADD CONSTRAINT FK_DANHMUCSANPHAM_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].LoaiKhachHang
ADD CONSTRAINT FK_LOAIKHACHHANG_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].LoaiKhachHang
ADD CONSTRAINT FK_LOAIKHACHHANG_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].LoaiKhachHang
ADD CONSTRAINT FK_LOAIKHACHHAHNG_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].QuanAo
ADD CONSTRAINT FK_QUANAO_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].GiayDep
ADD CONSTRAINT FK_GIAYDEP_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].DoGiaDung
ADD CONSTRAINT FK_DOGIADUNG_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].Thit
ADD CONSTRAINT FK_THIT_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].RauCu
ADD CONSTRAINT FK_RAUCU_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].PhieuNhap
ADD CONSTRAINT FK_PHIEUNHAP_NHACUNGCAP FOREIGN KEY ([maNhaCungCap]) REFERENCES [dbo].NhaCungCap([maNhaCungCap])
GO
ALTER TABLE [dbo].ChiTietPhieuNhap
ADD CONSTRAINT FK_CHITIETPHIEUNHAP_PHIEUNHAP FOREIGN KEY ([maPhieuNhap]) REFERENCES [dbo].PhieuNhap([maPhieuNhap])
GO
ALTER TABLE [dbo].ChiTietPhieuNhap
ADD CONSTRAINT FK_CHITIETPHIEUNHAP_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].HoaDon
ADD CONSTRAINT FK_HOADON_KHACHHANG FOREIGN KEY ([maKhachHang]) REFERENCES [dbo].KhachHang([maKhachHang])
GO
ALTER TABLE [dbo].HoaDon
ADD CONSTRAINT FK_HOADON_NHANVIEN FOREIGN KEY ([maNhanVien]) REFERENCES [dbo].NhanVien([maNhanVien])
GO
ALTER TABLE [dbo].ChiTietHoaDon
ADD CONSTRAINT FK_CHITIETHOADON_HOADON FOREIGN KEY ([maHoaDon]) REFERENCES [dbo].HoaDon([maHoaDon])
GO
ALTER TABLE [dbo].ChiTietHoaDon
ADD CONSTRAINT FK_CHITIETHOADON_SANPHAM FOREIGN KEY ([maSanPham]) REFERENCES [dbo].SanPham([maSanPham])
GO
ALTER TABLE [dbo].ConNguoi
ADD CONSTRAINT FK_CONNGUOI_ACCOUNT FOREIGN KEY ([maTaiKhoan]) REFERENCES [dbo].Account([maTaiKhoan])
GO
ALTER TABLE [dbo].ConNguoi
ADD CONSTRAINT FK_CONNGUOI_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].ConNguoi
ADD CONSTRAINT FK_CONNGUOI_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].ConNguoi
ADD CONSTRAINT FK_CONNGUOI_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_CONNGUOI FOREIGN KEY ([maNguoi]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_QUYEN FOREIGN KEY ([maQuyen]) REFERENCES [dbo].PhanQuyen([maQuyen])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_THUONG FOREIGN KEY ([maThuong]) REFERENCES [dbo].Thuong([maThuong])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_PHAT FOREIGN KEY ([maPhat]) REFERENCES [dbo].Phat([maPhat])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_LUONG FOREIGN KEY ([maLuong]) REFERENCES [dbo].Luong([maLuong])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].NhanVien
ADD CONSTRAINT FK_NHANVIEN_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].KhachHang
ADD CONSTRAINT FK_KHACHHANG_CONNGUOI FOREIGN KEY ([maNguoi]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].KhachHang
ADD  CONSTRAINT FK_KHACHHANG_LOAIKHACHHANG FOREIGN KEY ([maLoaiKhachHang]) REFERENCES [dbo].LoaiKhachHang([maLoaiKhachHang])
GO
ALTER TABLE [dbo].KhachHang
ADD CONSTRAINT FK_KHACHHANG_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].KhachHang
ADD CONSTRAINT FK_KHACHHANG_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].KhachHang
ADD CONSTRAINT FK_KHACHHANG_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Account
ADD CONSTRAINT FK_ACCOUNT_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Account
ADD CONSTRAINT FK_ACCOUNT_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Account
ADD CONSTRAINT FK_ACCOUNT_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhanQuyen
ADD CONSTRAINT FK_PHANQUYEN_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhanQuyen
ADD CONSTRAINT FK_PHANQUYEN_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhanQuyen
ADD CONSTRAINT FK_PHANQUYEN_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].ChamCong
ADD CONSTRAINT PK_CHAMCONG PRIMARY KEY ([maChamCong], [ngayChamCong], [caLam])
GO
ALTER TABLE [dbo].ChamCong
ADD CONSTRAINT FK_CHAMCONG_NHANVIEN FOREIGN KEY ([maNhanVien]) REFERENCES [dbo].NhanVien([maNhanVien])
GO
ALTER TABLE [dbo].Thuong
ADD CONSTRAINT FK_THUONG_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Thuong
ADD CONSTRAINT FK_THUONG_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Thuong
ADD CONSTRAINT FK_THUONG_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Phat
ADD CONSTRAINT FK_PHAT_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Phat
ADD CONSTRAINT FK_PHAT_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].Phat
ADD CONSTRAINT FK_PHAT_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhuCap
ADD CONSTRAINT FK_PHUCAP_CONNGUOI FOREIGN KEY ([maNguoi]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhuCap
ADD CONSTRAINT FK_PHUCAP_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhuCap
ADD CONSTRAINT FK_PHUCAP_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].PhuCap
ADD CONSTRAINT FK_PHUCAP_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].SanPham
ADD CONSTRAINT FK_SANPHAM_DANHMUCSANPHAM FOREIGN KEY ([maDanhMucSanPham]) REFERENCES [dbo].DanhMucSanPham([maDanhMucSanPham])
GO
ALTER TABLE [dbo].SanPham
ADD CONSTRAINT FK_SANPHAM_NHACUNGCAP FOREIGN KEY ([maNhaCungCap]) REFERENCES [dbo].NhaCungCap([maNhaCungCap])
GO
ALTER TABLE [dbo].SanPham
ADD CONSTRAINT FK_SANPHAM_CONNGUOI1 FOREIGN KEY ([deleteBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].SanPham
ADD CONSTRAINT FK_SANPHAM_CONNGUOI2 FOREIGN KEY ([createBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO
ALTER TABLE [dbo].SanPham
ADD CONSTRAINT FK_SANPHAM_CONNGUOI3 FOREIGN KEY ([updateBy]) REFERENCES [dbo].ConNguoi([maNguoi])
GO