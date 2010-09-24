<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="UserRoles.aspx.cs" Inherits="StandartWeb.Pages.Management.Users.UserRoles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Üyelerin Rolleri
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContentRight" runat="server">
    Üye :
    <asp:DropDownList ID="ddl" runat="server" AutoPostBack="True" 
        DataSourceID="LinqDataSource1" DataTextField="UserName" 
        DataValueField="UserName" onselectedindexchanged="ddl_SelectedIndexChanged" />
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" 
        ContextTypeName="StandartWeb.DataLayer.StandartWebDataContext" 
        OrderBy="UserName" Select="new (UserId, UserName)" TableName="aspnet_Users">
    </asp:LinqDataSource>
    <br />
    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
        DataSourceID="ObjectDataSource2" DataTextField="RoleName" 
        DataValueField="RoleName" 
        onselectedindexchanged="CheckBoxList1_SelectedIndexChanged">
    </asp:CheckBoxList>
    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="GetRoles" 
        TypeName="StandartWeb.DataLayer.RoleDataManager"></asp:ObjectDataSource>
</asp:Content>
