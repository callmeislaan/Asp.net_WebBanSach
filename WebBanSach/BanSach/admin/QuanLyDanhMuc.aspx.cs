using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach.admin
{
    public partial class QuanLyDanhMuc : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblThongBao.Text = "";
        }

        protected void btnThemDanhMuc_Click(object sender, EventArgs e)
        {
            sqlDsDanhMuc.InsertParameters["tenDanhMuc"].DefaultValue = txtTenDanhMuc.Text.Trim();
            try
            {
                sqlDsDanhMuc.Insert();
                txtTenDanhMuc.Text = "";
                gvDanhMuc.DataBind();
                lblThongBao.Text = "Thêm danh mục thành công";
            }
            catch (Exception ex)
            {
                lblThongBao.Text = "Thêm danh mục thất bại, lỗi: " + ex.Message;
            }
        }

        protected void gvDanhMuc_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

        protected void gvDanhMuc_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

        protected void gvDanhMuc_RowCreated(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void gvDanhMuc_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            lblThongBao.Text = "";
        }
    }
}