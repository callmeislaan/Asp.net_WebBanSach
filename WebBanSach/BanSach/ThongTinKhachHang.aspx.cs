﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class ThongTinKhachHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbtnDangXuat_Click(object sender, EventArgs e)
        {
            Session.Remove("User");
            Response.Redirect("TrangSach.aspx");
        }
    }
}