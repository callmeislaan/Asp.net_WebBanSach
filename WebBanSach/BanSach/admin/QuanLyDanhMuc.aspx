<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyDanhMuc.aspx.cs" Inherits="BanSach.admin.QuanLyDanhMuc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 103px;
        }
        .auto-style4 {
            width: 103px;
            height: 26px;
        }
        .auto-style5 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý danh mục</h2>
    <p>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="gvDanhMuc" runat="server" AutoGenerateColumns="False" DataKeyNames="maDanhMuc" DataSourceID="sqlDsDanhMuc" OnRowCommand="gvDanhMuc_RowCommand" OnRowCreated="gvDanhMuc_RowCreated" OnRowDeleted="gvDanhMuc_RowDeleted" OnRowUpdated="gvDanhMuc_RowUpdated" Width="484px">
            <Columns>
                <asp:BoundField DataField="maDanhMuc" HeaderText="Mã danh mục" ReadOnly="True" SortExpression="maDanhMuc" />
                <asp:BoundField DataField="tenDanhMuc" HeaderText="Tên danh mục" SortExpression="tenDanhMuc" />
                <asp:CommandField ButtonType="Button" CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
            </Columns>
        </asp:GridView>
    </p>
    <p><strong>Thêm danh mục mới:</strong></p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Tên danh mục</td>
            <td>
                <asp:TextBox ID="txtTenDanhMuc" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTenDanhMuc" runat="server" ControlToValidate="txtTenDanhMuc" ErrorMessage="Tên danh mục không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="btnThemDanhMuc" runat="server" OnClick="btnThemDanhMuc_Click" Text="Thêm danh mục" ValidationGroup="1" />
    </p>
    <p>
        <asp:SqlDataSource ID="sqlDsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DanhMuc]" DeleteCommand="DELETE FROM [DanhMuc] WHERE [maDanhMuc] = @maDanhMuc" InsertCommand="INSERT INTO [DanhMuc] ([tenDanhMuc]) VALUES (@tenDanhMuc)" UpdateCommand="UPDATE [DanhMuc] SET [tenDanhMuc] = @tenDanhMuc WHERE [maDanhMuc] = @maDanhMuc">
            <DeleteParameters>
                <asp:Parameter Name="maDanhMuc" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="tenDanhMuc" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="tenDanhMuc" Type="String" />
                <asp:Parameter Name="maDanhMuc" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </p>
</asp:Content>
