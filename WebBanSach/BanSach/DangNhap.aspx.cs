using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangNhap_Click(object sender, EventArgs e)
        {
            DataView dv = (DataView)sqlDsDangNhap.Select(DataSourceSelectArguments.Empty);
            int num = dv.Count;
            if (num > 0)
            {
                DataTable dt = dv.ToTable() as DataTable;
                DataRow dr = dt.Rows[0];
                User user = new User();
                user.userName = txtTaiKhoan.Text.Trim();
                user.password = txtMatKhau.Text.Trim();
                user.name = dr["hoTen"].ToString();
                user.address = dr["diaChi"].ToString();
                user.phoneNumber = dr["soDT"].ToString();
                user.userID = dr["maNguoiDung"].ToString();
                Session.Add("User", user);

                // xet xem la admin hay khach hang
                dv.RowFilter = "quyenHan = 'admin'";
                if (dv.Count > 0)
                {
                    Response.Redirect("admin/QuanLyDanhMuc.aspx");
                }
                else
                {
                    
                    Response.Redirect("TrangSach.aspx");
                }
            }
            else
            {
                lblThongBao.Text = "Đăng nhập không thành công!";
            }

        }
    }
}