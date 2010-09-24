using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.Web.Security;

namespace StandartWeb.DataLayer
{
    [DataObject(true)]
    public class RoleDataManager
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public RoleData[] GetRoles()
        {
            // linq kullanımı
            //return (from a in Roles.GetAllRoles()
            //        select new RoleData() { RoleName = a }).ToArray();

            // linq kullanımı 2
            return Roles.GetAllRoles()
                .Select(x => new RoleData { RoleName = x })
                .ToArray();


            // normal yöntem
            //var a = Roles.GetAllRoles();
            //var b = new RoleData[a.Length];

            //for (int i = 0; i < a.Length; i++)
            //{
            //    //b[i] = new RoleData() { RoleName = a[i] };
            //    b[i] = new RoleData();
            //    b[i].RoleName = a[i];
            //}
            //return b;
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public RoleData[] GetUserRoles(string userName)
        {
            var dizi = Roles.GetRolesForUser(userName);

            return (from a in dizi
                    select new RoleData() { RoleName = a }).ToArray();
        }


    }

    public class RoleData
    {
        public string RoleName { get; set; }
    }
}
