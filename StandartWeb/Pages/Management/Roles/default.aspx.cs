using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StandartWeb.Pages.Management.Roles
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                System.Web.Security.Roles.CreateRole(tbRoleName.Text);
                gv.DataBind();
            }
        }

        protected void gv_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Sil")
            {
                var rn = int.Parse(e.CommandArgument.ToString());
                gv.SelectedIndex = rn;
                var roleName = gv.SelectedValue.ToString();

                if (roleName.ToLower() != "manager" &&
                    roleName.ToLower() != "user")
                {
                    System.Web.Security.Roles.DeleteRole(roleName);

                    gv.DataBind();
                }
            }
        }

        public bool Karsilastir(object o)
        {
            if (o.Equals("Manager")) return false;
            if (o.Equals("User")) return false;
            return true;
        }

        protected void Button1_Command(
            object sender, CommandEventArgs e)
        {
            var roleName = e.CommandArgument.ToString();
            System.Web.Security.Roles.DeleteRole(roleName);
            gv.DataBind();
        }
    }
}
