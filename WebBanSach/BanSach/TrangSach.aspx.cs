using BanSach.App_Code;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class TrangSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string tenDanhMuc = sqlDsDanhMuc.SortParameterName;
            lblTenDanhMuc.Text = tenDanhMuc;
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lbtnChiTietSach_Click(object sender, EventArgs e)
        {
            string maSach = sqlDsSach.SortParameterName;
            lblTenDanhMuc.Text = maSach;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument);
            //string gia = gvSach.Rows[rowIndex].Cells[6].Text;
            //Response.Write(gia);
            // lay thong tin mat hang duoc chon
            int ma = Convert.ToInt32(gvSach.Rows[rowIndex].Cells[0].Text);
            string ten = gvSach.Rows[rowIndex].Cells[1].Text;
            Decimal gia1 = Convert.ToDecimal(gvSach.Rows[rowIndex].Cells[6].Text);
            int gia = Convert.ToInt32(gia1);
            //lay gio hang tu Session
   
            Cart aCart;
            if (Session["Cart"] == null) // neu chua co gio hang
            {
                aCart = new Cart(); // tao gio hang moi
            }
            else
            {
                aCart = (Cart)Session["Cart"];
            }

            // them hang vao gio
            aCart.insertItem(ma, ten, gia, 1);
            // dat lai vao Session
            Session["Cart"] = aCart;

            // Chuyen den trang gio hang
            Response.Redirect("GioHang.aspx");
        }
    }
}