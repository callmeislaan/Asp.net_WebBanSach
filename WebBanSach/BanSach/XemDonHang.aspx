<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="XemDonHang.aspx.cs" Inherits="BanSach.XemDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thông tin đơn hàng</h2>
    <p>
        <asp:SqlDataSource ID="sqlDsDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DonHang] WHERE ([maDonHang] = @maDonHang)">
            <SelectParameters>
                <asp:QueryStringParameter Name="maDonHang" QueryStringField="maDonHang" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:SqlDataSource ID="sqlDsChiTietDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [ChiTietDonHang] WHERE ([maDonHang] = @maDonHang)">
            <SelectParameters>
                <asp:QueryStringParameter Name="maDonHang" QueryStringField="maDonHang" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="maDonHang" DataSourceID="sqlDsDonHang" Height="50px" Width="333px">
            <Fields>
                <asp:BoundField DataField="maDonHang" HeaderText="Mã đơn hàng" InsertVisible="False" ReadOnly="True" SortExpression="maDonHang" />
                <asp:BoundField DataField="tenNguoiNhan" HeaderText="Tên người nhận" SortExpression="tenNguoiNhan" />
                <asp:BoundField DataField="ngayBan" HeaderText="Ngày đặt" SortExpression="ngayBan" />
                <asp:BoundField DataField="diaChiGiaoHang" HeaderText="Địa chỉ giao hàng" SortExpression="diaChiGiaoHang" />
                <asp:BoundField DataField="soDT" HeaderText="Số điện thoại" SortExpression="soDT" />
                <asp:BoundField DataField="maNguoiDung" HeaderText="Người đặt" SortExpression="maNguoiDung" />
                <asp:BoundField DataField="thanhTien" DataFormatString="{0:n0}đ" HeaderText="Thành tiền" SortExpression="thanhTien" />
            </Fields>
        </asp:DetailsView>
    </p>
    <p style="font-size: large"><strong>Các mặt hàng đặt</strong></p>
    <p style="font-size: large">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="maChiTiet" DataSourceID="sqlDsChiTietDonHang">
            <Columns>
                <asp:BoundField DataField="maChiTiet" HeaderText="Mã chi tiết" InsertVisible="False" ReadOnly="True" SortExpression="maChiTiet" />
                <asp:BoundField DataField="maSach" HeaderText="Mã sách" SortExpression="maSach" />
                <asp:BoundField DataField="soLuong" HeaderText="Số lượng" SortExpression="soLuong" />
                <asp:BoundField DataField="phuongThucThanhToan" HeaderText="Phương thức thanh toán" SortExpression="phuongThucThanhToan" />
            </Columns>
        </asp:GridView>
    </p>
<p style="font-size: large">
        <asp:LinkButton ID="lbtnQuayLaiTrangSach" runat="server" PostBackUrl="~/TrangSach.aspx">Tiếp tục mua hàng</asp:LinkButton>
    </p>
</asp:Content>
