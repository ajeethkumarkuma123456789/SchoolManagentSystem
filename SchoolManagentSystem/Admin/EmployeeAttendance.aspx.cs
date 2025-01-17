﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagentSystem.Models.CommonFn;

namespace SchoolManagentSystem.Admin
{
    public partial class EmployeeAttendance : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                Attendance();
            }
        }

        private void Attendance()
        {
            DataTable dt = fn.Fetch("Select TeacherId,Name,Mobile,Email from Teacher");
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                int teacherId = Convert.ToInt32(row.Cells[1].Text);
                RadioButton rb1 = (row.Cells[0].FindControl("RadioButton1") as RadioButton);
                RadioButton rb2 = (row.Cells[0].FindControl("RadioButton2") as RadioButton);
                int Status = 0;

                if (rb1.Checked)
                {
                    Status = 1;
                }
                else if (rb2.Checked)
                {
                    Status = 0;
                }
                fn.Query(@"Insert into TeacherAttendance values('" + teacherId + "','" + Status + "'," + "'" + DateTime.Now.ToString("yyyy/MM/dd") + "')");
                lblMsg.Text = "Inserted Successfully!";
                lblMsg.CssClass = "alert alert-success";
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }
    }
}