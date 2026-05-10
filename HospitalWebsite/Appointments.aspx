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
                    <h2>Book New Appointment</h2>
                    <div class="form-group">
                        <label>Patient:</label>
                        <asp:DropDownList ID="ddlPatients" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Doctor:</label>
                        <asp:DropDownList ID="ddlDoctors" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Appointment Date & Time (YYYY-MM-DD HH:MM):</label>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Reason / Diagnosis:</label>
                        <asp:TextBox ID="txtDiagnosis" runat="server"></asp:TextBox>
                    </div>
                    
                    <asp:Button ID="btnBook" runat="server" Text="Book Appointment" OnClick="btnBook_Click" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>

                <hr />
                <h2>Upcoming Appointments</h2>
                <asp:GridView ID="gvAppointments" runat="server" BorderWidth="1"></asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
