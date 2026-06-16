Imports System.Data.SqlClient
Imports System.Configuration

Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            conn.Open()
            Dim query As String = "SELECT role_name FROM Users WHERE username = @user AND User_password = @pass"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@user", txtUsername.Text)
            cmd.Parameters.AddWithValue("@pass", txtPassword.Text)
            
            Dim role As Object = cmd.ExecuteScalar()
            
            If role IsNot Nothing Then
                Session("User") = txtUsername.Text
                Session("Role") = role.ToString()
                Response.Redirect("homePage.aspx?login=success&user=" & Server.UrlEncode(txtUsername.Text))
            Else
                lblMessage.Text = "Invalid username or password."
            End If
        Catch ex As Exception
            lblMessage.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub
End Class
