﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagentSystem.Models.CommonFn;

namespace SchoolManagentSystem
{
    public partial class Login : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btntogin_Click(object sender, EventArgs e)
        {


            string email = inputEmail.Value.Trim();
            string password = inputPassword.Value.Trim();
            DataTable dt = fn.Fetch("select * from Teacher where Email='" + email + "' and password='" + password + "'");
            if (email == "Admin" && password == "123")
            {
                Session["admin"] = email;
                Response.Redirect("Admin/AdminHome.aspx");
            }
            else if (dt.Rows.Count > 0)
            {
                Session["staff"] = email;
                Response.Redirect("Teacher/TeacherHome.aspx");
            }
            else
            {
                lblMsg.Text = "Login Failled!";
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}