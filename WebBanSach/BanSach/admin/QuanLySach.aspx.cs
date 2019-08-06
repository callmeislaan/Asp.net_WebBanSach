using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class QuanLySach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvSach_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvSach_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void gvSach_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void gvSach_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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
    }
}