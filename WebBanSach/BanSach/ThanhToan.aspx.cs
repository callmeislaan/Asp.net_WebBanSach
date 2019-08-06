using BanSach.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class ThanhToan : System.Web.UI.Page
    {

        string maDonHang;
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lay gio hang tu Session
            Cart aCart;
            if (Session["Cart"] == null) // neu chua co gio hang
            {
                aCart = new Cart(); // tao gio hang moi   
            }
            else
            {
                aCart = (Cart)Session["Cart"];
            }
            if (!IsPostBack)
            {
                // hien thi du lieu tu gio hang vao luoi
                BindGrid(aCart);
            }

            // thiet lap cac dieu khien o phan thong tin thanh toan
            ddlNganHang.Enabled = false;
            txtMaThe.Enabled = false;
            ckbTrucTiep.AutoPostBack = true;
            int phiVanChuyen = 20000;
            int thanhTien = Convert.ToInt32(aCart.TongTien) + phiVanChuyen;
            lblThanhTien.Text = thanhTien.ToString();

            // cho du lieu nguoi dung vao neu da dang nhap
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                txtTenNguoiNhan.Text = user.name;
                txtDiaChi.Text = user.address;
                txtDienThoai.Text = user.phoneNumber;
            }
        }

        // ham binding du lieu vao gridview
        public void BindGrid(Cart aCart)
        {
            // lay datasourt cua gridview la cac items cua gio hang
            gvHangDat.DataSource = aCart.items;
            gvHangDat.DataBind();
            lblTongTien.Text = aCart.TongTien.ToString();
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void ckbTrucTiep_CheckedChanged(object sender, EventArgs e)
        {
            if (ckbTrucTiep.Checked)
            {
                // neu chon thanh toan khi nhan hang thi an phan nhap thong tin the thanh toan
                ddlNganHang.Enabled = false;
                txtMaThe.Enabled = false;
            }
            else
            {
                // bo chon thanh toan khi nhan hang thi se hien phan thong tin the thanh toan
                ddlNganHang.Enabled = true;
                txtMaThe.Enabled = true;
            }
        }

        protected void btnDatMua_Click(object sender, EventArgs e)
        {
            string maNguoiDung = "";
            // Lay gio hang tu Session
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                maNguoiDung = user.userID;
            }
            Cart aCart;
            if (Session["Cart"] != null) // neu da co gio hang
            {
                aCart = (Cart)Session["Cart"];
                // Thiet lap gia tri cua cac tham so cua don hang
                sqlDsDonHang.InsertParameters["tenNguoiNhan"].DefaultValue = txtTenNguoiNhan.Text.Trim();
                sqlDsDonHang.InsertParameters["ngayBan"].DefaultValue = DateTime.Now.ToShortDateString();
                sqlDsDonHang.InsertParameters["diaChiGiaoHang"].DefaultValue = txtDiaChi.Text.Trim();
                sqlDsDonHang.InsertParameters["soDT"].DefaultValue = txtDienThoai.Text.Trim();
                sqlDsDonHang.InsertParameters["thanhTien"].DefaultValue = lblThanhTien.Text;
                sqlDsDonHang.InsertParameters["maNguoiDung"].DefaultValue = maNguoiDung;
                try
                {
                    // chen mot dong vao bang don hang
                    sqlDsDonHang.Insert();

                    // chen cac chi tiet vao bang chi tiet don hang bang vong lap
                    foreach (var item in aCart.items)
                    {
                        // thiet lap gia tri cho cac tham bien cua mot chi tiet don
                        // ma don hang la bien toan cuc
                        sqlDsChiTietDonHang.InsertParameters["maDonHang"].DefaultValue = maDonHang;
                        sqlDsChiTietDonHang.InsertParameters["maSach"].DefaultValue = item.maSach.ToString();
                        sqlDsChiTietDonHang.InsertParameters["soLuong"].DefaultValue = item.soLuong.ToString();
                        sqlDsChiTietDonHang.InsertParameters["phuongThucThanhToan"].DefaultValue = ckbTrucTiep.Checked ? "TrucTiep" : "QuaThe";

                        // chen mot dong vao bang chi tiet don
                        sqlDsChiTietDonHang.Insert();
                    }
                    // xoa gio hang
                    Session.Remove("Cart");
                    // dat hang thanh cong chuyen den trang thong tin don hang keo theo ma don hang
                    Response.Redirect("XemDonHang.aspx?maDonHang=" + maDonHang);
                }
                catch (Exception ex)
                {
                    // hien thi thong bao khong thanh cong
                    lblThongBao.Text = "Đặt hàng thất bại, lỗi: " + ex.Message;
                }
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void gvHangDat_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void sqlDsDonHang_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            // Lay ma don hang duoc sinh tu dong cua ban ghi vua duoc chen vao
            maDonHang = e.Command.Parameters["@maDonHang"].Value.ToString();
        }
    }
}