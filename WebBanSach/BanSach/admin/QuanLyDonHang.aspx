<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyDonHang.aspx.cs" Inherits="BanSach.admin.QuanLyDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý đơn hàng</h2>
    <p>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="gvDonHang" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maDonHang" DataSourceID="sqlDsDonHang" OnRowCommand="gvDonHang_RowCommand" OnRowDeleted="gvDonHang_RowDeleted" OnRowUpdated="gvDonHang_RowUpdated" PageSize="5" Width="99%">
            <Columns>
                <asp:BoundField DataField="maDonHang" HeaderText="Mã đơn hàng" InsertVisible="False" ReadOnly="True" SortExpression="maDonHang" />
                <asp:BoundField DataField="ngayBan" HeaderText="Ngày bán" SortExpression="ngayBan" />
                <asp:BoundField DataField="maNguoiDung" HeaderText="Mã người dùng" SortExpression="maNguoiDung" />
                <asp:BoundField DataField="tenNguoiNhan" HeaderText="Tên người nhận" SortExpression="tenNguoiNhan" />
                <asp:BoundField DataField="diaChiGiaoHang" HeaderText="Địa chỉ giao hàng" SortExpression="diaChiGiaoHang" />
                <asp:BoundField DataField="soDT" HeaderText="Số điện thoại" SortExpression="soDT" />
                <asp:BoundField DataField="thanhTien" DataFormatString="{0:n0}đ" HeaderText="Thành tiền" SortExpression="thanhTien" />
                <asp:HyperLinkField DataNavigateUrlFields="maDonHang" DataNavigateUrlFormatString="ChiTietDonHang.aspx?maDonHang={0}" Text="Xem chi tiết" />
                <asp:CommandField ButtonType="Button" CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sqlDsDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [DonHang] WHERE [maDonHang] = @maDonHang" InsertCommand="INSERT INTO [DonHang] ([ngayBan], [maNguoiDung], [tenNguoiNhan], [diaChiGiaoHang], [soDT], [thanhTien]) VALUES (@ngayBan, @maNguoiDung, @tenNguoiNhan, @diaChiGiaoHang, @soDT, @thanhTien)" SelectCommand="SELECT * FROM [DonHang]" UpdateCommand="UPDATE [DonHang] SET [ngayBan] = @ngayBan, [maNguoiDung] = @maNguoiDung, [tenNguoiNhan] = @tenNguoiNhan, [diaChiGiaoHang] = @diaChiGiaoHang, [soDT] = @soDT, [thanhTien] = @thanhTien WHERE [maDonHang] = @maDonHang">
            <DeleteParameters>
                <asp:Parameter Name="maDonHang" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ngayBan" Type="DateTime" />
                <asp:Parameter Name="maNguoiDung" Type="Int32" />
                <asp:Parameter Name="tenNguoiNhan" Type="String" />
                <asp:Parameter Name="diaChiGiaoHang" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="thanhTien" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ngayBan" Type="DateTime" />
                <asp:Parameter Name="maNguoiDung" Type="Int32" />
                <asp:Parameter Name="tenNguoiNhan" Type="String" />
                <asp:Parameter Name="diaChiGiaoHang" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="thanhTien" Type="Decimal" />
                <asp:Parameter Name="maDonHang" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
