using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static SchoolManagentSystem.Models.CommonFn;

namespace SchoolManagentSystem
{
    public partial class StudentAttendanceUC : System.Web.UI.UserControl
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["staff"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
            //}
            if (!IsPostBack)
            {
               GetClass();
            }
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

        protected void btnCheckAttendance_Click(object sender, EventArgs e)
        {
            DataTable dt;
            DateTime date = Convert.ToDateTime(txtMonth.Text);

            if (ddlSubject.SelectedValue=="Select Subject")
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() over(Order by (Select 1)) as [Sr.No],s.Name,sa.Status,sa.Date from StudentAttendance sa 
                                inner join Student s on s.RollNo =sa.RollNo where sa.ClassId='"+ddlclass.SelectedValue+"' and " + 
                                "sa.RollNo='"+txtRollNo.Text.Trim()+"' and DATEPART(yy,Date)='" + date.Year + "' and " +
                                "DATEPART(M,Date)='" + date.Month + "' and sa.Status=1");
            }
            else
            {
                dt = fn.Fetch(@"Select ROW_NUMBER() over(Order by (Select 1)) as [Sr.No],s.Name,sa.Status,sa.Date from StudentAttendance sa 
                                inner join Student s on s.RollNo =sa.RollNo where sa.ClassId='" + ddlclass.SelectedValue + "' and " +
                                "sa.RollNo='" + txtRollNo.Text.Trim() + "' and SubjectId='"+ddlSubject.SelectedValue+"' and " +
                                "DATEPART(yy,Date)='" + date.Year + "' and " + "DATEPART(M,Date)='" + date.Month + "' and sa.Status=1");
            }

           

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}