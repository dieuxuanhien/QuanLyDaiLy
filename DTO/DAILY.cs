using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    internal class DAILY
    {
        public int MaDaiLy { get; set; }            // Identity, Primary Key
        public string? TenDaiLy { get; set; }        // Tên đại lý
        public int MaLoaiDaiLy { get; set; }        // Mã loại đại lý (FK)
        public string? SDT { get; set; }             // Số điện thoại
        public string? Email { get; set; }           // Email
        public string? DiaChi { get; set; }          // Địa chỉ
        public int MaQuan { get; set; }             // Mã quận (FK)
        public DateTime NgayTiepNhan { get; set; }  // Ngày tiếp nhận
        public decimal TongNo { get; set; }         // Tổng nợ

        public DAILY()
        {
        }
        public DAILY(int maDaiLy, string tenDaiLy, int maLoaiDaiLy, string sdt,
                   string email, string diaChi, int maQuan, DateTime ngayTiepNhan, decimal tongNo)
        {
            MaDaiLy = maDaiLy;
            TenDaiLy = tenDaiLy;
            MaLoaiDaiLy = maLoaiDaiLy;
            SDT = sdt;
            Email = email;
            DiaChi = diaChi;
            MaQuan = maQuan;
            NgayTiepNhan = ngayTiepNhan;
            TongNo = tongNo;
        }
    }
}
