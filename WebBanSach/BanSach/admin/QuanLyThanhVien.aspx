<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="QuanLyThanhVien.aspx.cs" Inherits="BanSach.admin.QuanLyThanhVien" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            width: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Quản lý thành viên</h2>
    <p style="font-weight: 700">
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="maNguoiDung" DataSourceID="sqlDsThanhVien" PageSize="5" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated" OnRowDeleted="GridView1_RowDeleted" OnRowUpdated="GridView1_RowUpdated">
            <Columns>
                <asp:BoundField DataField="maNguoiDung" HeaderText="Mã người dùng" InsertVisible="False" ReadOnly="True" SortExpression="maNguoiDung" />
                <asp:BoundField DataField="hoTen" HeaderText="Họ tên" SortExpression="hoTen" />
                <asp:CheckBoxField DataField="gioiTinh" HeaderText="Giới tính(Nam)" SortExpression="gioiTinh" />
                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                <asp:BoundField DataField="soDT" HeaderText="Số điện thoại" SortExpression="soDT" />
                <asp:BoundField DataField="diaChi" HeaderText="Địa chỉ" SortExpression="diaChi" />
                <asp:BoundField DataField="matKhau" HeaderText="Mật khẩu" SortExpression="matKhau" />
                <asp:BoundField DataField="quyenHan" HeaderText="Quyền hạn" SortExpression="quyenHan" />
                <asp:CommandField ButtonType="Button" CancelText="Hủy bỏ" DeleteText="Xóa" EditText="Sửa" ShowDeleteButton="True" ShowEditButton="True" UpdateText="Cập nhật" />
            </Columns>
        </asp:GridView>
    </p>
    <p><strong>Thêm người dùng mới:</strong></p>
    <table class="auto-style1">
        <tr>
            <td class="auto-style3">Họ tên</td>
            <td>
                <asp:TextBox ID="txtHoTen" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqHoTen" runat="server" ControlToValidate="txtHoTen" ErrorMessage="Họ tên không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Giới tính</td>
            <td>
                <asp:DropDownList ID="ddlGioiTinh" runat="server">
                    <asp:ListItem Value="True">Nam</asp:ListItem>
                    <asp:ListItem Value="False">Nữ</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Email</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Số điên thoại</td>
            <td>
                <asp:TextBox ID="txtSoDienThoai" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqSoDT" runat="server" ControlToValidate="txtSoDienThoai" ErrorMessage="Số điện thoại không được trống" ForeColor="Red" Display="Dynamic" EnableTheming="False" ValidationGroup="1"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regSoDT" runat="server" ControlToValidate="txtSoDienThoai" Display="Dynamic" ErrorMessage="Số ĐT không hợp lệ" ForeColor="Red" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Địa chỉ</td>
            <td>
                <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqDiaChi" runat="server" ControlToValidate="txtDiaChi" ErrorMessage="Địa chỉ không được trống" ForeColor="Red" Display="Dynamic" EnableTheming="False" ValidationGroup="1"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Mật khẩu</td>
            <td>
                <asp:TextBox ID="txtMatKhau" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="regMatKhau0" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu phải chứa từ 3 đến 20 ký tự" ForeColor="Red" ValidationExpression="\w{3,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
                <asp:RegularExpressionValidator ID="regMatKhau" runat="server" ControlToValidate="txtMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu cần chứa ít nhất 1 số, 1 chữ và bắt đầu bằng 1 chữ" ForeColor="Red" ValidationExpression="[a-zA-Z]+\w*\d+\w*" ValidationGroup="1"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Lặp lại mật khẩu</td>
            <td>
                <asp:TextBox ID="txtLapLaiMatKhau" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="reqLapLaiMatKhau" runat="server" ControlToValidate="txtLapLaiMatKhau" ErrorMessage="Lặp lại mật khẩu không được trống" ForeColor="Red" Display="Dynamic" ValidationGroup="1"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cmpLapLaiMK" runat="server" ControlToCompare="txtMatKhau" ControlToValidate="txtLapLaiMatKhau" Display="Dynamic" ErrorMessage="Mật khẩu không khớp" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">Quyền hạn</td>
            <td>
                <asp:DropDownList ID="ddlQuyenHan" runat="server">
                    <asp:ListItem Value="kh">Khách hàng</asp:ListItem>
                    <asp:ListItem Value="admin">Admin</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnThem" runat="server" OnClick="btnThem_Click" Text="Thêm" ValidationGroup="1" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnNhapLai" runat="server" OnClick="btnNhapLai_Click" Text="Nhập lại" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnHuyBo" runat="server" OnClick="btnHuyBo_Click" PostBackUrl="~/admin/QuanLyThanhVien.aspx" Text="Hủy bỏ" />
&nbsp;<p>
        <asp:SqlDataSource ID="sqlDsThanhVien" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [NguoiDung] WHERE [maNguoiDung] = @maNguoiDung" InsertCommand="INSERT INTO [NguoiDung] ([hoTen], [gioiTinh], [email], [soDT], [diaChi], [matKhau], [quyenHan]) VALUES (@hoTen, @gioiTinh, @email, @soDT, @diaChi, @matKhau, @quyenHan)" SelectCommand="SELECT * FROM [NguoiDung]" UpdateCommand="UPDATE [NguoiDung] SET [hoTen] = @hoTen, [gioiTinh] = @gioiTinh, [email] = @email, [soDT] = @soDT, [diaChi] = @diaChi, [matKhau] = @matKhau, [quyenHan] = @quyenHan WHERE [maNguoiDung] = @maNguoiDung">
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
    </p>
</asp:Content>
<%--  --%>