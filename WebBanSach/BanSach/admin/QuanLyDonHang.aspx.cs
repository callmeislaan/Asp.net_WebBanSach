﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class QuanLyDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvDonHang_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void gvDonHang_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

        protected void gvDonHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblThongBao.Text = "";
        }
    }
}