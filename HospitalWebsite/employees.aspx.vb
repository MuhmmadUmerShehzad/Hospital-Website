Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class employees
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadEmployees()
            LoadDropdowns()
        End If
    End Sub

    Private Sub LoadEmployees()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "SELECT e.emp_id, e.emp_name, d.dept_name, des.designation_name, e.date_of_birth " & _
                                 "FROM Employees e " & _
                                 "JOIN Departments d ON e.dept_id = d.dept_id " & _
                                 "JOIN Designations des ON e.designation_id = des.designation_id"
            Dim cmd As New SqlCommand(query, conn)
            Dim da As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            da.Fill(dt)
            repEmployees.DataSource = dt
            repEmployees.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error loading employees: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Private Sub LoadDropdowns()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            conn.Open()
            ' Load Departments
            Dim cmdDept As New SqlCommand("SELECT dept_id, dept_name FROM Departments", conn)
            ddlDepts.DataSource = cmdDept.ExecuteReader()
            ddlDepts.DataTextField = "dept_name"
            ddlDepts.DataValueField = "dept_id"
            ddlDepts.DataBind()
            conn.Close()

            ' Load Designations
            conn.Open()
            Dim cmdDes As New SqlCommand("SELECT designation_id, designation_name FROM Designations", conn)
            ddlDesignations.DataSource = cmdDes.ExecuteReader()
            ddlDesignations.DataTextField = "designation_name"
            ddlDesignations.DataValueField = "designation_id"
            ddlDesignations.DataBind()
        Catch ex As Exception
            lblMsg.Text = "Error loading dropdowns: " & ex.Message
        Finally
            conn.Close()
        End Try
    End Sub

    Protected Sub btnAddEmp_Click(sender As Object, e As EventArgs)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("HospitalDB").ConnectionString
        Dim conn As New SqlConnection(connStr)
        Try
            Dim query As String = "INSERT INTO Employees (dept_id, designation_id, emp_name, date_of_birth) VALUES (@dept, @des, @name, @dob)"
            Dim cmd As New SqlCommand(query, conn)
            cmd.Parameters.AddWithValue("@dept", ddlDepts.SelectedValue)
            cmd.Parameters.AddWithValue("@des", ddlDesignations.SelectedValue)
            cmd.Parameters.AddWithValue("@name", txtEmpName.Text)
            cmd.Parameters.AddWithValue("@dob", txtDOB.Text)
            
            conn.Open()
            cmd.ExecuteNonQuery()
            lblMsg.Text = "Employee added successfully!"
            lblMsg.ForeColor = System.Drawing.Color.Green
            LoadEmployees() ' Refresh list
        Catch ex As Exception
            lblMsg.Text = "Error adding employee: " & ex.Message
            lblMsg.ForeColor = System.Drawing.Color.Red
        Finally
            conn.Close()
        End Try
    End Sub
End Class
