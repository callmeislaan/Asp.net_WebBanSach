using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BanSach.App_Code
{
    public class Cart
    {
        public List<CartItem> items { get; set; }
        private int _tongTien;
        public int TongTien
        {
            get
            {
                _tongTien = 0;
                if (items != null)
                {
                    foreach (var item in items)
                    {
                        _tongTien += item.thanhTien;
                    }
                }
                return _tongTien;
            }
        }

        // constructor
        public Cart()
        {
            if (this.items == null)
            {
                // neu chua co mat hang nao thi tao gio trong
                this.items = new List<CartItem>();
            }
        }

        // xac dinh vi tri cua mat hang trong gio
        public int getIndex(int ma)
        {
            int index = 0;
            foreach (var item in this.items)
            {
                if (item.maSach == ma)
                {
                    return index;
                }
                index++;
            }
            return -1;
        }

        // them mot mat hang vao gio
        public void insertItem(int ma, string ten, int gia, int soLuong)
        {
            int index = this.getIndex(ma);
            if (index == -1) // cha co mat hang nay trong gio
            {
                // tao mot CartItem moi
                CartItem anItem = new CartItem(ma, ten, soLuong, gia);
                // them CartItem moi vao danh sach items cac mat hang trong gio
                items.Add(anItem);
            }
            else // neu da co mat hang trong gio
            {
                // tang them so luong cua mat hang nay
                items[index].soLuong += soLuong;
            }
        }

        // xoa mot mat hang khoi gio
        public void deleteItem(int rowID)
        {
            items.RemoveAt(rowID);
        }

        // cap nhat so luong hang
        public void updateItem(int rowID, int soLuong)
        {
            if (soLuong == 0)
            {
                // xoa mat hang khoi gio
                deleteItem(rowID);
            }
            else
            {
                // lay mat hang can sua
                CartItem updateItem = items[rowID];
                // sua so luong
                updateItem.soLuong = soLuong;
            }
        }

    }
}