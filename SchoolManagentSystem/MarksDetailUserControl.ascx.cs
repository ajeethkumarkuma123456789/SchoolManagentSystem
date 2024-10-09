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
    public partial class MarksDetailUserControl : System.Web.UI.UserControl
    {
        CommonFnx fn = new CommonFnx();

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["admin"] == null)
            //{
            //    Response.Redirect("../Login.aspx");
            //}
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetFees()
        {
            DataTable dt = fn.Fetch(@"select ROW_NUMBER() over(Order by (Select 1)) as [Sr.No],e.ExamId,e.ClassId,c.ClassName,
                                        e.SubjectId,s.SubjectName,e.RollNo,e.TotalMarks,e.OutOfMarks from Exam e 
                                         inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId=e.SubjectId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void GetClass()
        {
            DataTable dt = fn.Fetch("select * from Class");
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "ClassName";
            ddlclass.DataValueField = "ClassId";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, "Select Class");

        }



        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classId = ddlclass.SelectedValue;
                string rollNo = txtRoll.Text.Trim();
                DataTable dt = fn.Fetch(@"select ROW_NUMBER() over(Order by (Select 1)) as [Sr.No],e.ExamId,e.ClassId,c.ClassName,
                                        e.SubjectId,s.SubjectName,e.RollNo,e.TotalMarks,e.OutOfMarks from Exam e 
                                         inner join Class c on c.ClassId = e.ClassId inner join Subject s on s.SubjectId=e.SubjectId
                                          where e.ClassId='" + classId + "' and e.RollNo='" + rollNo + "'");

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex= e.NewPageIndex;
        }
    }
}