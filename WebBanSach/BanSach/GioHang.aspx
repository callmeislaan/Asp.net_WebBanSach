<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageClient.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="BanSach.GioHang" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Giỏ hàng</h2>
        <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" OnRowCommand="gvGioHang_RowCommand" OnSelectedIndexChanged="gvGioHang_SelectedIndexChanged" Width="741px">
            <Columns>
                <asp:BoundField DataField="maSach" HeaderText="Mã sách" />
                <asp:TemplateField HeaderText="Tên sách">
                    <ItemTemplate>
                        <asp:Label ID="lblTenSach" runat="server" Text='<%# Eval("tenSach") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="giaBan" HeaderText="Giá bán" DataFormatString="{0:n0}đ" />
                <asp:TemplateField HeaderText="Số lượng">
                    <ItemTemplate>
                        <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("soLuong") %>'></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="thanhTien" HeaderText="Thành tiền" DataFormatString="{0:n0}đ" />
                <asp:ButtonField ButtonType="Button" Text="Cập nhật" />
            </Columns>
            <EmptyDataTemplate>
                Không có hàng trong giỏ
            </EmptyDataTemplate>
        </asp:GridView>
    <asp:Label ID="lblTongTien" runat="server" style="font-weight: 700"></asp:Label>
    <br />
    <asp:Button ID="btnTiepTucMuaHang" runat="server" OnClick="btnTiepTucMuaHang_Click" Text="Tiếp tục mua hàng" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnXoaGioHang" runat="server" OnClick="btnXoaGioHang_Click" Text="Xóa giỏ hàng" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnThangToan" runat="server" Text="Thanh toán" OnClick="btnThangToan_Click" />
    <br />
</asp:Content>
