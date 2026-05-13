Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class manage_users
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Security Check
        If Session("User") Is Nothing OrElse Session("Role") <> "admin" Then
            Response.Redirect("login.aspx")
        End If

        phAdminLinks.Visible = True

        If Not IsPostBack Then
            LoadUsers()
        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("login.aspx")
    End Sub

    Private Sub LoadUsers()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim da As New SqlDataAdapter("SELECT user_id, username, User_password, role_name FROM Users", conn)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvUsers.DataSource = dt
            gvUsers.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error: " & ex.Message
        End Try
    End Sub

    Protected Sub btnAddUser_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "INSERT INTO Users (username, User_password, role_name) VALUES (@user, @pass, @role)"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@user", txtNewUsername.Text)
            cmd.Parameters.AddWithValue("@pass", txtNewPassword.Text)
            cmd.Parameters.AddWithValue("@role", ddlNewRole.SelectedValue)
            
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsg.Text = "User added successfully!"
            LoadUsers()
        Catch ex As Exception
            lblMsg.Text = "Error adding user: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Protected Sub gvUsers_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvUsers.EditIndex = e.NewEditIndex
        LoadUsers()
    End Sub

    Protected Sub gvUsers_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvUsers.EditIndex = -1
        LoadUsers()
    End Sub

    Protected Sub gvUsers_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim userId As String = gvUsers.DataKeys(e.RowIndex).Value.ToString()
        Dim username As String = CType(gvUsers.Rows(e.RowIndex).Cells(1).Controls(0), TextBox).Text
        Dim password As String = CType(gvUsers.Rows(e.RowIndex).Cells(2).Controls(0), TextBox).Text
        Dim role As String = CType(gvUsers.Rows(e.RowIndex).Cells(3).Controls(0), TextBox).Text

        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "UPDATE Users SET username=@user, User_password=@pass, role_name=@role WHERE user_id=@id"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@user", username)
            cmd.Parameters.AddWithValue("@pass", password)
            cmd.Parameters.AddWithValue("@role", role)
            cmd.Parameters.AddWithValue("@id", userId)
            
            conn.Open()
            cmd.ExecuteNonQuery()
            gvUsers.EditIndex = -1
            LoadUsers()
        Catch ex As Exception
            lblMsg.Text = "Error updating: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Protected Sub gvUsers_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim userId As String = gvUsers.DataKeys(e.RowIndex).Value.ToString()
        
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim cmd As New SqlCommand("DELETE FROM Users WHERE user_id=@id", conn)
            cmd.Parameters.AddWithValue("@id", userId)
            conn.Open()
            cmd.ExecuteNonQuery()
            LoadUsers()
        Catch ex As Exception
            lblMsg.Text = "Error deleting: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub
End Class
