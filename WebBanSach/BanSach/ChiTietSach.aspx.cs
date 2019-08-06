using BanSach.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanSach
{
    public partial class ChiTietSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fvChiTiet_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {
            
        }

        public void choSachVaoSession()
        {
            DataView dv = (DataView)sqlDsChiTietSach.Select(DataSourceSelectArguments.Empty);
            DataTable dt = dv.ToTable() as DataTable;
            DataRow dr = dt.Rows[0];

            // lay thong tin mat hang duoc chon
            int ma = Convert.ToInt32(dr["maSach"]);
            string ten = dr["tenSach"].ToString();
            Decimal gia1 = Convert.ToDecimal(dr["giaBan"]);
            int gia = Convert.ToInt32(gia1);
            //// lay gio hang tu Session

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
        }

        protected void lbtnChoVaoGioHang_Click(object sender, EventArgs e)
        {
            choSachVaoSession();
            // Chuyen den trang gio hang
            Response.Redirect("GioHang.aspx");  
        }

        protected void lbtnDatMua_Click(object sender, EventArgs e)
        {
            choSachVaoSession();
            // Chuyen den trang gio hang
            Response.Redirect("ThanhToan.aspx");
        }

    }
}