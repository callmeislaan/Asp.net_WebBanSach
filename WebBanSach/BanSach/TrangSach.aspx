<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="TrangSach.aspx.cs" Inherits="BanSach.TrangSach" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <strong>Chọn danh mục sách:
<asp:DropDownList ID="ddlDanhMuc" runat="server" AutoPostBack="True" DataSourceID="sqlDsDanhMuc" DataTextField="tenDanhMuc" DataValueField="maDanhMuc">
</asp:DropDownList>
<asp:SqlDataSource ID="sqlDsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DanhMuc]"></asp:SqlDataSource>
</strong>
<h2>Danh sách sách:
        <asp:Label ID="lblTenDanhMuc" runat="server"></asp:Label>
    </h2>
    <asp:GridView ID="gvSach" runat="server" AutoGenerateColumns="False" DataKeyNames="maSach" DataSourceID="sqlDsSach" Width="100%" PageSize="3" style="text-align: center" OnRowCommand="GridView1_RowCommand" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="maSach" HeaderText="Mã sách" SortExpression="maSach" ReadOnly="True" />
            <asp:BoundField DataField="tenSach" HeaderText="Tên sách" SortExpression="tenSach" />
            <asp:ImageField DataImageUrlField="anhBia" DataImageUrlFormatString="~/images/{0}" HeaderText="Ảnh bìa">
                <ControlStyle Height="100px" Width="100px" />
            </asp:ImageField>
            <asp:BoundField DataField="tacGia" HeaderText="Tác giả" SortExpression="tacGia" />
            <asp:BoundField DataField="nhaXuatBan" HeaderText="Nhà xuất bản" SortExpression="nhaXuatBan" />
            <asp:BoundField DataField="giaBia" HeaderText="Giá bìa" SortExpression="giaBia" DataFormatString="{0:n0}" />
            <asp:BoundField DataField="giaBan" HeaderText="Giá bán" SortExpression="giaBan" DataFormatString="{0:n0}" />
            <asp:HyperLinkField DataNavigateUrlFields="maSach" DataNavigateUrlFormatString="ChiTietSach.aspx?MaSach={0}" NavigateUrl="~/ChiTietSach.aspx" Text="Xem chi tiết" />
            <asp:ButtonField ButtonType="Button" Text="Cho vào giỏ" />
        </Columns>
        <PagerSettings FirstPageImageUrl="~/images/First.bmp" LastPageImageUrl="~/images/Last.bmp" Mode="NextPreviousFirstLast" NextPageImageUrl="~/images/Next.bmp" PreviousPageImageUrl="~/images/Previous.bmp" />
    </asp:GridView>
<asp:SqlDataSource ID="sqlDsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT [maSach], [tenSach], [tacGia], [nhaXuatBan], [giaBia], [giaBan], [anhBia], [maDanhMuc] FROM [Sach] WHERE ([maDanhMuc] = @maDanhMuc)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ddlDanhMuc" Name="maDanhMuc" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
<br />
<br />
&nbsp;&nbsp;
</asp:Content>
