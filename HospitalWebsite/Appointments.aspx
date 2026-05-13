<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Appointments.aspx.vb" Inherits="Appointments" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Book Appointment</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Book Your Appointment</p>
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
                    <h2>Book New Appointment</h2>
                    <div class="form-group">
                        <label>Patient:</label>
                        <asp:DropDownList ID="ddlPatients" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvPat" runat="server" ControlToValidate="ddlPatients" 
                            InitialValue="" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Doctor:</label>
                        <asp:DropDownList ID="ddlDoctors" runat="server"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvDoc" runat="server" ControlToValidate="ddlDoctors" 
                            InitialValue="" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Date:</label>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDate" runat="server" ControlToValidate="txtDate" 
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label>Diagnosis:</label>
                        <asp:TextBox ID="txtDiagnosis" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDiag" runat="server" ControlToValidate="txtDiagnosis" 
                            ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Button ID="btnBook" runat="server" Text="Book Appointment" OnClick="btnBook_Click" />
                    <br /><asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
                <hr />
                <h2>Upcoming Appointments</h2>
                <asp:GridView ID="gvAppointments" runat="server" BorderWidth="1"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
