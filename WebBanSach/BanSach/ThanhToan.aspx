<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="ThanhToan.aspx.cs" Inherits="BanSach.ThanhToan" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Thông tin đặt hàng</h2>
    <table class="auto-style1" border="1">
        <tr>
            <td style="height: 23px; width: 306px;" ><strong>Địa chỉ giao hàng:<br />
                </strong><br />
                <table class="auto-style1">
                    <tr>
                        <td style="height: 26px; width: 118px">Tên người nhận:</td>
                        <td style="height: 26px; width: 172px;">
                            <asp:TextBox ID="txtTenNguoiNhan" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="reqTenNguoiNhan" runat="server" ControlToValidate="txtTenNguoiNhan" Display="Dynamic" ErrorMessage="Tên người nhận không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 118px; height: 33px;">Địa chỉ:</td>
                        <td style="height: 33px; width: 172px;">
                            <asp:TextBox ID="txtDiaChi" runat="server"></asp:TextBox>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:RequiredFieldValidator ID="reqDiaChi" runat="server" ControlToValidate="txtDiaChi" Display="Dynamic" ErrorMessage="Địa chỉ không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 118px; height: 26px;">Điện thoại:</td>
                        <td style="width: 172px; height: 26px;">
                            <asp:TextBox ID="txtDienThoai" runat="server"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="reqDienThoai" runat="server" ControlToValidate="txtDienThoai" Display="Dynamic" ErrorMessage="Số điện thoại không được trống" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="text-align: left; margin-left: 40px;" rowspan="2"><strong>Danh sách hàng đặt:<br />
                <br />
                    </strong>
                <table class="auto-style1">
                    <tr>
                        <td colspan="2">
                            <asp:GridView ID="gvHangDat" runat="server" Width="99%" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="maSach" HeaderText="Mã sách" />
                                    <asp:TemplateField HeaderText="Tên sách">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTenHang" runat="server" Text='<%# Eval("tenSach") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="giaBan" HeaderText="Giá bán" DataFormatString="{0:n0}" />
                                    <asp:BoundField DataField="soLuong" HeaderText="Số lượng" />
                                    <asp:BoundField DataField="thanhTien" HeaderText="Thành tiền" DataFormatString="{0:n0}" />
                                </Columns>
                            </asp:GridView>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 23px; width: 433px;"><strong>Phí vận chuyển: 20.000đ đối với mọi mặt hàng.</strong></td>
                        <td style="height: 23px; text-align: right;">
                            <table class="auto-style1">
                                <tr>
                                    <td style="width: 427px">Tổng tiền:</td>
                                    <td>
                <asp:Label ID="lblTongTien" runat="server" style="font-weight: 700; text-align: right"></asp:Label>
                                        <strong>đ</strong>&nbsp;&nbsp;&nbsp; </td>
                                </tr>
                                <tr>
                                    <td style="width: 427px">Phí vận chuyển</td>
                                    <td><strong>20000đ&nbsp;&nbsp;&nbsp; </strong></td>
                                </tr>
                                <tr>
                                    <td style="width: 427px">Thành tiền:</td>
                                    <td>
                            <asp:Label ID="lblThanhTien" runat="server" style="font-weight: 700"></asp:Label>
                                        <strong>đ&nbsp;&nbsp;&nbsp; </strong></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 433px; height: 23px;">
                            <asp:SqlDataSource ID="sqlDsDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [DonHang] WHERE [maDonHang] = @maDonHang" InsertCommand="INSERT INTO [DonHang] ([ngayBan], [maNguoiDung], [tenNguoiNhan], [diaChiGiaoHang], [soDT], [thanhTien]) VALUES (@ngayBan, @maNguoiDung, @tenNguoiNhan, @diaChiGiaoHang, @soDT, @thanhTien);SELECT @maDonHang = SCOPE_IDENTITY()" SelectCommand="SELECT * FROM [DonHang]" UpdateCommand="UPDATE [DonHang] SET [ngayBan] = @ngayBan, [maNguoiDung] = @maNguoiDung, [tenNguoiNhan] = @tenNguoiNhan, [diaChiGiaoHang] = @diaChiGiaoHang, [soDT] = @soDT, [thanhTien] = @thanhTien WHERE [maDonHang] = @maDonHang" OnInserted="sqlDsDonHang_Inserted">
                                <DeleteParameters>
                                    <asp:Parameter Name="maDonHang" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="ngayBan" Type="DateTime" />
                                    <asp:Parameter Name="maNguoiDung" Type="Int32" />
                                    <asp:Parameter Name="tenNguoiNhan" Type="String" />
                                    <asp:Parameter Name="diaChiGiaoHang" Type="String" />
                                    <asp:Parameter Name="soDT" Type="String" />
                                    <asp:Parameter Name="thanhTien" Type="Decimal" />
                                    <asp:Parameter Name="maDonHang" Direction="Output" Type="Int32" DefaultValue="0" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="ngayBan" Type="DateTime" />
                                    <asp:Parameter Name="maNguoiDung" Type="Int32" />
                                    <asp:Parameter Name="tenNguoiNhan" Type="String" />
                                    <asp:Parameter Name="diaChiGiaoHang" Type="String" />
                                    <asp:Parameter Name="soDT" Type="String" />
                                    <asp:Parameter Name="thanhTien" Type="Decimal" />
                                    <asp:Parameter Name="maDonHang" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <asp:SqlDataSource ID="sqlDsChiTietDonHang" runat="server" ConnectionString="<%$ ConnectionStrings:BanSachConnectionString %>" DeleteCommand="DELETE FROM [ChiTietDonHang] WHERE [maChiTiet] = @maChiTiet" InsertCommand="INSERT INTO [ChiTietDonHang] ([maSach], [soLuong], [phuongThucThanhToan], [maDonHang]) VALUES (@maSach, @soLuong, @phuongThucThanhToan, @maDonHang)" SelectCommand="SELECT * FROM [ChiTietDonHang]" UpdateCommand="UPDATE [ChiTietDonHang] SET [maSach] = @maSach, [soLuong] = @soLuong, [phuongThucThanhToan] = @phuongThucThanhToan, [maDonHang] = @maDonHang WHERE [maChiTiet] = @maChiTiet">
                                <DeleteParameters>
                                    <asp:Parameter Name="maChiTiet" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="maSach" Type="Int32" />
                                    <asp:Parameter Name="soLuong" Type="Int32" />
                                    <asp:Parameter Name="phuongThucThanhToan" Type="String" />
                                    <asp:Parameter Name="maDonHang" Type="Int32" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="maSach" Type="Int32" />
                                    <asp:Parameter Name="soLuong" Type="Int32" />
                                    <asp:Parameter Name="phuongThucThanhToan" Type="String" />
                                    <asp:Parameter Name="maDonHang" Type="Int32" />
                                    <asp:Parameter Name="maChiTiet" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td style="height: 23px; text-align: right">
                <asp:Button ID="btnDatMua" runat="server" Text="Đặt mua" OnClick="btnDatMua_Click" ValidationGroup="1" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="width: 306px"><strong>Thông tin thanh toán:<br />
&nbsp;<br />
                <asp:CheckBox ID="ckbTrucTiep" runat="server" OnCheckedChanged="ckbTrucTiep_CheckedChanged" Checked="True" />
&nbsp;Thanh toán khi nhận hàng<table class="auto-style1">
                    <tr>
                        <td style="height: 26px; width: 108px">Ngân hàng:</td>
                        <td style="height: 26px">
                            <asp:DropDownList ID="ddlNganHang" runat="server">
                                <asp:ListItem Value="ArmyBank">ArmyBank</asp:ListItem>
                                <asp:ListItem>AgriBank</asp:ListItem>
                                <asp:ListItem>SacomBank</asp:ListItem>
                                <asp:ListItem>ViettinBank</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 108px">Mã thẻ:</td>
                        <td>
                            <asp:TextBox ID="txtMaThe" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="lblThongBao" runat="server"></asp:Label>
</asp:Content>
