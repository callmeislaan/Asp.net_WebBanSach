using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class ThemSachMoi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            txtAnhBia.Text = "";
            txtGiaBan.Text = "";
            txtGiaBia.Text = "";
            txtKichThuoc.Text = "";
            txtMoTa.Text = "";
            txtNgayPhatHanh.Text = "";
            txtNhaPhatHanh.Text = "";
            txtNhaXuatBan.Text = "";
            txtSoLuong.Text = "";
            txtSoTrang.Text = "";
            txtTacGia.Text = "";
            txtTenSach.Text = "";
            txtTrongLuongVanChuyen.Text = "";
        }

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {

        }

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            sqlDsSach.InsertParameters["tenSach"].DefaultValue = txtTenSach.Text.Trim();
            sqlDsSach.InsertParameters["anhBia"].DefaultValue = txtAnhBia.Text.Trim();
            sqlDsSach.InsertParameters["soLuong"].DefaultValue = txtSoLuong.Text.Trim();
            sqlDsSach.InsertParameters["tacGia"].DefaultValue = txtTacGia.Text.Trim();
            sqlDsSach.InsertParameters["nhaXuatBan"].DefaultValue = txtNhaXuatBan.Text.Trim();
            sqlDsSach.InsertParameters["giaBia"].DefaultValue = txtGiaBia.Text.Trim();
            sqlDsSach.InsertParameters["giaBan"].DefaultValue = txtGiaBan.Text.Trim();
            sqlDsSach.InsertParameters["nhaPhatHanh"].DefaultValue = txtNhaPhatHanh.Text.Trim();
            sqlDsSach.InsertParameters["kichThuoc"].DefaultValue = txtKichThuoc.Text.Trim();
            sqlDsSach.InsertParameters["soTrang"].DefaultValue = txtSoTrang.Text.Trim();
            sqlDsSach.InsertParameters["ngayPhatHanh"].DefaultValue = txtNgayPhatHanh.Text.Trim();
            sqlDsSach.InsertParameters["trongLuongVanChuyen"].DefaultValue = txtTrongLuongVanChuyen.Text.Trim();
            sqlDsSach.InsertParameters["moTa"].DefaultValue = txtMoTa.Text.Trim();
            sqlDsSach.InsertParameters["maDanhMuc"].DefaultValue = ddlDanhMuc.SelectedValue;
            try
            {
                sqlDsSach.Insert();

                lblThongBao.Text = "Thêm sách thành công";
                btnNhapLai_Click(sender, e);
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Thêm mới không thành công, Lỗi: " + ex.Message;
            }
        }
    }
}