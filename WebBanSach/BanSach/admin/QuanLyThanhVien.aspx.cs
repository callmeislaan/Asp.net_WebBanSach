using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class QuanLyThanhVien : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnNhapLai_Click(object sender, EventArgs e)
        {
            txtDiaChi.Text = "";
            txtEmail.Text = "";
            txtHoTen.Text = "";
            txtLapLaiMatKhau.Text = "";
            txtMatKhau.Text = "";
            txtSoDienThoai.Text = "";
            lblThongBao.Text = "";
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            sqlDsThanhVien.InsertParameters["hoTen"].DefaultValue = txtHoTen.Text.Trim();
            sqlDsThanhVien.InsertParameters["soDT"].DefaultValue = txtSoDienThoai.Text.Trim();
            sqlDsThanhVien.InsertParameters["email"].DefaultValue = txtEmail.Text.Trim();
            sqlDsThanhVien.InsertParameters["diaChi"].DefaultValue = txtDiaChi.Text.Trim();
            sqlDsThanhVien.InsertParameters["gioiTinh"].DefaultValue = ddlGioiTinh.SelectedValue;
            sqlDsThanhVien.InsertParameters["matKhau"].DefaultValue = txtLapLaiMatKhau.Text.Trim();
            sqlDsThanhVien.InsertParameters["quyenHan"].DefaultValue = ddlQuyenHan.SelectedValue;
            try
            {
                sqlDsThanhVien.Insert();
                lblThongBao.Text = "Thêm thành công";
                btnNhapLai_Click(sender, e);
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Thêm mới không thành công, lỗi: " + ex.Message;
            }

        }

        protected void btnHuyBo_Click(object sender, EventArgs e)
        {
            btnNhapLai_Click(sender, e);
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblThongBao.Text = "";
        }

        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblThongBao.Text = "Đã có lỗi xảy ra, lỗi: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblThongBao.Text = "Một người dùng khác có thể đang cập nhật dữ liệu<br/>Cố gắng thử lại sau";
            }
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblThongBao.Text = "Đã có lỗi xảy ra, lỗi: " + e.Exception.Message;
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblThongBao.Text = "Một người dùng khác có thể đang cập nhật dữ liệu<br/>Cố gắng thử lại sau";
            }
        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            
        }
    }
}