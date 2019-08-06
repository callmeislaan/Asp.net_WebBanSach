<%@ Page Title="" Language="C#" MasterPageFile="~/admin/MasterPageAdmin.Master" AutoEventWireup="true" CodeBehind="SuaSach.aspx.cs" Inherits="BanSach.admin.SuaSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style4 {
            width: 157px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Sửa sách</h2>
    <p>
        <asp:Label ID="lblThongBao" runat="server" ForeColor="Red"></asp:Label>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="maSach" DataSourceID="sqlDsSach" DefaultMode="Edit" OnItemCommand="FormView1_ItemCommand" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated" Width="496px">
            <EditItemTemplate>
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style4">Mã sách</td>
                        <td>
                            <asp:Label ID="maSachLabel1" runat="server" Text='<%# Eval("maSach") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Tên sách</td>
                        <td>
                            <asp:TextBox ID="tenSachTextBox" runat="server" Text='<%# Bind("tenSach") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Số lượng</td>
                        <td>
                            <asp:TextBox ID="soLuongTextBox" runat="server" Text='<%# Bind("soLuong") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Tác giả</td>
                        <td>
                            <asp:TextBox ID="tacGiaTextBox" runat="server" Text='<%# Bind("tacGia") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Nhà xuất bản</td>
                        <td>
                            <asp:TextBox ID="nhaXuatBanTextBox" runat="server" Text='<%# Bind("nhaXuatBan") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Giá bìa</td>
                        <td>
                            <asp:TextBox ID="giaBiaTextBox" runat="server" Text='<%# Bind("giaBia") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Giá bán</td>
                        <td>
                            <asp:TextBox ID="giaBanTextBox" runat="server" Text='<%# Bind("giaBan") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Ảnh bìa</td>
                        <td>
                            <asp:TextBox ID="anhBiaTextBox" runat="server" Text='<%# Bind("anhBia") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Nhà Phát hành</td>
                        <td>
                            <asp:TextBox ID="nhaPhatHanhTextBox" runat="server" Text='<%# Bind("nhaPhatHanh") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Kích thước</td>
                        <td>
                            <asp:TextBox ID="kichThuocTextBox" runat="server" Text='<%# Bind("kichThuoc") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Số trang</td>
                        <td>
                            <asp:TextBox ID="soTrangTextBox" runat="server" Text='<%# Bind("soTrang") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Ngày phát hành</td>
                        <td>
                            <asp:TextBox ID="ngayPhatHanhTextBox" runat="server" Height="16px" Text='<%# Bind("ngayPhatHanh") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Trọng lượng vận chuyển</td>
                        <td>
                            <asp:TextBox ID="trongLuongVanChuyenTextBox" runat="server" Text='<%# Bind("trongLuongVanChuyen") %>' />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Tên danh mục</td>
                        <td>
                            <asp:DropDownList ID="ddlMaDanhMuc" runat="server" DataSourceID="sqlDsDanhMuc" DataTextField="tenDanhMuc" DataValueField="maDanhMuc" SelectedValue='<%# Bind("maDanhMuc") %>'>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlDsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [DanhMuc]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">Mô tả</td>
                        <td>
                            <asp:TextBox ID="moTaTextBox" runat="server" Height="83px" Text='<%# Bind("moTa") %>' TextMode="MultiLine" Width="100%" />
                        </td>
                    </tr>
                </table>
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Cập nhật" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Hủy bỏ" PostBackUrl="~/admin/QuanLySach.aspx" />
            </EditItemTemplate>
            <InsertItemTemplate>
                tenSach:
                <asp:TextBox ID="tenSachTextBox" runat="server" Text='<%# Bind("tenSach") %>' />
                <br />
                soLuong:
                <asp:TextBox ID="soLuongTextBox" runat="server" Text='<%# Bind("soLuong") %>' />
                <br />
                tacGia:
                <asp:TextBox ID="tacGiaTextBox" runat="server" Text='<%# Bind("tacGia") %>' />
                <br />
                nhaXuatBan:
                <asp:TextBox ID="nhaXuatBanTextBox" runat="server" Text='<%# Bind("nhaXuatBan") %>' />
                <br />
                giaBia:
                <asp:TextBox ID="giaBiaTextBox" runat="server" Text='<%# Bind("giaBia") %>' />
                <br />
                giaBan:
                <asp:TextBox ID="giaBanTextBox" runat="server" Text='<%# Bind("giaBan") %>' />
                <br />
                anhBia:
                <asp:TextBox ID="anhBiaTextBox" runat="server" Text='<%# Bind("anhBia") %>' />
                <br />
                nhaPhatHanh:
                <asp:TextBox ID="nhaPhatHanhTextBox" runat="server" Text='<%# Bind("nhaPhatHanh") %>' />
                <br />
                kichThuoc:
                <asp:TextBox ID="kichThuocTextBox" runat="server" Text='<%# Bind("kichThuoc") %>' />
                <br />
                soTrang:
                <asp:TextBox ID="soTrangTextBox" runat="server" Text='<%# Bind("soTrang") %>' />
                <br />
                ngayPhatHanh:
                <asp:TextBox ID="ngayPhatHanhTextBox" runat="server" Text='<%# Bind("ngayPhatHanh") %>' />
                <br />
                trongLuongVanChuyen:
                <asp:TextBox ID="trongLuongVanChuyenTextBox" runat="server" Text='<%# Bind("trongLuongVanChuyen") %>' />
                <br />
                moTa:
                <asp:TextBox ID="moTaTextBox" runat="server" Text='<%# Bind("moTa") %>' />
                <br />
                maDanhMuc:
                <asp:TextBox ID="maDanhMucTextBox" runat="server" Text='<%# Bind("maDanhMuc") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                maSach:
                <asp:Label ID="maSachLabel" runat="server" Text='<%# Eval("maSach") %>' />
                <br />
                tenSach:
                <asp:Label ID="tenSachLabel" runat="server" Text='<%# Bind("tenSach") %>' />
                <br />
                soLuong:
                <asp:Label ID="soLuongLabel" runat="server" Text='<%# Bind("soLuong") %>' />
                <br />
                tacGia:
                <asp:Label ID="tacGiaLabel" runat="server" Text='<%# Bind("tacGia") %>' />
                <br />
                nhaXuatBan:
                <asp:Label ID="nhaXuatBanLabel" runat="server" Text='<%# Bind("nhaXuatBan") %>' />
                <br />
                giaBia:
                <asp:Label ID="giaBiaLabel" runat="server" Text='<%# Bind("giaBia") %>' />
                <br />
                giaBan:
                <asp:Label ID="giaBanLabel" runat="server" Text='<%# Bind("giaBan") %>' />
                <br />
                anhBia:
                <asp:Label ID="anhBiaLabel" runat="server" Text='<%# Bind("anhBia") %>' />
                <br />
                nhaPhatHanh:
                <asp:Label ID="nhaPhatHanhLabel" runat="server" Text='<%# Bind("nhaPhatHanh") %>' />
                <br />
                kichThuoc:
                <asp:Label ID="kichThuocLabel" runat="server" Text='<%# Bind("kichThuoc") %>' />
                <br />
                soTrang:
                <asp:Label ID="soTrangLabel" runat="server" Text='<%# Bind("soTrang") %>' />
                <br />
                ngayPhatHanh:
                <asp:Label ID="ngayPhatHanhLabel" runat="server" Text='<%# Bind("ngayPhatHanh") %>' />
                <br />
                trongLuongVanChuyen:
                <asp:Label ID="trongLuongVanChuyenLabel" runat="server" Text='<%# Bind("trongLuongVanChuyen") %>' />
                <br />
                moTa:
                <asp:Label ID="moTaLabel" runat="server" Text='<%# Bind("moTa") %>' />
                <br />
                maDanhMuc:
                <asp:Label ID="maDanhMucLabel" runat="server" Text='<%# Bind("maDanhMuc") %>' />
                <br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="sqlDsSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [Sach] WHERE [maSach] = @maSach" InsertCommand="INSERT INTO [Sach] ([tenSach], [soLuong], [tacGia], [nhaXuatBan], [giaBia], [giaBan], [anhBia], [nhaPhatHanh], [kichThuoc], [soTrang], [ngayPhatHanh], [trongLuongVanChuyen], [moTa], [maDanhMuc]) VALUES (@tenSach, @soLuong, @tacGia, @nhaXuatBan, @giaBia, @giaBan, @anhBia, @nhaPhatHanh, @kichThuoc, @soTrang, @ngayPhatHanh, @trongLuongVanChuyen, @moTa, @maDanhMuc)" SelectCommand="SELECT * FROM [Sach] WHERE ([maSach] = @maSach)" UpdateCommand="UPDATE [Sach] SET [tenSach] = @tenSach, [soLuong] = @soLuong, [tacGia] = @tacGia, [nhaXuatBan] = @nhaXuatBan, [giaBia] = @giaBia, [giaBan] = @giaBan, [anhBia] = @anhBia, [nhaPhatHanh] = @nhaPhatHanh, [kichThuoc] = @kichThuoc, [soTrang] = @soTrang, [ngayPhatHanh] = @ngayPhatHanh, [trongLuongVanChuyen] = @trongLuongVanChuyen, [moTa] = @moTa, [maDanhMuc] = @maDanhMuc WHERE [maSach] = @maSach">
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
            <SelectParameters>
                <asp:QueryStringParameter Name="maSach" QueryStringField="maSach" Type="Int32" />
            </SelectParameters>
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
    </p>
</asp:Content>
