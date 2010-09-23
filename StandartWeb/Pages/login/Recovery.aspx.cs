using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace StandartWeb.Pages.login
{
    public partial class Recovery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void PasswordRecovery1_SendingMail(
            object sender, MailMessageEventArgs e)
        {
            SmtpClient sc = new SmtpClient();
            sc.Send(e.Message);
        }
    }
}
