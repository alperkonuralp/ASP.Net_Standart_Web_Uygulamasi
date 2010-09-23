using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace StandartWeb.Pages.login
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) CreateUserWizard1.ActiveStepIndex = 0;
        }

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            Roles.AddUserToRole(CreateUserWizard1.UserName, "User");
        }

        protected void CreateUserWizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
        {
            using (var datas = new DataLayer.StandartWebDataContext())
            {
                var u = (from a in datas.aspnet_Users
                         where a.UserName == CreateUserWizard1.UserName
                         select a).FirstOrDefault();
                if (u != null)
                {
                    u.TUserProfile.FirstName = tbFirstName.Text;
                    u.TUserProfile.LastName = tbLastName.Text;
                    u.TUserProfile.Gender = (byte)rblGender.SelectedIndex;
                    DateTime dt;
                    if (DateTime.TryParse(tbBirthDate.Text, out dt))
                    {
                        u.TUserProfile.BirthDate = dt;
                    }
                    else
                    {
                        u.TUserProfile.BirthDate = null;
                    }

                    datas.SubmitChanges();
                }
            }
        }

        public TextBox tbFirstName
        {
            get
            {
                return ((TemplatedWizardStep)CreateUserWizard1.WizardSteps[1]).ContentTemplateContainer.FindControl("tbFirstName") as TextBox;
            }
        }

        public TextBox tbLastName
        {
            get
            {
                return ((TemplatedWizardStep)CreateUserWizard1.WizardSteps[1]).ContentTemplateContainer.FindControl("tbLastName") as TextBox;
            }
        }

        public RadioButtonList rblGender
        {
            get
            {
                return ((TemplatedWizardStep)CreateUserWizard1.WizardSteps[1]).ContentTemplateContainer.FindControl("rblGender") as RadioButtonList;
            }
        }

        public TextBox tbBirthDate
        {
            get
            {
                return ((TemplatedWizardStep)CreateUserWizard1.WizardSteps[1]).ContentTemplateContainer.FindControl("tbBirthDate") as TextBox;
            }
        }

        protected void CreateUserWizard1_ActiveStepChanged(object sender, EventArgs e)
        {

        }
    }
}
