<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pat_reg.aspx.vb" Inherits="pat_reg" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Patient Registration</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Register a New Patient</p>
            </header>

            <nav style="background-color: #f0f0f0; padding: 10px; margin-bottom: 20px; overflow: hidden;">
                <div style="float: left;">
                    <a href="homePage.aspx">Home</a> | 
                    <a href="departments.aspx">Departments</a> | 
                    <a href="employees.aspx">Our Doctors</a> | 
                    <a href="Appointments.aspx">Book Appointment</a> | 
                    <a href="pat_reg.aspx">Register</a> | 
                    <a href="login.aspx">Staff Login</a> | 
                    <a href="help.aspx">Help</a>
                    <asp:PlaceHolder ID="phAdminLinks" runat="server" Visible="false">
                        | <a href="manage_users.aspx">Manage Users</a>
                    </asp:PlaceHolder>
                </div>
                <div style="float: right;">
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" Visible="false" ForeColor="Red">Logout</asp:LinkButton>
                </div>
            </nav>

            <div class="main_container">
                <div class="new-emp-form">
                    <h2>Patient Registration Form</h2>
                    <div class="form-group">
                        <label>Patient Name:</label>
                        <asp:TextBox ID="txtPatientName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtPatientName" 
                            ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Date of Birth (YYYY-MM-DD):</label>
                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" 
                            ErrorMessage="Date of Birth is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Registered By (Employee ID):</label>
                        <asp:DropDownList ID="ddlEmployees" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvStaff" runat="server" ControlToValidate="ddlEmployees" 
                            InitialValue="" ErrorMessage="Please select a staff member" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    
                    <asp:Button ID="btnRegister" runat="server" Text="Register Patient" OnClick="btnRegister_Click" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>

                <hr />
                <h2>Registered Patients</h2>
                <asp:GridView ID="gvPatients" runat="server" BorderWidth="1"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
