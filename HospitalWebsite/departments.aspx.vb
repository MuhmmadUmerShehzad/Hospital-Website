Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class departments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") IsNot Nothing Then
            btnLogout.Visible = True
            If Session("Role") = "admin" Then
                phAdminLinks.Visible = True
            End If
        End If
        
        If Not IsPostBack Then
            LoadDepartments()
        End If
    End Sub

    Protected Sub btnLogout_Click(sender As Object, e As EventArgs)
        Session.Abandon()
        Response.Redirect("login.aspx")
    End Sub

    Private Sub LoadDepartments()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "SELECT d.dept_id, d.dept_name, e.emp_name FROM Departments d LEFT JOIN Employees e ON d.HOD_emp_id = e.emp_id"
            Dim da As New SqlDataAdapter(query, conn)
            Dim dt As New DataTable()
            da.Fill(dt)
            gvDepartments.DataSource = dt
            gvDepartments.DataBind()
        Catch ex As Exception
            lblError.Text = "Error: " & ex.Message
        End Try
    End Sub
End Class
