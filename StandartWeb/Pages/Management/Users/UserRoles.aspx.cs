using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StandartWeb.Pages.Management.Users
{
    public partial class UserRoles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) CheckBoxListDataBind();
        }

        protected void ddl_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckBoxListDataBind();
        }


        protected void CheckBoxListDataBind()
        {
            if (ddl.SelectedIndex < 0)
            {
                ddl.DataBind();
                ddl.SelectedIndex = 0;
            }

            var userName = ddl.SelectedValue;

            var dizi = System.Web.Security.Roles.GetRolesForUser(userName);

            CheckBoxList1.DataBind();

            foreach (ListItem item in CheckBoxList1.Items)
            {
                item.Selected = dizi.Contains(item.Text);
            }
        }

        protected void CheckBoxList1_SelectedIndexChanged(
            object sender, EventArgs e)
        {
            var userName = ddl.SelectedValue;

            var dizi = System.Web.Security.Roles.GetRolesForUser(userName);


            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    // 1. Rol seçilmiş

                    if (dizi.Contains(item.Text))
                    {
                        // a. Rol öncedende var
                    }
                    else
                    {
                        // b. Rol yeni girilmiş
                        System.Web.Security.Roles.AddUserToRole(
                            userName, item.Text);
                    }
                }
                else
                {
                    // 2. rol seçilmemiş

                    if (!dizi.Contains(item.Text))
                    {
                        // a. rol öncedende yok
                    }
                    else
                    {
                        // b. rol kaldırılmış
                        System.Web.Security.Roles.RemoveUserFromRole(
                            userName, item.Text);
                    }

                    
                }
            }
        }
    }
}
