<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StudentAttendanceUC.ascx.cs" Inherits="SchoolManagentSystem.StudentAttendanceUC" %>


<div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
    <div class="container p-md-4 p-sm-4">

        <div>
            <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
        </div>

        <h3 class="text-center">Student Attendance Details</h3>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <asp:Label ID="Label2" for="ddlclass" runat="server" Text="Class"></asp:Label>
                <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required" ControlToValidate="ddlclass" ForeColor="Red"
                    InitialValue="Select Class" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <asp:Label ID="Label1" for="ddlSubject" runat="server" Text="Subject"></asp:Label>
                <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control"></asp:DropDownList>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Subject is Required" ControlToValidate="ddlSubject" ForeColor="Red"
                    InitialValue="Select Subject" SetFocusOnError="True">
                </asp:RequiredFieldValidator>--%>
            </div>
        </div>
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <asp:Label ID="Label3" for="txtRollNo" runat="server" Text="Roll Number"></asp:Label>
                <asp:TextBox ID="txtRollNo" runat="server" CssClass="form-control" Placeholder="Enter the RollNo"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RollNo is Required" ControlToValidate="txtRollNo" ForeColor="Red"
                    InitialValue="Select Class" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>

            <div class="col-md-6">
                <asp:Label ID="Label4" for="txtMonth" runat="server" Text="Month"></asp:Label>
                <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" TextMode="Month"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Month is Required" ControlToValidate="txtMonth" ForeColor="Red"
                    InitialValue="Select Class" SetFocusOnError="True">
                </asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-3 col-md-offset-2 mb-3">
                <asp:Button ID="btnCheckAttendance" runat="server" CssClass="btn btn-primary btn-block" BackColor="#55558C9" Text="Check Attendance" onClick="btnCheckAttendance_Click"/>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="Sr.No" HeaderText="S.NO">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="Name" HeaderText="Name">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="label1" Text='<%#Boolean.Parse(Eval("Status").ToString())?"Present" :"Absent" %>'> </asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd MMMM yyyy}">
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>


                    </Columns>
                    <HeaderStyle BackColor="#55558C9" ForeColor="White" />
                </asp:GridView>
            </div>
        </div>
    </div>

</div>
