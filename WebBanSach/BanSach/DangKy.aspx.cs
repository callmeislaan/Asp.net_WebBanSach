using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ddlGioiTinh_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnDangKy_Click(object sender, EventArgs e)
        {
            sqlDsDangKy.InsertParameters["hoTen"].DefaultValue = txtHoTen.Text.Trim();
            sqlDsDangKy.InsertParameters["gioiTinh"].DefaultValue = ddlGioiTinh.SelectedValue;
            sqlDsDangKy.InsertParameters["email"].DefaultValue = txtEmail.Text.Trim();
            sqlDsDangKy.InsertParameters["soDT"].DefaultValue = txtSoDT.Text.Trim();
            sqlDsDangKy.InsertParameters["diaChi"].DefaultValue = txtDiaChi.Text.Trim();
            sqlDsDangKy.InsertParameters["matKhau"].DefaultValue = txtLapLaiMatKhau.Text.Trim();
            sqlDsDangKy.InsertParameters["quyenHan"].DefaultValue = "kh";
            try
            {
                sqlDsDangKy.Insert();
                lblThongBao.Text = "Đăng ký thành công";
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Đăng ký không thành công, Lỗi: " + ex.Message;
            }
        }
    }
}