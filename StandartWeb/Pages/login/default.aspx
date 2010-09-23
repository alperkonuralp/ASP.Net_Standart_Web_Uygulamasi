<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Resources/MasterPages/Site.Master"
    CodeBehind="default.aspx.cs" Inherits="StandartWeb.Pages.login._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphContentRight" runat="server">
    <asp:Login ID="Login1" runat="server" VisibleWhenLoggedIn="False" CreateUserText="Üye Ol"
        FailureText="Giriş yapamadınız. Lütfen tekrar deneyiniz." LoginButtonText="Giriş Yap"
        PasswordLabelText="Şifre : " PasswordRecoveryText="Şifremi Unuttum" PasswordRequiredErrorMessage="Lütfen şifrenizi giriniz."
        RememberMeText="Beni Hatırla." TitleText="Üye Girişi" UserNameLabelText="Üye Adı:"
        UserNameRequiredErrorMessage="Lütfen üye adınızı giriniz." 
    CreateUserUrl="~/Pages/login/register.aspx" 
        PasswordRecoveryUrl="~/Pages/login/Recovery.aspx">
    </asp:Login>
</asp:Content>
