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
    public partial class ClassFees : System.Web.UI.Page
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
                GetClass();
                GetFees();
            }
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
                string ClassVal = ddlclass.SelectedItem.Text;
                DataTable dt = fn.Fetch("select * from Fees where ClassId ='" + ddlclass.SelectedItem.Value + "'");
                if (dt.Rows.Count == 0)
                {
                    string query = "insert into Fees values('" + ddlclass.SelectedItem.Value + "','" + txtFeeAmount.Text.Trim() + "')";
                    fn.Query(query);
                    lblMsg.Text = "Insert successfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddlclass.SelectedIndex = 0;
                    txtFeeAmount.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Enetr Class already exists! for <b>'" + ClassVal + "'</b>";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        private void GetFees()
        {
            DataTable dt = fn.Fetch(@"select ROW_NUMBER() over(Order by (Select 1)) as [Sr.No],f.FeesId,f.ClassId,c.ClassName,f.FeesAmount from Fees f inner join Class c on c.ClassId = f.ClassId");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetFees();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetFees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete from Fees where FeesId='" + feesId + "'");
                lblMsg.Text = "Fees Deleted successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetFees();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feesId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string feeAmt = (row.FindControl("TextBox1") as TextBox).Text;
                fn.Query("Update Fees set FeesAmount = '" + feeAmt.Trim() + "' where FeesId ='" + feesId + "' ");
                lblMsg.Text = "Fees updated successfully";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetFees();
            }
            catch (Exception ex)
            {

                Response.Write("<script>alert('" + ex.Message + "')</script>");
            }
        }
    }
}