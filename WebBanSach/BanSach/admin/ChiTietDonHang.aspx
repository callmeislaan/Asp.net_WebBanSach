<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="ChiTietDonHang.aspx.cs" Inherits="BanSach.admin.ChiTietDonHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Chi tiết đơn hàng</h2>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maChiTiet" DataSourceID="sqlDsChiTietDonHang">
            <Columns>
                <asp:BoundField DataField="maChiTiet" HeaderText="Mã chi tiết" InsertVisible="False" ReadOnly="True" SortExpression="maChiTiet" />
                <asp:BoundField DataField="maSach" HeaderText="Mã sách" SortExpression="maSach" />
                <asp:BoundField DataField="soLuong" HeaderText="Số lượng" SortExpression="soLuong" />
                <asp:BoundField DataField="phuongThucThanhToan" HeaderText="Phương thức thanh toán" SortExpression="phuongThucThanhToan" />
                <asp:BoundField DataField="maDonHang" HeaderText="Mã đơn hàng" SortExpression="maDonHang" />
                <asp:CommandField ButtonType="Button" CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:LinkButton ID="lbtnTroLaiDonHang" runat="server" PostBackUrl="~/admin/QuanLyDonHang.aspx">Quay lại</asp:LinkButton>
    </p>
    <p>
        <asp:SqlDataSource ID="sqlDsChiTietDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [ChiTietDonHang] WHERE [maChiTiet] = @maChiTiet" InsertCommand="INSERT INTO [ChiTietDonHang] ([maSach], [soLuong], [phuongThucThanhToan], [maDonHang]) VALUES (@maSach, @soLuong, @phuongThucThanhToan, @maDonHang)" SelectCommand="SELECT * FROM [ChiTietDonHang] WHERE ([maDonHang] = @maDonHang)" UpdateCommand="UPDATE [ChiTietDonHang] SET [maSach] = @maSach, [soLuong] = @soLuong, [phuongThucThanhToan] = @phuongThucThanhToan, [maDonHang] = @maDonHang WHERE [maChiTiet] = @maChiTiet">
            <DeleteParameters>
                <asp:Parameter Name="maChiTiet" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="maSach" Type="Int32" />
                <asp:Parameter Name="soLuong" Type="Int32" />
                <asp:Parameter Name="phuongThucThanhToan" Type="String" />
                <asp:Parameter Name="maDonHang" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="maDonHang" QueryStringField="maDonHang" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="maSach" Type="Int32" />
                <asp:Parameter Name="soLuong" Type="Int32" />
                <asp:Parameter Name="phuongThucThanhToan" Type="String" />
                <asp:Parameter Name="maDonHang" Type="Int32" />
                <asp:Parameter Name="maChiTiet" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
