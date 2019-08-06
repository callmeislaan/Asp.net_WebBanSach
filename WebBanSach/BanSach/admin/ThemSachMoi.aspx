<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="ThemSachMoi.aspx.cs" Inherits="BanSach.admin.ThemSachMoi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            height: 25px;
        }
        .auto-style5 {
            width: 161px;
        }
        .auto-style6 {
            height: 25px;
            width: 161px;
        }
        .auto-style7 {
            height: 26px;
            width: 161px;
        }
        .auto-style8 {
            width: 161px;
            height: 192px;
        }
        .auto-style9 {
            height: 192px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thêm sách mới</h2>
    <p>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style7">Tên sách</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtTenSach" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTenSach" runat="server" ControlToValidate="txtTenSach" Display="Dynamic" ErrorMessage="Tên sách không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">Số lượng</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtSoLuong" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" ErrorMessage="Số lượng không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
&nbsp;
                <asp:RegularExpressionValidator ID="regSoLuong" runat="server" ControlToValidate="txtSoLuong" Display="Dynamic" ErrorMessage="Số lượng phải là một số" ForeColor="Red" ValidationExpression="\d" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Tác giả</td>
            <td>
                <asp:TextBox ID="txtTacGia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Nhà xuất bản</td>
            <td aria-multiselectable="False">
                <asp:TextBox ID="txtNhaXuatBan" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Giá bìa</td>
            <td>
                <asp:TextBox ID="txtGiaBia" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regGiaBia" runat="server" ControlToValidate="txtGiaBia" Display="Dynamic" ErrorMessage="Giá bìa phải là một số" ForeColor="Red" ValidationExpression="\d" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Giá bán</td>
            <td>
                <asp:TextBox ID="txtGiaBan" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqGiaBan" runat="server" ControlToValidate="txtGiaBan" Display="Dynamic" ErrorMessage="Giá bán không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="regGiaBia0" runat="server" ControlToValidate="txtGiaBan" Display="Dynamic" ErrorMessage="Giá bán phải là một số" ForeColor="Red" ValidationExpression="\d" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Ảnh bìa</td>
            <td>
                <asp:TextBox ID="txtAnhBia" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Nhà phát hành</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtNhaPhatHanh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Kích thước</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtKichThuoc" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">Số trang</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtSoTrang" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regSoTrang" runat="server" ControlToValidate="txtSoTrang" Display="Dynamic" ErrorMessage="Số trang phải là một số" ForeColor="Red" ValidationExpression="\d" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Ngày phát hành</td>
            <td>
                <asp:TextBox ID="txtNgayPhatHanh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Trọng lượng vận chuyển</td>
            <td>
                <asp:TextBox ID="txtTrongLuongVanChuyen" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Danh mục</td>
            <td>
                <asp:DropDownList ID="ddlDanhMuc" runat="server" DataSourceID="sqlDsDanhMuc" DataTextField="tenDanhMuc" DataValueField="maDanhMuc">
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlDsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DanhMuc]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Mô tả</td>
            <td class="auto-style9">
                <asp:TextBox ID="txtMoTa" runat="server" Height="100%" TextMode="MultiLine" Width="50%"></asp:TextBox>
            </td>
        </tr>
    </table>
&nbsp;<asp:Button ID="btnThemMoi" runat="server" OnClick="btnThemMoi_Click" Text="Thêm mới" ValidationGroup="1" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNhapLai" runat="server" OnClick="btnNhapLai_Click" Text="Nhập lại" />
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnHuyBo" runat="server" OnClick="btnHuyBo_Click" PostBackUrl="~/admin/QuanLySach.aspx" Text="Hủy bỏ" />
    <br />
    <asp:SqlDataSource ID="sqlDsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [Sach] WHERE [maSach] = @maSach" InsertCommand="INSERT INTO [Sach] ([tenSach], [soLuong], [tacGia], [nhaXuatBan], [giaBia], [giaBan], [anhBia], [nhaPhatHanh], [kichThuoc], [soTrang], [ngayPhatHanh], [trongLuongVanChuyen], [moTa], [maDanhMuc]) VALUES (@tenSach, @soLuong, @tacGia, @nhaXuatBan, @giaBia, @giaBan, @anhBia, @nhaPhatHanh, @kichThuoc, @soTrang, @ngayPhatHanh, @trongLuongVanChuyen, @moTa, @maDanhMuc)" SelectCommand="SELECT * FROM [Sach]" UpdateCommand="UPDATE [Sach] SET [tenSach] = @tenSach, [soLuong] = @soLuong, [tacGia] = @tacGia, [nhaXuatBan] = @nhaXuatBan, [giaBia] = @giaBia, [giaBan] = @giaBan, [anhBia] = @anhBia, [nhaPhatHanh] = @nhaPhatHanh, [kichThuoc] = @kichThuoc, [soTrang] = @soTrang, [ngayPhatHanh] = @ngayPhatHanh, [trongLuongVanChuyen] = @trongLuongVanChuyen, [moTa] = @moTa, [maDanhMuc] = @maDanhMuc WHERE [maSach] = @maSach">
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
            <asp:Parameter Name="nhaPhatHanh" Type="String" />
            <asp:Parameter Name="kichThuoc" Type="String" />
            <asp:Parameter Name="soTrang" Type="Int32" />
            <asp:Parameter Name="ngayPhatHanh" Type="DateTime" />
            <asp:Parameter Name="trongLuongVanChuyen" Type="Int32" />
            <asp:Parameter Name="moTa" Type="String" />
            <asp:Parameter Name="maDanhMuc" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="tenSach" Type="String" />
            <asp:Parameter Name="soLuong" Type="Int32" />
            <asp:Parameter Name="tacGia" Type="String" />
            <asp:Parameter Name="nhaXuatBan" Type="String" />
            <asp:Parameter Name="giaBia" Type="Decimal" />
            <asp:Parameter Name="giaBan" Type="Decimal" />
            <asp:Parameter Name="anhBia" Type="String" />
            <asp:Parameter Name="nhaPhatHanh" Type="String" />
            <asp:Parameter Name="kichThuoc" Type="String" />
            <asp:Parameter Name="soTrang" Type="Int32" />
            <asp:Parameter Name="ngayPhatHanh" Type="DateTime" />
            <asp:Parameter Name="trongLuongVanChuyen" Type="Int32" />
            <asp:Parameter Name="moTa" Type="String" />
            <asp:Parameter Name="maDanhMuc" Type="Int32" />
            <asp:Parameter Name="maSach" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;&nbsp;&nbsp; 
</asp:Content>
