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

            <nav>
                <ul>
                    <li><a href="homePage.aspx">Home</a></li>
                    <li><a href="departments.aspx">Departments</a></li>
                    <li><a href="employees.aspx">Our Doctors</a></li>
                    <li><a href="Appointments.aspx">Book Appointment</a></li>
                    <li><a href="pat_reg.aspx">Register</a></li>
                    <li><a href="login.aspx">Staff Login</a></li>
                    <li><a href="help.aspx">Help</a></li>
                </ul>
            </nav>

            <div class="main_container">
                <div class="new-emp-form">
                    <h2>Patient Registration Form</h2>
                    <div class="form-group">
                        <label>Patient Name:</label>
                        <asp:TextBox ID="txtPatientName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Date of Birth (YYYY-MM-DD):</label>
                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Registered By (Employee ID):</label>
                        <asp:DropDownList ID="ddlEmployees" runat="server"></asp:DropDownList>
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
