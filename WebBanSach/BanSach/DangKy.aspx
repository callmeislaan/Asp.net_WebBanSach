<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="DangKy.aspx.cs" Inherits="BanSach.DangKy" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Đăng ký</h2>
    <table class="auto-style1">
        <tr>
            <td class="auto-style9" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Họ tên</td>
            <td class="auto-style10">
                <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqHoTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Họ tên không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Giới tính</td>
            <td>
                <asp:DropDownList ID="ddlGioiTinh" runat="server" OnSelectedIndexChanged="ddlGioiTinh_SelectedIndexChanged">
                    <asp:ListItem Value="True">Nam</asp:ListItem>
                    <asp:ListItem Value="False">Nữ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style6" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Email</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Số điện thoại</td>
            <td>
                <asp:TextBox ID="txtSoDT" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSoDT" runat="server" ControlToValidate="txtSoDT" ErrorMessage="Số điện thoại không được trống" ForeColor="Red" Display="Dynamic" EnableTheming="False" ValidationGroup="1"></asp:RequiredFieldValidator>
            &nbsp;<asp:RegularExpressionValidator ID="regSoDT" runat="server" ControlToValidate="txtSoDT" Display="Dynamic" ErrorMessage="Số ĐT không hợp lệ" ForeColor="Red" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Địa chỉ</td>
            <td>
                <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqDiaChi" runat="server" ControlToValidate="txtDiaChi" ErrorMessage="Địa chỉ không được trống" ForeColor="Red" Display="Dynamic" EnableTheming="False" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Mật khẩu</td>
            <td>
                <asp:TextBox ID="txtMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regMatKhau0" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu phải chứa từ 3 đến 20 ký tự" ForeColor="Red" ValidationExpression="\w{3,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
&nbsp;<asp:RegularExpressionValidator ID="regMatKhau" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu cần chứa ít nhất 1 số, 1 chữ và bắt đầu bằng 1 chữ" ForeColor="Red" ValidationExpression="[a-zA-Z]+\w*\d+\w*" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5" style="font-family: 'Times New Roman', Times, serif; width: 112px;">Lặp lại mật khẩu</td>
            <td>
                <asp:TextBox ID="txtLapLaiMatKhau" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqLapLaiMatKhau" runat="server" ControlToValidate="txtLapLaiMatKhau" ErrorMessage="Lặp lại mật khẩu không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="cmpLapLaiMK" runat="server" ControlToCompare="txtMatKhau" ControlToValidate="txtLapLaiMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu không khớp" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7" style="font-family: 'Times New Roman', Times, serif; width: 112px;">
                <asp:Button ID="btnDangKy" runat="server" Text="Đăng ký" OnClick="btnDangKy_Click" ValidationGroup="1" />
            </td>
            <td class="auto-style8">
                <asp:SqlDataSource ID="sqlDsDangKy" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [NguoiDung] WHERE [maNguoiDung] = @maNguoiDung" InsertCommand="INSERT INTO [NguoiDung] ([hoTen], [gioiTinh], [email], [soDT], [diaChi], [matKhau], [quyenHan]) VALUES (@hoTen, @gioiTinh, @email, @soDT, @diaChi, @matKhau, @quyenHan)" SelectCommand="SELECT * FROM [NguoiDung]" UpdateCommand="UPDATE [NguoiDung] SET [hoTen] = @hoTen, [gioiTinh] = @gioiTinh, [email] = @email, [soDT] = @soDT, [diaChi] = @diaChi, [matKhau] = @matKhau, [quyenHan] = @quyenHan WHERE [maNguoiDung] = @maNguoiDung">
                    <DeleteParameters>
                        <asp:Parameter Name="maNguoiDung" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="hoTen" Type="String" />
                        <asp:Parameter Name="gioiTinh" Type="Boolean" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="soDT" Type="String" />
                        <asp:Parameter Name="diaChi" Type="String" />
                        <asp:Parameter Name="matKhau" Type="String" />
                        <asp:Parameter Name="quyenHan" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="hoTen" Type="String" />
                        <asp:Parameter Name="gioiTinh" Type="Boolean" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="soDT" Type="String" />
                        <asp:Parameter Name="diaChi" Type="String" />
                        <asp:Parameter Name="matKhau" Type="String" />
                        <asp:Parameter Name="quyenHan" Type="String" />
                        <asp:Parameter Name="maNguoiDung" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
