<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="ChiTietSach.aspx.cs" Inherits="BanSach.ChiTietSach" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Chi tiết sách</h2>
    <asp:FormView ID="fvChiTiet" runat="server" DataKeyNames="maSach" DataSourceID="sqlDsChiTietSach" OnPageIndexChanging="fvChiTiet_PageIndexChanging">
        <EditItemTemplate>
            maSach:
            <asp:Label ID="maSachLabel1" runat="server" Text='<%# Eval("maSach") %>' />
            <br />
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
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            maSach:
            <asp:TextBox ID="maSachTextBox" runat="server" Text='<%# Bind("maSach") %>' />
            <br />
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
            <table class="auto-style1">
                <tr>
                    <td style="width: 333px">&nbsp;</td>
                    <td>
                        <asp:Label ID="tenSachLabel" runat="server" style="font-weight: 700; font-size: large" Text='<%# Bind("tenSach") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" style="width: 333px">
                        <asp:Image ID="Image2" runat="server" Height="260px" ImageUrl='<%# Eval("anhBia", "/images/{0}") %>' Width="280px" />
                    </td>
                    <td>
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Mã sách:</b></td>
                                <td>
                                    <asp:Label ID="maSachLabel" runat="server" Text='<%# Eval("maSach") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Số lượng:</b></td>
                                <td>
                                    <asp:Label ID="soLuongLabel" runat="server" Text='<%# Bind("soLuong") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Tác giả:</b></td>
                                <td>
                                    <asp:Label ID="tacGiaLabel" runat="server" Text='<%# Bind("tacGia") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Nhà xuất bản:</b></td>
                                <td>
                                    <asp:Label ID="nhaXuatBanLabel" runat="server" Text='<%# Bind("nhaXuatBan") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="width: 140px"><b>Giá bìa:</b></td>
                                <td class="auto-style4">
                                    <asp:Label ID="giaBiaLabel" runat="server" Text='<%# Bind("giaBia", "{0:n0}") %>' />
                                    đ</td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="width: 140px"><b>Giá bán:</b></td>
                                <td class="auto-style4">
                                    <asp:Label ID="giaBanLabel" runat="server" Text='<%# Bind("giaBan", "{0:n0}") %>' />
                                    đ</td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="width: 140px"><b>Nhà phát hành:</b></td>
                                <td class="auto-style4">
                                    <asp:Label ID="nhaPhatHanhLabel" runat="server" Text='<%# Bind("nhaPhatHanh") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Kích thước:</b></td>
                                <td>
                                    <asp:Label ID="kichThuocLabel" runat="server" Text='<%# Bind("kichThuoc") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Số trang:</b></td>
                                <td>
                                    <asp:Label ID="soTrangLabel" runat="server" Text='<%# Bind("soTrang") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6" style="width: 140px"><b>Ngày phát hành:</b></td>
                                <td class="auto-style4">
                                    <asp:Label ID="ngayPhatHanhLabel" runat="server" Text='<%# Bind("ngayPhatHanh") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5" style="width: 140px"><b>Trọng lượng vận chuyển</b></td>
                                <td>
                                    <asp:Label ID="trongLuongVanChuyenLabel" runat="server" Text='<%# Bind("trongLuongVanChuyen") %>' />
                                    g</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <table class="auto-style1">
                <tr>
                    <td style="height: 23px"><strong>Mô tả: </strong>
                        <asp:Label ID="moTaLabel" runat="server" Font-Overline="False" Font-Size="13pt" Font-Strikeout="False" Text='<%# Bind("moTa") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnChoVaoGioHang" runat="server" OnClick="lbtnChoVaoGioHang_Click">Cho vào giỏ hàng</asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="lblDatMua" runat="server" OnClick="lbtnChoVaoGioHang_Click">Đặt mua</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlDsChiTietSach" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" SelectCommand="SELECT * FROM [Sach] WHERE ([maSach] = @maSach)">
        <SelectParameters>
            <asp:QueryStringParameter Name="maSach" QueryStringField="MaSach" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
