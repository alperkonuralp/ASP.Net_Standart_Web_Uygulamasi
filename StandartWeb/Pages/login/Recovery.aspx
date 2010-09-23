<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="Recovery.aspx.cs" Inherits="StandartWeb.Pages.login.Recovery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Şifremi Unuttum
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContentRight" runat="server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" 
        AnswerLabelText="Gizli Cevap:" onsendingmail="PasswordRecovery1_SendingMail" 
        QuestionInstructionText="Şifrenizi alabilmek için aşağıdaki soruyu cevaplayınız." 
        QuestionLabelText="Gizli Soru:" QuestionTitleText="Bilgi Doğrulama" 
        SubmitButtonText="Gönder" 
        SuccessText="Şifreniz email adresinize gönderilmiştir." 
        UserNameInstructionText="Şifresini almak istediğiniz üye adını giriniz." 
        UserNameLabelText="Üye Adı:" UserNameTitleText="Şifremi Unuttum">
        <MailDefinition IsBodyHtml="True">
        </MailDefinition>
    </asp:PasswordRecovery>
</asp:Content>
