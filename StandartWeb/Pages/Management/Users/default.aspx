<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="StandartWeb.Pages.Management.Users._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Üye Listesi
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContentRight" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="LinqDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:TemplateField HeaderText="Üye Adı">
                <ItemTemplate>
                    <asp:HiddenField ID="hfUserID" runat="server" Value='<%# Eval("UserID") %>' />
                    <asp:Literal runat="server" Text='<%# Eval("aspnet_User.UserName") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="E-Posta">
                <ItemTemplate>
                    <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("aspnet_User.aspnet_Membership.Email") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="FirstName" HeaderText="Ad" SortExpression="FirstName" />
            <asp:BoundField DataField="LastName" HeaderText="Soyad" SortExpression="LastName" />
            <asp:TemplateField HeaderText="Cinsiyet" SortExpression="Gender">
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Gender").ToString() == "0" ? "Kadın" : "Erkek" %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BirthDate" HeaderText="Doğum Tarihi" SortExpression="BirthDate" />
        </Columns>
    </asp:GridView>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="StandartWeb.DataLayer.StandartWebDataContext"
        TableName="TUserProfiles" Select="new (UserID, FirstName, LastName, Gender, BirthDate, aspnet_User)">
    </asp:LinqDataSource>
</asp:Content>
