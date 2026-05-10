Imports System.Data.SqlClient
Imports System.Configuration

Partial Class login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        
        Try
            conn.Open()
            Dim query As String = "SELECT COUNT(*) FROM Users WHERE username = @user AND User_password = @pass"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@user", txtUsername.Text)
            cmd.Parameters.AddWithValue("@pass", txtPassword.Text)
            
            Dim count As Integer = Convert.ToInt32(cmd.ExecuteScalar())
            
            If count > 0 Then
                ' Successful login
                Session("User") = txtUsername.Text
                Response.Redirect("homePage.aspx")
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
