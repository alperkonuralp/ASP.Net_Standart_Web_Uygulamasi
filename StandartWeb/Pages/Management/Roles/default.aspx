<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="StandartWeb.Pages.Management.Roles._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Roller
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="cphContentRight" ContentPlaceHolderID="cphContentRight" runat="server">
    <table border="0">
        <tr>
            <td valign="top" style="padding: 5px">
                <asp:GridView ID="gv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                    DataSourceID="ObjectDataSource1" CellPadding="4" DataKeyNames="RoleName" 
                    ForeColor="#333333" GridLines="None" onrowcommand="gv_RowCommand">
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="Button1" runat="server" 
                                    CommandArgument='<%# Eval("RoleName") %>' 
                                    onclientclick="return confirm(&quot;Bu bilgiyi silmek istediğinize emin misiniz?&quot;);" 
                                    oncommand="Button1_Command" Text="Sil" 
                                    Visible='<%# Karsilastir(Eval("RoleName")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:ButtonField ButtonType="Button" CommandName="Sil" Text="Sil" />
                        <asp:BoundField DataField="RoleName" HeaderText="Rol Adı" 
                            SortExpression="RoleName" />
                    </Columns>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#999999" />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                </asp:GridView>
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                    SelectMethod="GetRoles" TypeName="StandartWeb.DataLayer.RoleDataManager"></asp:ObjectDataSource>
            </td>
            <td valign="top" style="padding: 5px">
                <asp:Panel ID="pNewRole" runat="server" DefaultButton="bSave" GroupingText="Yeni Rol Eklemek">
                    Rol Adı :
                    <asp:TextBox ID="tbRoleName" runat="server" ValidationGroup="NewRole" />
                    <asp:RequiredFieldValidator ID="rfvRoleName" runat="server" ControlToValidate="tbRoleName"
                        Display="Dynamic" ErrorMessage="Lütfen Rolün ismini giriniz." ValidationGroup="NewRole" />
                    <br />
                    <asp:Button ID="bSave" runat="server" Text="Yeni Rol Ekle" ValidationGroup="NewRole"
                        OnClick="bSave_Click" />
                </asp:Panel>
            </td>
        </tr>
    </table>
</asp:Content>
