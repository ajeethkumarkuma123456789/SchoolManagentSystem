﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagentSystem.Models.CommonFn;

namespace SchoolManagentSystem.Teacher
{
    public partial class StudentAttendance : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["staff"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            if (!IsPostBack)
            {
                GetClass();
                btnMarkAttendance.Visible = false;
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            lblTime.Text = DateTime.Now.ToString();
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("Select * from Class");
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "ClassName";
            ddlclass.DataValueField = "ClassId";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, "Select Class");

        }

        protected void ddlclass_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ClassId = ddlclass.SelectedValue;

            DataTable dt = fn.Fetch("Select * from Subject where ClassId='" + ClassId + "'");
            ddlSubject.DataSource = dt;
            ddlSubject.DataTextField = "SubjectName";
            ddlSubject.DataValueField = "SubjectId";
            ddlSubject.DataBind();
            ddlSubject.Items.Insert(0, "Select Subject");

        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            DataTable dt = fn.Fetch(@"Select StudentId,RollNo,Name,Mobile from Student where ClassId='" + ddlclass.SelectedValue + "'");

            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (dt.Rows.Count > 0)
            {
                btnMarkAttendance.Visible = true;
            }
            else
            {
                btnMarkAttendance.Visible = false;
            }
        }

        protected void btnMarkAttendance_Click(object sender, EventArgs e)
        {
            bool isTrue = false;
            foreach (GridViewRow row in GridView1.Rows)
            {
                string rollNo = row.Cells[2].Text.Trim();
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
                fn.Query(@"Insert into StudentAttendance values('" + ddlclass.SelectedValue + "','" + ddlSubject.SelectedValue + "','" + rollNo + "','" + Status + "'," + "'" + DateTime.Now.ToString("yyyy/MM/dd") + "')");

                isTrue = true;

                if (isTrue)
                {
                    lblMsg.Text = "Inserted Successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Something went wrong!";
                    lblMsg.CssClass = "alert alert-warning";
                }
            }
        }
    }
}