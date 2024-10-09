<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarksDetailUserControl.ascx.cs" Inherits="SchoolManagentSystem.MarksDetailUserControl" %>

  <div style="width: 100%; height: 720px; background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
      <div class="container p-md-4 p-sm-4">
          <div>
              <asp:Label ID="lblMsg" runat="server" Text="Label"></asp:Label>
          </div>
          <h3 class="text-center">MARKS DETAILS</h3>

          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-6">
                  <asp:Label ID="Label2" for="ddlclass" runat="server" Text="Class"></asp:Label>
                  <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control"></asp:DropDownList>
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Class is Required" ControlToValidate="ddlclass" ForeColor="Red"
                      InitialValue="Select Class" SetFocusOnError="True">
                  </asp:RequiredFieldValidator>
              </div>
              <div class="col-md-6">
                  <asp:Label ID="Label1" for="txtFeeAmount" runat="server" Text="Student Roll Number"></asp:Label>
                  <asp:TextBox ID="txtRoll" CssClass="form-control" runat="server" placeholder="Enter Student Roll Number" Required="required"></asp:TextBox>
              </div>
          </div>
          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-3 col-md-offset-2 mb-3">
                  <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#55558C9" Text="GET MARKS" OnClick="btnAdd_Click" />
              </div>
          </div>
          <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
              <div class="col-md-12">
                  <asp:GridView ID="GridView1" runat="server" AllowPaging="true" PageSize="8" CssClass="table table-hover table-bordered" EmptyDataText="No Record To Display"
                      AutoGenerateColumns="False" OnPageIndexChanging="GridView1_PageIndexChanging">
                      <Columns>
                          <asp:BoundField DataField="Sr.No" HeaderText="S.NO">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="ExamId" HeaderText="ExamId">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>


                          <asp:BoundField DataField="ClassName" HeaderText="CLASS">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="SubjectName" HeaderText="SUBJECT">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="RollNo" HeaderText="RollNo">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="TotalMarks" HeaderText="Total Marks">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                          <asp:BoundField DataField="OutOfMarks" HeaderText="Out Of Marks">
                              <ItemStyle HorizontalAlign="Center" />
                          </asp:BoundField>

                      </Columns>
                      <HeaderStyle BackColor="#5583c9" ForeColor="White" />
                  </asp:GridView>
              </div>
          </div>


      </div>

  </div>
