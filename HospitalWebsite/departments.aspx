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
