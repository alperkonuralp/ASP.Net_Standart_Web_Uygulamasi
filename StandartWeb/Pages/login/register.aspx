<%@ Page Title="" Language="C#" MasterPageFile="~/Resources/MasterPages/Site.Master"
    AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="StandartWeb.Pages.login.register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Üye Olmak
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHead" runat="server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContentRight" runat="server">
    <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" ActiveStepIndex="1" AnswerLabelText="Gizli Cevabınız:"
        CancelButtonText="Vazgeç" CompleteSuccessText="Hesabınız oluşturulmuştur." ConfirmPasswordLabelText="Şifre(Tekrar):"
        ContinueButtonText="İleri" CreateUserButtonText="Yeni Üye Kaydı" DuplicateUserNameErrorMessage="Lütfen farklı bir üye adı giriniz."
        EmailLabelText="E-Posta:" FinishCompleteButtonText="Bitir" FinishPreviousButtonText="Geri"
        PasswordLabelText="Şifre:" QuestionLabelText="Gizli Soru:" StartNextButtonText="İleri"
        StepNextButtonText="İleri" StepPreviousButtonText="Geri" UnknownErrorMessage="Kaydınız alınamamıştır. Lütfen tekrar deneyiniz."
        UserNameLabelText="Üye Adı:" OnCreatedUser="CreateUserWizard1_CreatedUser" OnFinishButtonClick="CreateUserWizard1_FinishButtonClick"
        OnActiveStepChanged="CreateUserWizard1_ActiveStepChanged">
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" Title="Yeni Üye Kaydı" />
            <asp:TemplatedWizardStep runat="server" Title="Profil Bilgileri">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td valign="Middle" align="right">
                                Ad
                            </td>
                            <td valign="Middle" align="center">
                                :
                            </td>
                            <td valign="Middle" align="left">
                                <asp:TextBox ID="tbFirstName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="Middle" align="right">
                                Soyad
                            </td>
                            <td valign="Middle" align="center">
                                :
                            </td>
                            <td valign="Middle" align="left">
                                <asp:TextBox ID="tbLastName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td valign="Middle" align="right">
                                Cinsiyet
                            </td>
                            <td valign="Middle" align="center">
                                :
                            </td>
                            <td valign="Middle" align="left">
                                <asp:RadioButtonList ID="rblGender" runat="server" CellSpacing="3" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">Kadın</asp:ListItem>
                                    <asp:ListItem Value="1">Erkek</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr>
                            <td valign="Middle" align="right">
                                Doğum Tarihi
                            </td>
                            <td valign="Middle" align="center">
                                :
                            </td>
                            <td valign="Middle" align="left">
                                <asp:TextBox ID="tbBirthDate" runat="server" MaxLength="10"></asp:TextBox>
                                <asp:CalendarExtender ID="tbBirthDate_CalendarExtender" runat="server" Enabled="True"
                                    Format="dd.MM.yyyy" TargetControlID="tbBirthDate">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:TemplatedWizardStep>
            <asp:CompleteWizardStep runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>
