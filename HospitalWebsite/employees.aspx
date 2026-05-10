<%@ Page Language="VB" AutoEventWireup="false" CodeFile="employees.aspx.vb" Inherits="employees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Our Doctors & Staff</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Employee Details Page</p>
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
                <h2>Our Employees</h2>

                <div class="employee-info">
                    <asp:Repeater ID="repEmployees" runat="server">
                        <ItemTemplate>
                            <div class="emp_card" style="border: 1px solid #ccc; padding: 10px; margin: 10px; display: inline-block; width: 250px; vertical-align: top;">
                                <h2><%# Eval("emp_name") %></h2>
                                <p><strong>Employee ID:</strong> <%# Eval("emp_id") %></p>
                                <p><strong>Department:</strong> <%# Eval("dept_name") %></p>
                                <p><strong>Designation:</strong> <%# Eval("designation_name") %></p>
                                <p><strong>DOB:</strong> <%# Eval("date_of_birth", "{0:d}") %></p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <hr />

                <div class="new-emp-form">
                    <h2>Add New Employee</h2>
                    <div class="form-group">
                        <label>Name:</label>
                        <asp:TextBox ID="txtEmpName" runat="server"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Department:</label>
                        <asp:DropDownList ID="ddlDepts" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>Designation:</label>
                        <asp:DropDownList ID="ddlDesignations" runat="server"></asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label>DOB (YYYY-MM-DD):</label>
                        <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnAddEmp" runat="server" Text="Add Employee" OnClick="btnAddEmp_Click" />
                    <br />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
