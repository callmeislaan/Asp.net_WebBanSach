using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.App_Code
{
    public class CartItem
    {
        public int maSach { get; set; }
        public string tenSach { get; set; }
        public int soLuong { get; set; }
        public int giaBan { get; set; }


        private int _thanhTien;
        public int thanhTien
        {
            get
            {
                _thanhTien = giaBan * soLuong;
                return _thanhTien;
            }
        }

        public CartItem(int maSach, string tenSach, int soLuong, int giaBan)
        {
            this.maSach = maSach;
            this.tenSach = tenSach;
            this.soLuong = soLuong;
            this.giaBan = giaBan;
        }
    }
}