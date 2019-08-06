<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="ThongTinKhachHang.aspx.cs" Inherits="BanSach.ThongTinKhachHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thông tin khách hàng</h2>
    <p>
        <asp:SqlDataSource ID="sqlDsKhachHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [NguoiDung] WHERE [maNguoiDung] = @maNguoiDung" InsertCommand="INSERT INTO [NguoiDung] ([hoTen], [gioiTinh], [email], [soDT], [diaChi], [matKhau]) VALUES (@hoTen, @gioiTinh, @email, @soDT, @diaChi, @matKhau)" SelectCommand="SELECT [maNguoiDung], [hoTen], [gioiTinh], [email], [soDT], [diaChi], [matKhau] FROM [NguoiDung] WHERE ([maNguoiDung] = @maNguoiDung)" UpdateCommand="UPDATE [NguoiDung] SET [hoTen] = @hoTen, [gioiTinh] = @gioiTinh, [email] = @email, [soDT] = @soDT, [diaChi] = @diaChi, [matKhau] = @matKhau WHERE [maNguoiDung] = @maNguoiDung">
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
            </InsertParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="maNguoiDung" QueryStringField="maNguoiDung" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="hoTen" Type="String" />
                <asp:Parameter Name="gioiTinh" Type="Boolean" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="soDT" Type="String" />
                <asp:Parameter Name="diaChi" Type="String" />
                <asp:Parameter Name="matKhau" Type="String" />
                <asp:Parameter Name="maNguoiDung" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="maNguoiDung" DataSourceID="sqlDsKhachHang" Width="379px">
            <EditItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td>Mã người dùng</td>
                        <td>
                            <asp:Label ID="maNguoiDungLabel" runat="server" Text='<%# Eval("maNguoiDung") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Họ tên</td>
                        <td>
                            <asp:TextBox ID="hoTenTextBox" runat="server" Text='<%# Bind("hoTen") %>' />
                            <asp:RequiredFieldValidator ID="reqHoTen" runat="server" ControlToValidate="hoTenTextBox" Display="Dynamic" ErrorMessage="Họ tên không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Giới tính</td>
                        <td>
                            <asp:CheckBox ID="gioiTinhCheckBox" runat="server" Checked='<%# Bind("gioiTinh") %>' />
                            Nam</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                            <asp:RequiredFieldValidator ID="reqEmail" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Email không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regEmail" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Email không hợp lệ" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td>
                            <asp:TextBox ID="soDTTextBox" runat="server" Text='<%# Bind("soDT") %>' />
                            <asp:RequiredFieldValidator ID="reqSoDT" runat="server" ControlToValidate="soDTTextBox" Display="Dynamic" EnableTheming="False" ErrorMessage="Số điện thoại không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regSoDT" runat="server" ControlToValidate="soDTTextBox" Display="Dynamic" ErrorMessage="Số ĐT không hợp lệ" ForeColor="Red" ValidationExpression="\d{10}" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td>
                            <asp:TextBox ID="diaChiTextBox" runat="server" Text='<%# Bind("diaChi") %>' />
                            <asp:RequiredFieldValidator ID="reqDiaChi" runat="server" ControlToValidate="diaChiTextBox" Display="Dynamic" EnableTheming="False" ErrorMessage="Địa chỉ không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Mật khẩu</td>
                        <td>
                            <asp:TextBox ID="matKhauTextBox" runat="server" Text='<%# Bind("matKhau") %>' TextMode="Password"/>
                            <asp:RegularExpressionValidator ID="regMatKhau0" runat="server" ControlToValidate="matKhauTextBox" Display="Dynamic" ErrorMessage="Mật khẩu phải chứa từ 3 đến 20 ký tự" ForeColor="Red" ValidationExpression="\w{3,20}" ValidationGroup="1"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regMatKhau" runat="server" ControlToValidate="matKhauTextBox" Display="Dynamic" ErrorMessage="Mật khẩu cần chứa ít nhất 1 số, 1 chữ và bắt đầu bằng 1 chữ" ForeColor="Red" ValidationExpression="[a-zA-Z]+\w*\d+\w*" ValidationGroup="1"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Lặp lại mật khẩu</td>
                        <td>
                            <asp:TextBox ID="matKhauTextBox0" runat="server" Text='<%# Bind("matKhau") %>' TextMode="Password" />
                            <asp:RequiredFieldValidator ID="reqLapLaiMatKhau" runat="server" ControlToValidate="matKhauTextBox0" Display="Dynamic" ErrorMessage="Lặp lại mật khẩu không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cmpLapLaiMK" runat="server" ControlToCompare="matKhauTextBox" ControlToValidate="matKhauTextBox0" Display="Dynamic" ErrorMessage="Mật khẩu không khớp" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật" ValidationGroup="1" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy bỏ" />
            </EditItemTemplate>
            <InsertItemTemplate>
                hoTen:
                <asp:TextBox ID="hoTenTextBox" runat="server" Text='<%# Bind("hoTen") %>' />
                <br />
                gioiTinh:
                <asp:CheckBox ID="gioiTinhCheckBox" runat="server" Checked='<%# Bind("gioiTinh") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                soDT:
                <asp:TextBox ID="soDTTextBox" runat="server" Text='<%# Bind("soDT") %>' />
                <br />
                diaChi:
                <asp:TextBox ID="diaChiTextBox" runat="server" Text='<%# Bind("diaChi") %>' />
                <br />
                matKhau:
                <asp:TextBox ID="matKhauTextBox" runat="server" Text='<%# Bind("matKhau") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td>Mã người dùng</td>
                        <td>
                            <asp:Label ID="maNguoiDungLabel" runat="server" Text='<%# Eval("maNguoiDung") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Họ tên</td>
                        <td>
                            <asp:Label ID="hoTenLabel" runat="server" Text='<%# Bind("hoTen") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Giới tính</td>
                        <td>
                            <asp:CheckBox ID="gioiTinhCheckBox" runat="server" Checked='<%# Bind("gioiTinh") %>' Enabled="false" />
                            Nam</td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Số điện thoại</td>
                        <td>
                            <asp:Label ID="soDTLabel" runat="server" Text='<%# Bind("soDT") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td>Địa chỉ</td>
                        <td>
                            <asp:Label ID="diaChiLabel" runat="server" Text='<%# Bind("diaChi") %>' />
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Sửa" />
            </ItemTemplate>
        </asp:FormView>
    </p>
    <p>
        <asp:LinkButton ID="lbtnDangXuat" runat="server" OnClick="lbtnDangXuat_Click">Đăng xuất</asp:LinkButton>
    </p>
</asp:Content>
