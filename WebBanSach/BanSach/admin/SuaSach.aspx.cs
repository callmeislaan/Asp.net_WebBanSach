using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class SuaSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            lblThongBao.Text = "";
        }

        protected void FormView1_ItemDeleted(object sender, FormViewDeletedEventArgs e)
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

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
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

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
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