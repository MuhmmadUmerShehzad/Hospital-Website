<%@ Page Language="VB" AutoEventWireup="false" CodeFile="homePage.aspx.vb" Inherits="homePage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hospital Home</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Your Health, Our Priority</p>
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
                <div class="homeBox">
                    <h2>Welcome to our Hospital</h2>
                    <p>Providing Quality Healthcare Services with Compassion and Excellence</p>
                </div>

                <div class="about-section">
                    <h2>About Hospital</h2>
                    <p>
                        HospitalDB is committed to providing exceptional healthcare services to our community.
                    </p>
                </div>

                <div class="info-section">
                    <h2>Contact Information</h2>
                    <p><strong>Emergency:</strong> 911 / 24/7 Available</p>
                    <p><strong>Appointments:</strong> +1 (555) 123-4567</p>
                </div>
                
                <footer>
                    <p>&copy; 2026 HospitalDB. All Rights Reserved.</p>
                </footer>
            </div>
        </div>
    </form>
</body>
</html>
