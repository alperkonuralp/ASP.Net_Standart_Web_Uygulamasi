<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="StandartWeb.Pages.Management.Users.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Detaylar
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContentRight" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="UserID" DataSourceID="LinqDataSource1">
        <Fields>
            <asp:BoundField DataField="UserID" HeaderText="UserID" ReadOnly="True" 
                SortExpression="UserID" Visible="False" />
            <asp:BoundField DataField="FirstName" HeaderText="Adı" 
                SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Soyadı" 
                SortExpression="LastName" />
            <asp:TemplateField HeaderText="Cinsiyet" SortExpression="Gender">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("Gender").Equals((byte)0) ? "Kadın" : "Erkek" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BirthDate" DataFormatString="{0:D}" 
                HeaderText="Doğum Tarihi" SortExpression="BirthDate" />
            <asp:TemplateField HeaderText="Üye Adı">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" 
                        Text='<%# Eval("aspnet_User.UserName") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Son İşlem Zamanı">
                <ItemTemplate>
                    <asp:Literal ID="Literal2" runat="server" 
                        Text='<%# Eval("aspnet_User.LastActivityDate") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-Posta Adresi">
                <ItemTemplate>
                    <asp:Literal ID="Literal3" runat="server" 
                        Text='<%# Eval("aspnet_User.aspnet_Membership.Email") %>'></asp:Literal>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="StandartWeb.DataLayer.StandartWebDataContext" 
        TableName="TUserProfiles" Where="UserID == @UserID">
        <WhereParameters>
            <asp:QueryStringParameter DbType="Guid" Name="UserID" QueryStringField="uid" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
