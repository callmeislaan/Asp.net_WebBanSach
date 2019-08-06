<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLySach.aspx.cs" Inherits="BanSach.admin.QuanLySach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý sách</h2>
    <p>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:LinkButton ID="lbtnThemSach" runat="server" PostBackUrl="~/admin/ThemSachMoi.aspx">Thêm sách mới</asp:LinkButton>
    </p>
    <p><strong>Chọn danh muc: </strong>
        <asp:DropDownList ID="ddlDanhMuc" runat="server" AutoPostBack="True" DataSourceID="sqlDsDanhMuc" DataTextField="tenDanhMuc" DataValueField="maDanhMuc">
        </asp:DropDownList>
        <asp:SqlDataSource ID="sqlDsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DanhMuc]"></asp:SqlDataSource>
    </p>
    <p>
        <asp:GridView ID="gvSach" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maSach" DataSourceID="sqlDsSach" OnRowCommand="gvSach_RowCommand" OnRowDeleted="gvSach_RowDeleted" OnRowUpdated="gvSach_RowUpdated" OnSelectedIndexChanged="gvSach_SelectedIndexChanged" Width="99%">
            <Columns>
                <asp:BoundField DataField="maSach" HeaderText="Mã sách" InsertVisible="False" ReadOnly="True" SortExpression="maSach" />
                <asp:BoundField DataField="tenSach" HeaderText="Tên sách" SortExpression="tenSach" />
                <asp:ImageField DataImageUrlField="anhBia" DataImageUrlFormatString="~/images/{0}" HeaderText="Ảnh bìa">
                    <ControlStyle Height="100px" Width="100px" />
                </asp:ImageField>
                <asp:BoundField DataField="soLuong" HeaderText="Số lượng" SortExpression="soLuong" />
                <asp:BoundField DataField="tacGia" HeaderText="Tác giả" SortExpression="tacGia" />
                <asp:BoundField DataField="nhaXuatBan" HeaderText="Nhà xuất bản" SortExpression="nhaXuatBan" />
                <asp:BoundField DataField="giaBia" HeaderText="Giá bìa" SortExpression="giaBia" />
                <asp:BoundField DataField="giaBan" HeaderText="Giá bán" SortExpression="giaBan" />
                <asp:BoundField DataField="maDanhMuc" HeaderText="Mã danh mục" SortExpression="maDanhMuc" />
                <asp:CommandField CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" UpdateText="Cập nhật" />
                <asp:HyperLinkField DataNavigateUrlFields="maSach" DataNavigateUrlFormatString="SuaSach.aspx?maSach={0}" Text="Sửa" />
            </Columns>
        </asp:GridView>
    </p>
    <p>
        <asp:SqlDataSource ID="sqlDsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [Sach] WHERE [maSach] = @maSach" InsertCommand="INSERT INTO [Sach] ([tenSach], [soLuong], [tacGia], [nhaXuatBan], [giaBia], [giaBan], [anhBia], [maDanhMuc]) VALUES (@tenSach, @soLuong, @tacGia, @nhaXuatBan, @giaBia, @giaBan, @anhBia, @maDanhMuc)" SelectCommand="SELECT [maSach], [tenSach], [soLuong], [tacGia], [nhaXuatBan], [giaBia], [giaBan], [anhBia], [maDanhMuc] FROM [Sach] WHERE ([maDanhMuc] = @maDanhMuc)" UpdateCommand="UPDATE [Sach] SET [tenSach] = @tenSach, [soLuong] = @soLuong, [tacGia] = @tacGia, [nhaXuatBan] = @nhaXuatBan, [giaBia] = @giaBia, [giaBan] = @giaBan, [anhBia] = @anhBia, [maDanhMuc] = @maDanhMuc WHERE [maSach] = @maSach">
            <DeleteParameters>
                <asp:Parameter Name="maSach" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tenSach" Type="String" />
                <asp:Parameter Name="soLuong" Type="Int32" />
                <asp:Parameter Name="tacGia" Type="String" />
                <asp:Parameter Name="nhaXuatBan" Type="String" />
                <asp:Parameter Name="giaBia" Type="Decimal" />
                <asp:Parameter Name="giaBan" Type="Decimal" />
                <asp:Parameter Name="anhBia" Type="String" />
                <asp:Parameter Name="maDanhMuc" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlDanhMuc" Name="maDanhMuc" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="tenSach" Type="String" />
                <asp:Parameter Name="soLuong" Type="Int32" />
                <asp:Parameter Name="tacGia" Type="String" />
                <asp:Parameter Name="nhaXuatBan" Type="String" />
                <asp:Parameter Name="giaBia" Type="Decimal" />
                <asp:Parameter Name="giaBan" Type="Decimal" />
                <asp:Parameter Name="anhBia" Type="String" />
                <asp:Parameter Name="maDanhMuc" Type="Int32" />
                <asp:Parameter Name="maSach" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
