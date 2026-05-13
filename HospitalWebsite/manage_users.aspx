<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_users.aspx.vb" Inherits="manage_users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>User Management (Admin Only)</p>
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
                    <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" ForeColor="Red">Logout</asp:LinkButton>
                </div>
            </nav>

            <div class="main_container">
                <h2>System Users</h2>
                <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="user_id" 
                    OnRowEditing="gvUsers_RowEditing" 
                    OnRowCancelingEdit="gvUsers_RowCancelingEdit" 
                    OnRowUpdating="gvUsers_RowUpdating" 
                    OnRowDeleting="gvUsers_RowDeleting"
                    BorderWidth="1">
                    <Columns>
                        <asp:BoundField DataField="user_id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="username" HeaderText="Username" />
                        <asp:BoundField DataField="User_password" HeaderText="Password" />
                        <asp:BoundField DataField="role_name" HeaderText="Role" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>

                <hr />
                <h2>Add New User</h2>
                <div class="form-group">
                    <label>Username:</label>
                    <asp:TextBox ID="txtNewUsername" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Role:</label>
                    <asp:DropDownList ID="ddlNewRole" runat="server">
                        <asp:ListItem Value="admin">Admin</asp:ListItem>
                        <asp:ListItem Value="employee">Employee</asp:ListItem>
                        <asp:ListItem Value="doctor">Doctor</asp:ListItem>
                        <asp:ListItem Value="patient">Patient</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Button ID="btnAddUser" runat="server" Text="Add User" OnClick="btnAddUser_Click" />
                <br />
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
