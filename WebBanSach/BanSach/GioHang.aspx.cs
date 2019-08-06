using BanSach.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class GioHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cart aCart;
            if (Session["Cart"] == null) // neu chua co gio hang
            {
                aCart = new Cart(); // tao gio hang moi
            }
            else
            {
                aCart = (Cart)Session["Cart"];
            }
            if (!IsPostBack)
            {
                // hien thi du lieu tu gio hang vao luoi
                BindGrid(aCart);
                //foreach (var item in aCart.items)
                //{
                //    Response.Write(item.tenSach + "<br/>");
                //}
            }
        }

        // ham Binding du lieu vao GridView
        public void BindGrid(Cart aCard)
        {
            // lay DataSource cua GridView la cac items cua gio hang
            gvGioHang.DataSource = aCard.items;
            gvGioHang.DataBind();
            lblTongTien.Text = "Tổng tiền: " + aCard.TongTien.ToString();
        }

        protected void gvGioHang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void gvGioHang_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // lay chi so cua dong duoc chon
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            // lay ma sach
            int maSach = Convert.ToInt32(gvGioHang.Rows[rowIndex].Cells[0].Text);
            // lay so luong
            TextBox txtSoLuong = (TextBox)gvGioHang.Rows[rowIndex].FindControl("txtSoLuong");
            int soLuong = Convert.ToInt32(txtSoLuong.Text);
            // lay gio hang tu Sesssion
            Cart aCart;
            if (Session["Cart"] == null) // neu chua co gio hang
            {
                aCart = new Cart(); // tao gio hang moi
            }
            else
            {
                aCart = (Cart)Session["Cart"];
            }

            // tim vi tri hang trong gio
            int rowID = aCart.getIndex(maSach);
            // cap nhat so luong
            aCart.updateItem(rowID, soLuong);

            // cap nhat gridview
            BindGrid(aCart);
            // dat lai vao Session
            Session["Cart"] = aCart;
        }

        protected void btnXoaGioHang_Click(object sender, EventArgs e)
        {
            // xoa Sesssion
            Session.Remove("Cart");
            lblTongTien.Text = "";
            // chuyen den trong gio hang
            Response.Redirect("GioHang.aspx");
        }

        protected void btnTiepTucMuaHang_Click(object sender, EventArgs e)
        {
            // chuyen den trang sach
            Response.Redirect("TrangSach.aspx");
        }

        protected void btnThangToan_Click(object sender, EventArgs e)
        {
            Response.Redirect("ThanhToan.aspx");
        }
    }
}