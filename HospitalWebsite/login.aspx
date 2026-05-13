<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Staff Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <header>
                <h1>HospitalDB</h1>
                <p>Login Page for Staff</p>
            </header>

            <div class="main_container">
                <div class="login-form">
                    <h2>Login</h2>
                    
                    <div class="form-group">
                        <label>Username:</label>
                        <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label>Password:</label>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <br />
                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>