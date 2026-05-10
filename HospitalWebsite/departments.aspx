<%@ Page Language="VB" AutoEventWireup="false" CodeFile="departments.aspx.vb" Inherits="departments" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital Departments</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Our Departments</p>
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
                <h2>Hospital Departments</h2>

                <asp:GridView ID="gvDepartments" runat="server" AutoGenerateColumns="False" BorderWidth="1">
                    <Columns>
                        <asp:BoundField DataField="dept_id" HeaderText="Dept ID" />
                        <asp:BoundField DataField="dept_name" HeaderText="Department Name" />
                        <asp:BoundField DataField="emp_name" HeaderText="Head of Department" />
                    </Columns>
                </asp:GridView>

                <br />
                <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
