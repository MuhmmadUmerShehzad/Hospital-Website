Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class departments
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadDepartments()
        End If
    End Sub

    Private Sub LoadDepartments()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        
        Try
            Dim query As String = "SELECT d.dept_id, d.dept_name, e.emp_name " & _
                                 "FROM Departments d " & _
                                 "LEFT JOIN Employees e ON d.HOD_emp_id = e.emp_id"
            
            Dim cmd As New SqlCommand(query, conn)
            Dim da As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            
            da.Fill(dt)
            
            gvDepartments.DataSource = dt
            gvDepartments.DataBind()
            
        Catch ex As Exception
            lblError.Text = "Error: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub
End Class
