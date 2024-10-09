<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMst.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="SchoolManagentSystem.Admin.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <div class="container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
            </div>
            <h3 class="text-center">ADD STUDENT</h3>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:Label ID="Label2" for="txtName" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="txtName" CssClass="form-control" runat="server" placeholder="Enter Name" Required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Name Should be in characters"
                        ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtName">
                    </asp:RegularExpressionValidator>

                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label1" for="txtDoB" runat="server" Text="Date Of Birth"></asp:Label>
                    <asp:TextBox ID="txtDoB" CssClass="form-control" runat="server" TextMode="Date" Required="required"></asp:TextBox>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:Label ID="Label3" for="ddlGender" runat="server" Text="Gender"></asp:Label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">SELECT GENDER</asp:ListItem>
                        <asp:ListItem>MALE</asp:ListItem>
                        <asp:ListItem>FEMALE</asp:ListItem>
                        <asp:ListItem>OTHER</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Gender is Required"
                        ForeColor="Red" ControlToValidate="ddlGender" InitialValue="SELECT GENDER" Display="Dynamic" SetFocusOnError="true">
                    </asp:RequiredFieldValidator>

                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label4" for="txtMobile" runat="server" Text="Conduct Number"></asp:Label>
                    <asp:TextBox ID="txtMobile" CssClass="form-control" runat="server" TextMode="Number" Placeholder="Enter MobileNumber" Required="required"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Invalid Mobile Number" ForeColor="Red"
                        ValidationExpression="[0-9]{10}" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtMobile">
                    </asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:Label ID="Label5" for="txtRoll" runat="server" Text="Roll Number"></asp:Label>
                    <asp:TextBox ID="txtRoll" CssClass="form-control" runat="server" placeholder="Enter Roll Number" Required="required"></asp:TextBox>
                </div>
                <div class="col-md-6">
                    <asp:Label ID="Label6" for="ddlClass" runat="server" Text="Class"></asp:Label>
                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Class is Required" ControlToValidate="ddlclass" ForeColor="Red"
                        InitialValue="Select Class" SetFocusOnError="True">
                    </asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-12">
                    <asp:Label ID="Label7" for="txtAddress" runat="server" Text="Address"></asp:Label>
                    <asp:TextBox ID="txtAddress" CssClass="form-control" runat="server" placeholder="Enter Address" TextMode="MultiLine" Required="required"></asp:TextBox>
                </div>

            </div>


            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#55558C9" Text="ADD STUDENT" OnClick="btnAdd_Click" />
                </div>
            </div>








            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-8">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" PageSize="4" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display"
                        AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" DataKeyNames="StudentId" OnRowDataBound="GridView1_RowDataBound">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="S.NO" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="NAME">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("Name") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="MOBILE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtMobile" runat="server" Text='<%#Eval("Mobile") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblMobile" runat="server" Text='<%#Eval("Mobile") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ROLL NUMBER">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtRollNo" runat="server" Text='<%#Eval("RollNo") %>' CssClass="form-control" Width="100px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblRollNo" runat="server" Text='<%#Eval("RollNo") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="CLASS">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlClass" runat="server" CssClass="form-control" width="120px"></asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblClass" runat="server" Text='<%#Eval("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="ADDRESS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAddress" runat="server"  Text='<%#Eval("Address") %>' CssClass="form-control" Width="200px"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>




                            <asp:CommandField CausesValidation="false" ButtonType="Button" HeaderText="OPERATION" ShowEditButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle BackColor="#55558C9" />
                    </asp:GridView>
                </div>
            </div>
        </div>

    </div>

</asp:Content>
