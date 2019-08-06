<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="BanSach.DangNhap" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Đăng nhập</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style5" style="width: 111px">Email</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtTaiKhoan" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqTaiKhoan" runat="server" ControlToValidate="txtTaiKhoan" ErrorMessage="Tài khoản không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" style="width: 111px">Mật khẩu</td>
            <td>
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqMatKhau" runat="server" ControlToValidate="txtMatKhau" ErrorMessage="Mật khẩu không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="width: 111px">
                <asp:Button ID="btnDangNhap" runat="server" Text="Đăng nhập" OnClick="btnDangNhap_Click" ValidationGroup="1" />
            </td>
            <td class="auto-style2"></td>
        </tr>
    </table>
    <asp:SqlDataSource ID="sqlDsDangNhap" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [NguoiDung] WHERE (([email] = @email) AND ([matKhau] = @matKhau))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTaiKhoan" Name="email" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtMatKhau" Name="matKhau" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    <br />
</asp:Content>
