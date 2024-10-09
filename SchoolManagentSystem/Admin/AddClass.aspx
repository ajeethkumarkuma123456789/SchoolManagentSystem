<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="SchoolManagentSystem.Admin.AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            </div>
            <h3 class="text-center">NEW CLASS</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:Label ID="Label2" for="txtClass" runat="server" Text="Class Name"></asp:Label>
                    <asp:TextBox ID="txtClass" CssClass="form-control" runat="server" placeholder="Enter Class Name" Required="required"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#55558C9" Text="ADD CLASS" OnClick="btnAdd_Click" />
                </div>
            </div>
             <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                 <div class="col-md-6">
                     <asp:GridView ID="GridView1" runat="server" cssClass="table table-hover table-bordered" DataKeyNames="ClassId" AutoGenerateColumns="False" EmptyDataText="No Record To Display" 
                         OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                         OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="true" PageSize="4">
                         <Columns>
                             <asp:BoundField DataField="Sr.No" HeaderText="S.NO" ReadOnly="True">
                             <ItemStyle HorizontalAlign="Center" />
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="CLASS">
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                                 </EditItemTemplate>
                                 <ItemTemplate>
                                     <asp:Label ID="lblClassName"  runat="server" Text='<%#Eval("ClassName") %>'></asp:Label>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" />
                             </asp:TemplateField>
                             <asp:CommandField ButtonType="Button" CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
                         </Columns>


                         <HeaderStyle  BackColor="#5583c9" ForeColor="White"/>
                     </asp:GridView>
                 </div>
            </div>


        </div>

    </div>
</asp:Content>
