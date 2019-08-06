using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class MasterPageClient : System.Web.UI.MasterPage
    {
        bool daDangNhap = false;
        string userID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] != null)
            {
                User user = (User)Session["User"];
                lbtnDangKy.Text = "";
                lbtnDangNhap.Text = user.name;
                userID = user.userID;
                daDangNhap = true;
            }
        }

        protected void lbtnDangNhap_Click(object sender, EventArgs e)
        {
            if (daDangNhap)
            {
                Response.Redirect("ThongTinKhachHang.aspx?maNguoiDung=" + userID);
            }
            else
            {
                Response.Redirect("DangNhap.aspx");
            }
        }
    }
}